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