test_that("setup_gcc works", {
  
  gcc_df <- suppressWarnings(
    setup_gcc(overwrite=FALSE)
  )
  testthat::expect_true(methods::is(gcc_df,"data.table"))
  testthat::expect_gte(nrow(gcc_df),1)
  testthat::expect_true(sum(gcc_df$active=="*")==1)
})
