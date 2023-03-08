test_that("restart works", {
  
  # rstudioapi::isAvailable()
  if( .Platform$GUI == "RStudio"){
    testthat::expect_no_error(
      restart()
    )  
  } else {
    testthat::expect_error(
      restart()
    )
  }
  
})
