test_that("setup_gcc works", {

  gcc_paths <- list.files("/usr/local/Cellar",
                          pattern = "gcc@",
                          full.names = TRUE)
  if(get_os() != "mac" || length(gcc_paths) == 0){
    ## gcc via Homebrew not available on this platform/machine.
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
