test_that("get_os works", {

  os <- get_os()
  testthat::expect_true(tolower(os) %in% c("windows","mac","linux"))
})

test_that("get_os returns lowercase by default", {

  os <- get_os()
  testthat::expect_identical(os, tolower(os))
})

test_that("get_os lower=FALSE returns title case", {

  os <- get_os(lower = FALSE)
  testthat::expect_true(os %in% c("Windows", "Mac", "Linux"))
  ## First letter should be uppercase
  testthat::expect_identical(
    substr(os, 1, 1),
    toupper(substr(os, 1, 1))
  )
})

test_that("get_os returns a single character string", {

  os <- get_os()
  testthat::expect_type(os, "character")
  testthat::expect_length(os, 1)
  testthat::expect_gt(nchar(os), 0)
})

test_that("get_os lower=TRUE and lower=FALSE are consistent", {

  os_lower <- get_os(lower = TRUE)
  os_upper <- get_os(lower = FALSE)
  testthat::expect_identical(tolower(os_upper), os_lower)
})
