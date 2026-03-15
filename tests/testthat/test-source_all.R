test_that("source_all works", {

  ## NOTE: By default, this unit test will only work when being
  ## run through R CMD checks.
  ## To manually run these tests, set `manual <- TRUE`.
  ##
  ## Also note, scoping the environment is important here,
  ## because testthat uses its own environment during testing.
  ##
  ## See here for usage of devtools::code_coverage() in this context:
  ## https://github.com/r-lib/covr/issues/487
  manual <- FALSE

  ## Create new test env
  env <- testthat::test_env()
  ## This function might be helpful
  ## but there's zero documentation on how to use it.
  # testthat::source_test_setup(path = "tests/testthat", env = env)

  #### Successful sourcing ####
  testthat::source_test_helpers(env = env)
  # setwd(here::here())
  source_all(
    path = if(manual) "./R" else "../../R" ,
    env = env)
  globals <- ls(envir = env)
  message("globals: ",paste(globals,collapse = ", "))
  # testthat::expect_true(
  #   all(c("messager","message_parallel","source_all") %in% globals)
  # )

  #### Failed sourcing ####
  ## Create new test env
  env <- testthat::test_env()
  rm(list = ls(envir = env))
  source_all(path = "typoooo",
             envir = env)
  globals <- ls(envir = env)
  testthat::expect_false("messager" %in% globals)
})

test_that("source_all sources R files from a temp directory", {

  d <- tempfile("source_all_test")
  dir.create(d)
  on.exit(unlink(d, recursive = TRUE), add = TRUE)

  ## Create two R files with simple function definitions
  writeLines("add_one <- function(x) x + 1", file.path(d, "add_one.R"))
  writeLines("multiply_two <- function(x) x * 2", file.path(d, "multiply_two.R"))

  env <- new.env(parent = .GlobalEnv)
  source_all(path = d, envir = env)

  testthat::expect_true(exists("add_one", envir = env))
  testthat::expect_true(exists("multiply_two", envir = env))
  testthat::expect_equal(get("add_one", envir = env)(5), 6)
  testthat::expect_equal(get("multiply_two", envir = env)(5), 10)
})

test_that("source_all returns message when no files found", {

  d <- tempfile("empty_dir")
  dir.create(d)
  on.exit(unlink(d, recursive = TRUE), add = TRUE)

  env <- new.env(parent = .GlobalEnv)
  testthat::expect_message(
    source_all(path = d, envir = env),
    "No files found to source"
  )
})

test_that("source_all uses pattern to filter files", {

  d <- tempfile("pattern_test")
  dir.create(d)
  on.exit(unlink(d, recursive = TRUE), add = TRUE)

  ## Create one .R file and one .txt file
  writeLines("fn_r <- function() 'from_R'", file.path(d, "code.R"))
  writeLines("fn_txt <- function() 'from_txt'", file.path(d, "code.txt"))

  env <- new.env(parent = .GlobalEnv)
  source_all(path = d, pattern = "*.R$", envir = env)

  ## Only the .R file should be sourced
  testthat::expect_true(exists("fn_r", envir = env))
  testthat::expect_false(exists("fn_txt", envir = env))
})

test_that("source_all handles errors in individual files gracefully", {

  d <- tempfile("error_test")
  dir.create(d)
  on.exit(unlink(d, recursive = TRUE), add = TRUE)

  ## Create one valid and one invalid R file
  writeLines("good_fn <- function() 'good'", file.path(d, "good.R"))
  writeLines("this is not valid R code @@@@", file.path(d, "bad.R"))

  env <- new.env(parent = .GlobalEnv)

  ## source_all wraps each source call in try(), so it should not error out
  testthat::expect_no_error(
    source_all(path = d, envir = env)
  )
  ## The good function should still be available
  ## (depends on sort order of files; good.R sorts after bad.R)
  testthat::expect_true(exists("good_fn", envir = env))
})

test_that("source_all with nonexistent path produces no-files message", {

  env <- new.env(parent = .GlobalEnv)
  testthat::expect_message(
    source_all(path = "/nonexistent/path/that/does/not/exist", envir = env),
    "No files found to source"
  )
})

test_that("source_all reports correct number of files", {

  d <- tempfile("count_test")
  dir.create(d)
  on.exit(unlink(d, recursive = TRUE), add = TRUE)

  writeLines("a <- 1", file.path(d, "a.R"))
  writeLines("b <- 2", file.path(d, "b.R"))
  writeLines("c <- 3", file.path(d, "c.R"))

  env <- new.env(parent = .GlobalEnv)
  testthat::expect_message(
    source_all(path = d, envir = env),
    "Sourcing 3 files"
  )
})
