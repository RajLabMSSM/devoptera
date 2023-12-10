#' Setup gcc
#' 
#' Set up a symlink to override xcode's clang with a valid version of gcc.
#' If this doesn't work, first try following
#'  \href{https://mac.r-project.org/tools/}{these instructions}.
#' @param version gcc version to use (e.g. 7,8,9,10).
#' If \code{"latest"}, the latest version of gcc 
#' currently installed on your machine will be used.
#' @param verbose Print messages.
#' @inheritParams set_permissions
#' @inheritParams R.utils::createLink 
#' @returns A data.frame listing all gcc versions, their paths, 
#' and which one is currently active.
#' 
#' @export
#' @import data.table
#' @importFrom R.utils createLink
#' @examples
#' if(interactive()) gcc_df <- setup_gcc(overwrite=FALSE) 
setup_gcc <- function(version='latest',
                      link="/usr/local/bin/gcc",
                      sudo=FALSE,
                      pass=Sys.getenv("PASS"),
                      overwrite=TRUE,
                      verbose=TRUE){ 
  # devoptera::args2vars(setup_gcc, reassign = TRUE)
  #### Check if gcc is already installed ####
  #### Use xcode implementation ####
  if(version=="clang"){
      out <- R.utils::createLink(link=link, 
                                 target="/usr/bin/clang",
                                 overwrite=TRUE)
      return(NULL)
  }
  #### Use gcc ####
  gcc_paths <- list.files("/usr/local/Cellar",
                          pattern = "gcc@", 
                          full.names = TRUE)
  if(length(gcc_paths)==0){
    prelude <- paste(
      "No valid version of gcc installed.",
      "You can install it in the terminal using:",
    )
    if(get_os()=="mac"){
      stp <- paste(prelude,
                   "`brew install gcc@10`"
      )
    } else if(get_os()=="windows"){
      stp <- paste(prelude,
                   "`npm install gcc`"
      )  
    } else {
      stp <- paste(prelude,
                   "`sudo apt update && sudo apt install build-essential`"
      ) 
    } 
    stop(stp)
  }
  version <- tolower(as.character(version))
  gcc_df <- data.table::data.table(
      dir=gcc_paths, 
      subdir=list.files(gcc_paths, full.names = TRUE),
      version=unlist(lapply(basename(gcc_paths),
                            function(x){utils::tail(strsplit(x,"@")[[1]],1)}))
      ) 
  gcc_df[,link:=paste0("/usr/local/bin/gcc-",version)] 
  data.table::setorderv(gcc_df,"version")
  if(version=="latest"){
      i <- 1
  } else { 
      if(version %in% gcc_df$version){ 
          i <- which(gcc_df$version==version)
      } else {
          messager("Requested gcc version not installed.",
                   "You can install it in the terminal using:",
                   "`brew install gcc@<version>`",
                   "\nFor now, using the latest version of gcc installed.",
                   v=verbose
                   )
          i <- 1
      } 
  }
  #### Select gcc version ####
  gcc_select <- gcc_df[i,] 
  gcc_df$active <- ifelse(seq_len(nrow(gcc_df))==i,"*","")
  messager("Using gcc version:",gcc_select$version,v=verbose)
  #### Overwrite symlink with selected version ####
  set_permissions(path = link,
                  sudo = sudo,
                  pass = pass,
                  verbose = verbose)  
  # system(command = paste(
  #   add_sudo(sudo=sudo, pass=pass),
  #   "ln -s",gcc_select$link,
  #   link)
  #   ) 
  out <- R.utils::createLink(link=link,
                             target=gcc_select$link, 
                             overwrite=overwrite)  
  # system("gcc -v") ## Check active version 
  return(gcc_df)
}
