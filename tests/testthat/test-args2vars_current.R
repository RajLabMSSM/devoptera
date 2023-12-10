#### Test "current" function when fn is NULL #### 

testfun <- function(x=1,y=2){
  print("Running testfun")
}

if(!exists("args_return") && 
   Sys.getenv("STOPTEST")!="TRUE"){
  ## Prevent infinite recursion
  Sys.setenv("STOPTEST"="TRUE")
  ## Run tests
  test_that("args2vars (mode=current)works", {  
    ## This only works when RStudio is running interactively
    ## (not during automated unit testing)
    if(rstudioapi::isAvailable()){
      out <- args2vars(fn = NULL)
      args_current <- out$testfun
      testthat::expect_equal(names(args_current), c("x","y"))
      testthat::expect_equal(args_current$x, 1)
      testthat::expect_equal(args_current$y, 2) 
    } else {
      out <- tryCatch({
        args2vars(fn = NULL, 
                  run_source_all = FALSE)
      }, error = function(e)as.character(e) ) 
      testthat::expect_true(grepl("Error: RStudio not running",out))
    } 
  })
}  
### reset env var
# Sys.setenv("STOPTEST"="FALSE")
