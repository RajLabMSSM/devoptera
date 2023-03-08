test_that("session_info works", {
  
  
  out <- testthat::capture_output_lines(
    session_info()
  )
  testthat::expect_true(sum(grepl("Session info",out))==1)
})
