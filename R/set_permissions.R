#' Set permissions
#' 
#' Robust methods for setting file/folder permissions across multiple OS.
#' 
#' @param path Path to file/folder.
#' @param is_folder Whether \code{path} is a folder. 
#' If so, permissions will be set recursively for all files/subfolders. 
#' @param permissions Scope of permissions to set for each OS type. 
#' "default" is only used when the OS type is not Windows, Mac, or Linux.
#' @param path Path to file/folder.
#' @param sudo Whether to run commands in \code{sudo} mode.
#' @param pass Admin password.
#' @param whoami Admin username.
#' @param verbose Print messages.
#' 
#' @export
#' @examples
#' f <- tempfile()
#' writeLines(text = letters, con = f)
#' set_permissions(f)
set_permissions <- function(path,
                            is_folder = FALSE,
                            permissions = list(
                              "Windows"="Everyone:(OI)(CI)RX",
                              "Mac"="u=rx,go=rx",
                              "Linux"="u=rx,go=rx",
                              "default"="u=rx,go=rx"),
                            whoami = "admin",
                            pass = Sys.getenv("PASS"),
                            sudo = FALSE,
                            verbose = TRUE){ 
  # devoptera::args2vars(set_permissions)
  
  if(pass=="" && isTRUE(sudo)) {
    stopper("`pass` must be set to use `sudo=TRUE`")
  }
  messager("Setting permissions for",
           paste0(if(is_folder)"folder"else"file","."),
           v=verbose) 
  try({
    set_chown(path = path,
              whoami = whoami, 
              pass = pass, 
              verbose = verbose)
  }) 
  #### OS-specific commands ####
  if(get_os()=="windows"){
      try({ 
        system(paste("icacls",
                     path,
                     if(is_folder) "/t" else NULL,
                     if(verbose) NULL else "/q",
                     "/grant:r ",permissions$Windows
                     )
                  )
        }
          )
  } else if (get_os()=="mac"){
      try({
        system(paste(
          add_sudo(sudo = sudo, pass = pass),
          "chmod",
          if(is_folder) "-R" else NULL,
          permissions$Mac,
          path)
          )
        })
  } else if (get_os()=="linux"){
    try({
      system(paste(
        add_sudo(sudo = sudo, pass = pass),
        "chmod",
        if(is_folder) "-R" else NULL,
        permissions$Linux,
        path)
        )
      })
  } else {
    try({
      system(paste(
        add_sudo(sudo = sudo, pass = pass),
        "chmod",
        if(is_folder) "-R" else NULL,
        permissions$default,
        path))
      })
  }
  #### Should work on all OS (maybe?) ####
  try({
    Sys.chmod(paths = path, 
              mode = "777",
              use_umask = FALSE)
    })
}
