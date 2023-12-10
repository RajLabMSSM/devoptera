test_that("set_permissions works", {
  
  f <- tempfile()
  writeLines(text = letters, con = f)
  set_permissions(f)
  
  testthat::expect_equal(as.character(file.info(f)$mode), "777") 
  
  testthat::expect_error(
    set_permissions(f, sudo = TRUE)
  )
  
  testthat::expect_no_error(
    set_permissions(f, sudo = TRUE, pass = "password")
  ) 
})
