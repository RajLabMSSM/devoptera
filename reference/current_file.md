# Current file

Get the path to the currently active file in the RStudio editor.

## Usage

``` r
current_file(...)
```

## Arguments

- ...:

  Arguments passed on to
  [`rstudioapi::getSourceEditorContext`](https://rstudio.github.io/rstudioapi/reference/rstudio-editors.html)

  `id`

  :   The ID of a particular document, as retrieved by `documentId()` or
      similar. Supported in RStudio 2022.06.0 or newer.

## Value

File path.

## Examples

``` r
if(interactive()) current_file()
```
