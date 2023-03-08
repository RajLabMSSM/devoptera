#' Restart R
#' 
#' Restart the R session.
#' Shallow wrapper for \link[rstudioapi]{restartSession}.
#' @inheritParams rstudioapi::restartSession
#' @returns Null
#' 
#' @export
#' @importFrom rstudioapi restartSession
#' @examples 
#' \dontrun{
#' restart()
#' }
restart <- function(command=deparse(substitute(
  cat(paste('\U0001F987','Welcome back!','\U0001F987'))
))){ 
  rstudioapi::restartSession(command = command)
}