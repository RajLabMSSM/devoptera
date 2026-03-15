test_that("args2vars works", {

  fn <-  utils::packageDate
  args <- rlang::fn_fmls(fn = fn)

  run_tests <- function(args, args_return){
    testthat::expect_equal(names(args_return), names(args))
    testthat::expect_equal(
      args_return$date.fields,
      c("Date","Packaged","Date/Publication","Built")
    )
    testthat::expect_null(args_return$lib.loc)
    testthat::expect_error(args_return$pkg())
  }

  args_return <- args2vars(fn = fn)
  #### Check list output ####
  run_tests(args = args,
            args_return = args_return)
  #### Check globals ####
  #### Check that each argument also exists are a variable in the namespace
  for(arg in names(args_return)){
    message(arg)
    testthat::expect_true(exists(arg, envir = .GlobalEnv))
  }

  #### Reverse / remove globals ####
  args_return2 <- args2vars(fn = fn,
                            remove = TRUE)
  #### Check list output ####
  run_tests(args = args,
            args_return = args_return2)
  #### Check globals ####
  #### Check that each argument also exists are a variable in the namespace
  for(arg in names(args_return)){
    message(arg)
    testthat::expect_false(exists(arg, envir = .GlobalEnv))
  }

  #### Test "parent" function ####
  testfun <- function(x=1,y=2){
    devoptera::args2vars(fn="parent", run_source_all = FALSE)
  }
  args_parent <- testfun()
  testthat::expect_equal(names(args_parent), c("x","y"))
  testthat::expect_equal(args_parent$x, 1)
  testthat::expect_equal(args_parent$y, 2)
})

test_that("args2vars extracts defaults from a simple function", {

  my_fn <- function(a = 10, b = "hello", c = TRUE) NULL
  env <- new.env(parent = .GlobalEnv)
  res <- args2vars(fn = my_fn, envir = env, run_source_all = FALSE)

  testthat::expect_type(res, "list")
  testthat::expect_equal(names(res), c("a", "b", "c"))
  testthat::expect_equal(res$a, 10)
  testthat::expect_equal(res$b, "hello")
  testthat::expect_equal(res$c, TRUE)

  ## Check variables were assigned in the target environment
  testthat::expect_true(exists("a", envir = env))
  testthat::expect_true(exists("b", envir = env))
  testthat::expect_true(exists("c", envir = env))
  testthat::expect_equal(get("a", envir = env), 10)
  testthat::expect_equal(get("b", envir = env), "hello")
  testthat::expect_equal(get("c", envir = env), TRUE)
})

test_that("args2vars handles function with no defaults", {

  no_defaults_fn <- function(aa_no_def, bb_no_def, cc_no_def) NULL
  env <- new.env(parent = emptyenv())
  res <- args2vars(fn = no_defaults_fn, envir = env, run_source_all = FALSE)

  testthat::expect_type(res, "list")
  testthat::expect_equal(names(res), c("aa_no_def", "bb_no_def", "cc_no_def"))
  ## Arguments without defaults should not be assigned in the target env
  testthat::expect_false(exists("aa_no_def", envir = env, inherits = FALSE))
  testthat::expect_false(exists("bb_no_def", envir = env, inherits = FALSE))
  testthat::expect_false(exists("cc_no_def", envir = env, inherits = FALSE))
})

test_that("args2vars handles mixed defaults and no-defaults", {

  mixed_fn <- function(aa_mixed, yy_mixed = 42, zz_mixed) NULL
  env <- new.env(parent = emptyenv())
  res <- args2vars(fn = mixed_fn, envir = env, run_source_all = FALSE)

  testthat::expect_equal(names(res), c("aa_mixed", "yy_mixed", "zz_mixed"))
  ## yy_mixed has a default, aa_mixed and zz_mixed do not
  testthat::expect_true(exists("yy_mixed", envir = env, inherits = FALSE))
  testthat::expect_equal(get("yy_mixed", envir = env), 42)
  testthat::expect_false(exists("aa_mixed", envir = env, inherits = FALSE))
  testthat::expect_false(exists("zz_mixed", envir = env, inherits = FALSE))
})

test_that("args2vars reassign=FALSE preserves existing globals", {

  env <- new.env(parent = .GlobalEnv)
  assign("a", 999, envir = env)

  my_fn <- function(a = 10, b = 20) NULL
  res <- args2vars(fn = my_fn, envir = env,
                   run_source_all = FALSE, reassign = FALSE)

  ## a should remain 999 because reassign=FALSE

  testthat::expect_equal(get("a", envir = env), 999)
  ## b should be assigned since it didn't exist
  testthat::expect_equal(get("b", envir = env), 20)
})

test_that("args2vars reassign=TRUE overwrites existing globals", {

  env <- new.env(parent = .GlobalEnv)
  assign("a", 999, envir = env)

  my_fn <- function(a = 10, b = 20) NULL
  res <- args2vars(fn = my_fn, envir = env,
                   run_source_all = FALSE, reassign = TRUE)

  ## a should be overwritten to 10
  testthat::expect_equal(get("a", envir = env), 10)
  testthat::expect_equal(get("b", envir = env), 20)
})

test_that("args2vars with remove=TRUE cleans up globals", {

  env <- new.env(parent = .GlobalEnv)
  my_fn <- function(a = 10, b = 20) NULL

  ## First assign
  args2vars(fn = my_fn, envir = env, run_source_all = FALSE)
  testthat::expect_true(exists("a", envir = env))
  testthat::expect_true(exists("b", envir = env))

  ## Then remove
  args2vars(fn = my_fn, envir = env,
            run_source_all = FALSE, remove = TRUE)
  testthat::expect_false(exists("a", envir = env))
  testthat::expect_false(exists("b", envir = env))
})

test_that("args2vars handles expression defaults", {

  expr_fn <- function(x = 1 + 2, y = paste0("a", "b")) NULL
  env <- new.env(parent = .GlobalEnv)
  res <- args2vars(fn = expr_fn, envir = env, run_source_all = FALSE)

  testthat::expect_equal(get("x", envir = env), 3)
  testthat::expect_equal(get("y", envir = env), "ab")
})

test_that("args2vars handles NULL default", {

  null_fn <- function(x = NULL) NULL
  env <- new.env(parent = .GlobalEnv)
  res <- args2vars(fn = null_fn, envir = env, run_source_all = FALSE)

  testthat::expect_true(exists("x", envir = env))
  testthat::expect_null(get("x", envir = env))
})

test_that("args2vars returns named list matching formals", {

  my_fn <- function(alpha = 1, beta = 2, gamma = 3) NULL
  env <- new.env(parent = .GlobalEnv)
  res <- args2vars(fn = my_fn, envir = env, run_source_all = FALSE)

  testthat::expect_type(res, "list")
  testthat::expect_length(res, 3)
  testthat::expect_named(res, c("alpha", "beta", "gamma"))
})
