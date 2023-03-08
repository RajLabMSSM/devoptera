#' Source all functions
#'
#' Source all R files in a directory at once. 
#' Also loads selected libraries. 
#' This function can be useful when developing R packages, 
#' instead of rebuilding the entire package every time you make a change 
#' (which is a more robust way to checking the package works, 
#' but is much slower). 
#' @param path Directory containing R files.
#' @param pattern File name pattern to search for.
#' @param packages Packages to load. 
#' @param ... Additional arguments passed to \link[base]{sys.source}. 
#' @inheritParams base::sys.source
#' @returns Null 
#' 
#' @export
#' @importFrom here here
#' @examples 
#' source_all()
source_all <- function(path = here::here("R"),
                       pattern="*.R$",
                       packages = NULL, 
                       envir = globalenv(),
                       ...){   
  # testthat::source_dir()
  for(x in packages){ 
      require(x, character.only=TRUE)
  }
  #### Source all internal funcs at once #### 
  file.sources = list.files(path = path,
                            pattern = pattern, 
                            full.names = TRUE, ignore.case = TRUE)
  
  if(length(file.sources)>0){
      message("Sourcing ",length(file.sources)," files.")
  } else {
      message("No files found to source.")
  }
  out <- lapply(X = file.sources, 
                FUN = function(x){try({sys.source(x,envir = envir, ...)})})
}
