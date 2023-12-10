#### Test "current" function when fn is an R source file path #### 

if(!exists("args_return") && 
   Sys.getenv("STOPTEST")!="TRUE"){
  ## Prevent infinite recursion
  Sys.setenv("STOPTEST"="TRUE")
  ## Run tests
  test_that("args2vars (mode=current)works", {
    tpath <- testthat::test_path("testfun.R") 
    out <- args2vars(fn=tpath, run_source_all = TRUE)  
    args_current <- out$testfun
    testthat::expect_length(args_current, 2)
    testthat::expect_equal(names(args_current), c("x","y"))
    testthat::expect_equal(args_current$x, 1)
    testthat::expect_equal(args_current$y, 2) 
  })
}  
### reset env var
# Sys.setenv("STOPTEST"="FALSE")
