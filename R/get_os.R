#' Get OS
#' 
#' Infer the Operating System (OS) of the current machine being used. 
#' @returns OS type as a character string.
#' 
#' @export
#' @examples
#' get_os() 
get_os <- function() {
    OS <- ""
    switch(Sys.info()[["sysname"]],
        Windows = {
            OS <- "Windows"
        },
        Linux = {
            OS <- "Linux"
        },
        Darwin = {
            OS <- "Mac"
        }
    )
    return(OS)
}
