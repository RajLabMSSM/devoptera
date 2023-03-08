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
})