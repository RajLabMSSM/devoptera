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

test_that("setup_gcc errors with helpful message when no gcc installed", {
  testthat::skip_on_cran()

  ## If /usr/local/Cellar has no gcc@* entries, setup_gcc should error
  ## with an informative message about how to install gcc.
  gcc_paths <- list.files("/usr/local/Cellar",
                          pattern = "gcc@",
                          full.names = TRUE)
  if (length(gcc_paths) == 0) {
    testthat::expect_error(
      setup_gcc(overwrite = FALSE),
      "No valid version of gcc installed"
    )
  } else {
    testthat::skip("gcc is installed; cannot test 'no gcc' path")
  }
})

test_that("setup_gcc version parsing logic works", {
  testthat::skip_on_cran()

  ## Test the version extraction logic used internally by setup_gcc.
  ## This does not require gcc to be installed.
  fake_names <- c("gcc@10", "gcc@11", "gcc@13")
  versions <- unlist(lapply(fake_names, function(x) {
    utils::tail(strsplit(x, "@")[[1]], 1)
  }))
  testthat::expect_equal(versions, c("10", "11", "13"))
})

test_that("setup_gcc data.table construction logic is correct", {
  testthat::skip_on_cran()

  ## Simulate the data.table construction that setup_gcc performs,
  ## without actually touching the filesystem or creating symlinks.
  gcc_paths <- list.files("/usr/local/Cellar",
                          pattern = "gcc@",
                          full.names = TRUE)
  if (length(gcc_paths) == 0) {
    testthat::skip("No gcc installed via Homebrew; skipping data.table test")
  }

  ## Replicate the internal logic
  gcc_df <- data.table::data.table(
    dir = gcc_paths,
    subdir = list.files(gcc_paths, full.names = TRUE),
    version = unlist(lapply(basename(gcc_paths), function(x) {
      utils::tail(strsplit(x, "@")[[1]], 1)
    }))
  )
  gcc_df[, link := paste0("/usr/local/bin/gcc-", version)]
  data.table::setorderv(gcc_df, "version")

  testthat::expect_true(methods::is(gcc_df, "data.table"))
  testthat::expect_true("dir" %in% names(gcc_df))
  testthat::expect_true("subdir" %in% names(gcc_df))
  testthat::expect_true("version" %in% names(gcc_df))
  testthat::expect_true("link" %in% names(gcc_df))
  testthat::expect_gte(nrow(gcc_df), 1)
  ## All versions should be non-empty strings
  testthat::expect_true(all(nchar(gcc_df$version) > 0))
  ## Links should follow the /usr/local/bin/gcc-<version> pattern
  testthat::expect_true(all(grepl("^/usr/local/bin/gcc-", gcc_df$link)))
})

test_that("setup_gcc version='latest' selects first row after sort", {
  testthat::skip_on_cran()

  gcc_paths <- list.files("/usr/local/Cellar",
                          pattern = "gcc@",
                          full.names = TRUE)
  if (length(gcc_paths) == 0) {
    testthat::skip("No gcc installed via Homebrew")
  }

  ## When version="latest", i=1 is used after setorderv by version.
  ## Verify by running with overwrite=FALSE.
  gcc_df <- suppressWarnings(
    setup_gcc(version = "latest", overwrite = FALSE)
  )
  testthat::expect_equal(gcc_df$active[1], "*")
  ## Only one row should be active
  testthat::expect_equal(sum(gcc_df$active == "*"), 1)
})

test_that("setup_gcc with unavailable version falls back to latest", {
  testthat::skip_on_cran()

  gcc_paths <- list.files("/usr/local/Cellar",
                          pattern = "gcc@",
                          full.names = TRUE)
  if (length(gcc_paths) == 0) {
    testthat::skip("No gcc installed via Homebrew")
  }

  ## Request a version that is almost certainly not installed
  gcc_df <- suppressWarnings(
    setup_gcc(version = "999", overwrite = FALSE)
  )
  testthat::expect_true(methods::is(gcc_df, "data.table"))
  ## Should fall back to i=1 (latest)
  testthat::expect_equal(gcc_df$active[1], "*")
})

test_that("setup_gcc error message is OS-specific", {
  testthat::skip_on_cran()

  gcc_paths <- list.files("/usr/local/Cellar",
                          pattern = "gcc@",
                          full.names = TRUE)
  if (length(gcc_paths) > 0) {
    testthat::skip("gcc is installed; cannot test error messages")
  }

  os <- get_os()
  err <- tryCatch(
    setup_gcc(overwrite = FALSE),
    error = function(e) conditionMessage(e)
  )
  testthat::expect_true(grepl("No valid version of gcc installed", err))
  if (os == "mac") {
    testthat::expect_true(grepl("brew install", err))
  } else if (os == "windows") {
    testthat::expect_true(grepl("npm install", err))
  } else if (os == "linux") {
    testthat::expect_true(grepl("apt", err))
  }
})
