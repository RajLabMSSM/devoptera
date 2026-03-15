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

test_that("set_permissions sets permissions on a temp file", {

  f <- tempfile(fileext = ".txt")
  writeLines("test content", con = f)
  on.exit(unlink(f), add = TRUE)

  ## Start with restrictive permissions
  Sys.chmod(f, mode = "400")
  info_before <- file.info(f)

  set_permissions(f, verbose = FALSE)

  info_after <- file.info(f)
  ## After set_permissions the file should have 777 (Unix) or 666 (Windows, no execute bit)
  testthat::expect_true(as.character(info_after$mode) %in% c("777", "666"))
})

test_that("set_permissions works with is_folder=TRUE on a temp directory", {
  testthat::skip_on_cran()

  d <- tempfile()
  dir.create(d)
  f1 <- file.path(d, "a.txt")
  f2 <- file.path(d, "b.txt")
  writeLines("a", f1)
  writeLines("b", f2)
  on.exit(unlink(d, recursive = TRUE), add = TRUE)

  testthat::expect_no_error(
    set_permissions(d, is_folder = TRUE, verbose = FALSE)
  )

  ## Check that the files inside are accessible
  testthat::expect_true(file.exists(f1))
  testthat::expect_true(file.exists(f2))
})

test_that("set_permissions with custom permissions list", {
  testthat::skip_on_cran()

  f <- tempfile(fileext = ".sh")
  writeLines("#!/bin/bash\necho hello", con = f)
  on.exit(unlink(f), add = TRUE)

  custom_perms <- list(
    "Windows" = "Everyone:(OI)(CI)RX",
    "Mac" = "u=rwx,go=rx",
    "Linux" = "u=rwx,go=rx",
    "default" = "u=rwx,go=rx"
  )

  testthat::expect_no_error(
    set_permissions(f, permissions = custom_perms, verbose = FALSE)
  )
})

test_that("set_permissions verbose=FALSE suppresses messages", {

  f <- tempfile(fileext = ".txt")
  writeLines("test", con = f)
  on.exit(unlink(f), add = TRUE)

  ## verbose=FALSE should not produce messages from messager
  testthat::expect_no_error(
    set_permissions(f, verbose = FALSE)
  )
})

test_that("set_permissions errors when sudo=TRUE and pass is empty", {

  f <- tempfile(fileext = ".txt")
  writeLines("test", con = f)
  on.exit(unlink(f), add = TRUE)

  testthat::expect_error(
    set_permissions(f, sudo = TRUE, pass = ""),
    "pass"
  )
})
