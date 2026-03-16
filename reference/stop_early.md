# Stop early

Stop a function early without an error.

## Usage

``` r
stop_early(msg = "Exiting function early.")
```

## Arguments

- msg:

  Message to print.

## Value

Null

## Examples

``` r
testfun <- function(...) {stop_early(); message("Completed function."); 1}
if(interactive()) testfun()
```
