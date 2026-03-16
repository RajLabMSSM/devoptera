# Source all functions

Source all R files in a directory at once. Also loads selected
libraries. This function can be useful when developing R packages,
instead of rebuilding the entire package every time you make a change
(which is a more robust way to checking the package works, but is much
slower).

## Usage

``` r
source_all(
  path = here::here("R"),
  pattern = "*.R$",
  packages = NULL,
  envir = globalenv(),
  ...
)
```

## Arguments

- path:

  Directory containing R files.

- pattern:

  File name pattern to search for.

- packages:

  Packages to load.

- envir:

  an R object specifying the environment in which the expressions are to
  be evaluated. May also be a list or an integer. The default
  [`baseenv()`](https://rdrr.io/r/base/environment.html) corresponds to
  evaluation in the base environment. This is probably not what you
  want; you should typically supply an explicit `envir` argument, see
  the ‘Note’.

- ...:

  Additional arguments passed to
  [sys.source](https://rdrr.io/r/base/sys.source.html).

## Value

Null

## Examples

``` r
source_all()
#> Sourcing 19 files.
```
