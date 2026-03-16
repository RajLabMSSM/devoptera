# Setup gcc

Set up a symlink to override xcode's clang with a valid version of gcc.
If this doesn't work, first try following [these
instructions](https://mac.r-project.org/tools/).

## Usage

``` r
setup_gcc(
  version = "latest",
  link = "/usr/local/bin/gcc",
  sudo = FALSE,
  pass = Sys.getenv("PASS"),
  overwrite = TRUE,
  verbose = TRUE
)
```

## Arguments

- version:

  gcc version to use (e.g. 7,8,9,10). If `"latest"`, the latest version
  of gcc currently installed on your machine will be used.

- link:

  The path or pathname of the link to be created. If `"."` (or
  [`NULL`](https://rdrr.io/r/base/NULL.html)), it is inferred from the
  `target` argument, if possible.

- sudo:

  Whether to run commands in `sudo` mode.

- pass:

  Admin password.

- overwrite:

  If [`TRUE`](https://rdrr.io/r/base/logical.html), an existing link
  file is overwritten, otherwise not.

- verbose:

  Print messages.

## Value

A data.frame listing all gcc versions, their paths, and which one is
currently active.

## Examples

``` r
if(interactive()) gcc_df <- setup_gcc(overwrite=FALSE) 
```
