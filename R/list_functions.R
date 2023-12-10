#' List functions
#' 
#' List all functions defined within an R source file.
#' Default to using the currently active file.
#' @param path Path to R source file.
#' @returns A list of functions.
#' 
#' @export
#' @examples
#' if(interactive()) list_functions()
list_functions <- function(path=current_file()) {
  temp.env <- new.env()
  sys.source(path, envir = temp.env)
  functions <- utils::lsf.str(envir=temp.env)
  rm(temp.env)
  return(functions)
}
