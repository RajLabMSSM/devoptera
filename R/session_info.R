#' Session info
#' 
#' Wrapper for \link[sessioninfo]{session_info}.
#' @source \href{https://themockup.blog/posts/2022-04-18-session-info/}{
#' quarto example}
#' @param collapse Wrap the session info output in a collapsible HTML element.
#' @param title Title of the collapsed element.
#' @param add_line Add a divider line after the session info.
#' @inheritDotParams sessioninfo::session_info
#' @returns Null.
#' 
#' @export
#' @importFrom devtools session_info
#' @importFrom methods show
#' @examples 
#' session_info()
session_info <- function(collapse=FALSE,
                         title="details",
                         add_line=TRUE,
                         ...){
  # opts <- knitr::opts_chunk$get()
  # p <- function(x){
  #   cat(knitr::asis_output(x))
  # }
  # 
  # #### Start of details HTML ####
  # if(isTRUE(collapse)) {
  #   p("<details>")
  #   if(!is.null(title)) p(paste0("<summary>",title,"</summary>")) 
  #   p("\n")
  # } 
  # cat("```{r Session info}")
  # cat("\n")
  #### Show session info ####
  out <- devtools::session_info(...)
  methods::show(out)
  # cat(paste(as.character(out),collapse = "\n"))
  # cat("\n")
  # cat("```")
  #### End of details HTML ####
  # if(isTRUE(collapse)) {
  #   p("\n")
  #   p("</details>")
  #   p("\n")
  # } 
  #### Add separator line so there's not an abrupt end to the document ####
  # if(isTRUE(add_line)) p("<hr>")
}