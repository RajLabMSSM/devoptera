test_that("set_permissions works", {
  
  f <- tempfile()
  writeLines(text = letters, con = f)
  set_permissions(f)
  
  testthat::expect_true(as.character(file.info(f)$mode) %in% c("777","666")) 
  
  testthat::expect_error(
    set_permissions(f, sudo = TRUE)
  )
  
  testthat::expect_no_error(
    set_permissions(f, sudo = TRUE, pass = "password")
  ) 
})
