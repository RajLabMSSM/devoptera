# Remove all variables

Remove all variables from your environment.

## Usage

``` r
rma(envir = .GlobalEnv, list = ls(pos = envir, envir = envir))
```

## Arguments

- envir:

  the [`environment`](https://rdrr.io/r/base/environment.html) to use.
  See ‘details’.

- list:

  a character vector (or [`NULL`](https://rdrr.io/r/base/NULL.html))
  naming objects to be removed.

## Value

Null

## Examples

``` r
rma()
```
