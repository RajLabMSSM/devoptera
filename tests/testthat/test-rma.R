test_that("rma works", {
  
  objs <- c("a","b")
  envir <- .GlobalEnv
  
  for(x in objs){
    testthat::expect_false(exists(x, envir = envir))
  }
  
  a<<-1;
  b<<-2;
  
  for(x in objs){
    testthat::expect_true(exists(x,envir = envir))
  }
  
  rma(list = objs)
  for(x in objs){
    testthat::expect_false(exists(x, envir = envir))
  }
})
