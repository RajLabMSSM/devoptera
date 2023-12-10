test_that("list_functions works", {
  
  tpath <- testthat::test_path("testfun.R")
  funs <- list_functions(tpath)
  testthat::expect_length(funs,2)
  testthat::expect_equal(as.character(funs), c("testfun","testfun2"))
})
