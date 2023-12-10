#' Set owner with \code{chown}
#'
#' @inheritParams set_permissions
#' @returns Null
#' 
#' @keywords internal
set_chown <- function(path,
                      whoami="admin",
                      sudo=FALSE,
                      pass=Sys.getenv("PASS"),
                      verbose=TRUE){
  messager("Setting owner with chown.",v=verbose)
  system(paste0(
    add_sudo(sudo = sudo, pass = pass),
    " chown -R `whoami`:",whoami," /usr/local/bin/gcc"
  ))
}