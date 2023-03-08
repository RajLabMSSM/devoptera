test_that("make_hex works", {
  
  ### NOTE: since make_hex uses match.arg internally, 
  ### all variables passed as argument must have the exact same name 
  ## as their corresponding argument.
  
  save_path <- tempfile(fileext = "hex.png")
  hex1 <- make_hex(pkg = "mypackage", 
                   save_path = save_path)
  testthat::expect_true(file.exists(save_path))
  testthat::expect_true(methods::is(hex1,"sticker"))
  
  save_path <- tempfile(fileext = "hex2.png")
  hex2 <- make_hex(pkg = "mypackage", 
                   save_path = save_path, 
                   new_coords = TRUE, 
                   n_bats = 10)
  testthat::expect_true(file.exists(save_path))
  testthat::expect_true(methods::is(hex2,"sticker"))
})
