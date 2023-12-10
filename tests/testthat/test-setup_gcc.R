test_that("setup_gcc works", {
  
  if(!interactive() &&
     get_os() %in% c("windows","linux")){
    ## gcc isn't available on certain GHA runners.
    testthat::expect_error(
      setup_gcc(overwrite=FALSE)
    )
  } else {
    gcc_df <- suppressWarnings(
      setup_gcc(overwrite=FALSE)
    )
    testthat::expect_true(methods::is(gcc_df,"data.table"))
    testthat::expect_gte(nrow(gcc_df),1)
    testthat::expect_true(sum(gcc_df$active=="*")==1)
  } 
})
