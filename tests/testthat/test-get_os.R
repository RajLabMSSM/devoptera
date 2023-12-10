test_that("get_os works", {
  
  os <- get_os()
  testthat::expect_true(tolower(os) %in% c("windows","mac","linux"))
})
