#' Set function argument defaults to global variables
#'
#' Useful for development, where you want to quickly initialize default values
#' for a function while editing its internal code.
#' 
#' Note the lack of parentheses at the end of the function
#' (to avoid calling it).
#' 
#' @param fn The function for which you want to convert its default
#' argument values into global variables.
#' Can be one of:
#' \itemize{
#' \item{"current" or NULL (default)}{Identifies which file is currently active 
#' within your Rstudio IDE. Then searches for any functions that are defined within 
#' that file and runs \link{args2vars} on each of them. In this case, 
#' the listed returned to the user will be nested by each function name.}
#' \item{File path}{Works the same as "current" except the user can define which
#'  R source file to search for functions within 
#'  (e.g. \code{"path/to/file.R"}).}
#' \item{\link[base]{function}}{A literal R function
#'  (e.g. \code{function(x) x+1}), or \code{utils::packageDate}}
#' \item{"parent"}{The function within which \link{args2vars} was called.}
#' }
#' @param remove If \code{TRUE}, will remove globals 
#' assigned by \code{args2vars} (if supplying the same \code{fn} as before).
#' If the global does not exist, it will be skipped.
#' @param run_source_all Source all R scripts first.
#' @param reassign If a global variable of the same name already exists, 
#' reassign its value anyway.
#' @param set_dots Set the \code{...} variable to the value of \code{set_dots}.
#' @param parent_fn The function within which \code{args2vars} was called.
#' Only used when \code{fn="parent"}.
#' @inheritParams base::assign
#' @inheritDotParams source_all
#' @returns A named list with each argument's default value, or simply a
#' \link[base]{stop} function declaring "No default".
#' 
#' @export
#' @importFrom methods is
#' @importFrom rlang fn_fmls
#' @examples 
#' args2vars(fn = utils::packageDate)
args2vars <- function(fn = "current", 
                      remove = FALSE, 
                      envir = .GlobalEnv,
                      reassign = TRUE,
                      run_source_all = TRUE,
                      set_dots = NULL,
                      parent_fn=sys.function(sys.parent()),
                      ...){ 
  # devoptera::args2vars(args2vars)
  
  #### Source all files ####
  if(isTRUE(run_source_all)) source_all(...)
  #### Get the function(s) ####
  if(is.function(fn)){
    ## Get the name of the function BEFORE it was assigned to the "fn" variable 
    ## (i.e. the name of the function in the calling environment).
    messager("Using input function.")
    fn_name <- as.character(substitute(fn))
  } else if(is.character(fn) && 
            fn=="parent"){
    messager("Using parent function.")
    #### Use function from calling environment if not supplied #### 
    print(parent_fn)
    fn <- parent_fn
    fn_name <- as.character(substitute(parent_fn))
  } else if(is.null(fn) || 
            (is.character(fn) && 
             (fn=="current"||file.exists(fn)))){
    messager("Using functions in current file.")
    if(is.null(fn) || fn=="current"){
      path <- current_file()
    } else if(file.exists(fn)) {
      path <- fn
    } 
    if(isTRUE(run_source_all)) for(p in path) source(p)
    all_fns <- list_functions(path) 
    messager("Found",length(all_fns),"functions in file:",path)
    fn_name <- as.character(all_fns)
    #### Use recursion when multiple functions ####
    out <- lapply(stats::setNames(fn_name,fn_name),
                  function(f){
      fn <- get(f, envir = envir)
      args2vars(fn = fn, 
                remove = remove, 
                envir = envir,
                reassign = reassign,
                run_source_all = run_source_all,
                set_dots = set_dots,
                ...)
    })
    return(out) 
  }
  #### Get full function name ####
  if(length(fn_name)==3) {
    fn_name <- paste0(fn_name[2],fn_name[1],fn_name[3])
  } 
  #### Assign dot params ####
  if(!isFALSE(set_dots)) {
    messager("Assigning '...' to",shQuote(deparse(set_dots)))
    assign(x = "...",
           value = set_dots,
           pos = envir,
           envir = envir)
  }
  #### Get function arguments list #####
  messager("Assigning arguments of function:",fn_name) 
  argument_list <- rlang::fn_fmls(fn = fn)
  #### Iterately assign arguments to env ####
  args_return <- lapply(names(argument_list), function(arg){
      # message("Processing arg: ",arg)
      if(isTRUE(remove)){
          messager("Removing global:",arg)
          if(exists(arg, envir = envir)){
              rm(list = arg, pos = envir, envir = envir)
          }
      } 
      #### Parse arguments ####
      stop_func <- function(){stop("No default")}
      arg_final <- tryCatch({
          arg_out <- argument_list[[arg]]
          if(methods::is(arg_out,"call")){
              arg_out <- tryCatch({ 
                  eval(arg_out)
              }, error = function(e) arg_out)
          }
          arg_out
      }, error = function(e){stop_func})
      #### Assign global ####
      if(isTRUE(remove)){ 
          # if(exists(arg, envir = envir)) {
          #     warning("Global removal failed.") 
          # }
      } else if(identical(arg_final, stop_func)){
          messager("Skipping arg without default:",arg)
      } else{ 
          output <- tryCatch({eval(arg_final)}, 
                             error=function(e){paste(e)})
          if(is.character(output) &&
             length(output)==1 &&
             grepl("^Error",output) &&
             grepl("not found\n$",output) ){
              messager("Skipping arg without default:",arg)
          } else {
              if(exists(arg, envir = envir)){
                  if(isTRUE(reassign)){
                      messager("Reassigning global ->>",arg)
                      assign_global <- TRUE
                  } else {
                      messager("Using existing global:",arg)
                      assign_global <- FALSE
                  }
              } else {
                  messager("Assigning global ->>",arg)
                  assign_global <- TRUE
              }
              if(isTRUE(assign_global)){
                  assign(x = arg,
                         value = output,
                         pos = envir,
                         envir = envir)
              } 
              # if(!exists(arg, envir = envir)) {
              #     warning("Global assignment failed.")
              # }
          }  
      } 
      return(arg_final)
  })
  names(args_return) <- names(argument_list)
  # methods::show(args_return)
  assign(x = "args_return", 
         value = args_return,
         pos = envir,
         envir = envir)
  return(args_return)
  stop_early()
}
