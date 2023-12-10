test_that("current_file works", {
  
  if(!rstudioapi::isAvailable()){
    testthat::expect_error(
      current_file()
    )
  } else {
    testthat::expect_equal(
      basename(current_file()),
      "test-current_file.R"
    )
  }
})
