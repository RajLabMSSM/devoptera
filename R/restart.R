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
  cat(paste('Welcome back!'))
))){ 
  rstudioapi::restartSession(command = command)
}