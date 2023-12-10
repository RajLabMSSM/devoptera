test_that("stop_early works", {
  
  testfun <- function(...) {stop_early(); message("Completed function.");1}
  early_out <- try({
    testfun()
  }) 
  testthat::expect_true(methods::is(early_out,"try-error"))
})
