#' Get OS
#' 
#' Infer the Operating System (OS) of the current machine being used. 
#' @param lower Make the OS string lowercase.
#' @returns OS type as a character string.
#' 
#' @export
#' @examples
#' get_os() 
get_os <- function(lower=TRUE) {
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
    if(lower) OS <- tolower(OS)
    return(OS)
}
