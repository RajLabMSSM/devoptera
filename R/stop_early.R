#' Stop early
#' 
#' Stop a function early without an error.
#' @param msg Message to print.
#' @returns Null
#' @export
#' @examples
#' testfun <- function(...) {stop_early(); message("Completed function."); 1}
#' testfun()
stop_early <- function(msg="Exiting function early.") {
  opt <- options(show.error.messages = FALSE)
  on.exit(options(opt))
  if(!is.null(msg)) messager(msg) 
  stop()
}