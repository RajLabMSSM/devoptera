#' Set function argument defaults to global variables
#'
#' Useful for development, where you want to quickly initialize default values
#' for a function while editing its internal code.
#' 
#' Note the lack of parentheses at the end of the function
#' (to avoid calling it).
#' 
#' @param fn The function for which you want to convert its default
#' argument values into global variables (e.g. \code{utils::packageDate}).
#' @param remove If \code{TRUE}, will remove globals 
#' assigned by \code{args2vars} (if supplying the same \code{fn} as before).
#' If the global does not exist, it will be skipped.
#' @param run_source_all Source all R scripts first.
#' @param reassign If a global variable of the same name already exists, 
#' reassign its value anyway.
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
args2vars <- function(fn, 
                      remove = FALSE, 
                      envir = .GlobalEnv,
                      reassign = FALSE,
                      run_source_all = TRUE,
                      ...){ 
    # devoptera::args2vars(args2vars)
    
    if(isTRUE(run_source_all)) source_all(...)
    argument_list <- rlang::fn_fmls(fn = fn)
    args_return <- lapply(names(argument_list), function(arg){
        # message("Processing arg: ",arg)
        if(isTRUE(remove)){
            message("Removing global: ",arg)
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
            message("Skipping arg without default: ",arg)
        } else{ 
            output <- tryCatch({eval(arg_final)}, 
                               error=function(e){paste(e)})
            if(is.character(output) &&
               length(output)==1 &&
               grepl("^Error",output) &&
               grepl("not found\n$",output) ){
                message("Skipping arg without default: ",arg)
            } else {
                if(exists(arg, envir = envir)){
                    if(isTRUE(reassign)){
                        message("Reassigning global ->> ",arg)
                        assign_global <- TRUE
                    } else {
                        message("Using existing global : ",arg)
                        assign_global <- FALSE
                    }
                } else {
                    message("Assigning global ->> ",arg)
                    assign_global <- TRUE
                }
                if(isTRUE(assign_global)){
                    assign(x = arg,
                           value = output,
                           pos = .GlobalEnv,
                           envir = .GlobalEnv)
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
    return(args_return)
}
