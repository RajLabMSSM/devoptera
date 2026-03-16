# Restart R

Restart the R session. Shallow wrapper for
[restartSession](https://rstudio.github.io/rstudioapi/reference/restartSession.html).

## Usage

``` r
restart(command = deparse(substitute(cat(paste("Welcome back!")))))
```

## Arguments

- command:

  A command (as a string) to be run after restarting.

## Value

Null

## Examples

``` r
if (FALSE) { # \dontrun{
restart()
} # }
```
