# Stop messages

Conditionally print stop messages. Allows developers to easily control
verbosity of functions, and meet Bioconductor requirements that dictate
the stop message must first be stored to a variable before passing to
[stop](https://rdrr.io/r/base/stop.html).

## Usage

``` r
stopper(..., v = TRUE)
```

## Arguments

- v:

  Whether to print messages or not.

## Value

Null
