#' Current file
#' 
#' Get the path to the currently active file in the RStudio editor.
#' @inheritDotParams rstudioapi::getSourceEditorContext
#' @returns File path.
#' 
#' @export
#' @importFrom rstudioapi getSourceEditorContext
#' @examples
#' if(interactive()) current_file()
current_file <- function(...){
  rstudioapi::getSourceEditorContext(...)$path
}