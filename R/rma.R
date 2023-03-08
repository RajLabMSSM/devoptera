#' Remove all variables
#' 
#' Remove all variables from your environment.
#' @inheritParams base::rm
#' @returns Null
#' 
#' @export
#' @examples 
#' rma()
rma <- function(envir=.GlobalEnv,
                list=ls(pos = envir,
                        envir = envir)
                ){
  rm(list = list,
     pos = envir,
     envir = envir)
}