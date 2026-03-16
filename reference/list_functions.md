# List functions

List all functions defined within an R source file. Default to using the
currently active file.

## Usage

``` r
list_functions(path = current_file())
```

## Arguments

- path:

  Path to R source file.

## Value

A list of functions.

## Examples

``` r
if(interactive()) list_functions()
```
