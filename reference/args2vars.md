# Set function argument defaults to global variables

Useful for development, where you want to quickly initialize default
values for a function while editing its internal code.

## Usage

``` r
args2vars(
  fn = "current",
  remove = FALSE,
  envir = .GlobalEnv,
  reassign = TRUE,
  run_source_all = TRUE,
  set_dots = NULL,
  parent_fn = sys.function(sys.parent()),
  ...
)
```

## Arguments

- fn:

  The function for which you want to convert its default argument values
  into global variables. Can be one of:

  "current" or NULL (default)

  :   Identifies which file is currently active within your Rstudio IDE.
      Then searches for any functions that are defined within that file
      and runs args2vars on each of them. In this case, the listed
      returned to the user will be nested by each function name.

  File path

  :   Works the same as "current" except the user can define which R
      source file to search for functions within (e.g.
      `"path/to/file.R"`).

  [function](https://rdrr.io/r/base/function.html)

  :   A literal R function (e.g. `function(x) x+1`), or
      [`utils::packageDate`](https://rdrr.io/r/utils/packageDescription.html)

  "parent"

  :   The function within which args2vars was called.

- remove:

  If `TRUE`, will remove globals assigned by `args2vars` (if supplying
  the same `fn` as before). If the global does not exist, it will be
  skipped.

- envir:

  the [`environment`](https://rdrr.io/r/base/environment.html) to use.
  See ‘Details’.

- reassign:

  If a global variable of the same name already exists, reassign its
  value anyway.

- run_source_all:

  Source all R scripts first.

- set_dots:

  Set the `...` variable to the value of `set_dots`.

- parent_fn:

  The function within which `args2vars` was called. Only used when
  `fn="parent"`.

- ...:

  Arguments passed on to
  [`source_all`](https://rajlabmssm.github.io/devoptera/reference/source_all.md)

  `path`

  :   Directory containing R files.

  `pattern`

  :   File name pattern to search for.

  `packages`

  :   Packages to load.

## Value

A named list with each argument's default value, or simply a
[stop](https://rdrr.io/r/base/stop.html) function declaring "No
default".

## Details

Note the lack of parentheses at the end of the function (to avoid
calling it).

## Examples

``` r
args2vars(fn = utils::packageDate)
#> Sourcing 19 files.
#> Using input function.
#> Assigning '...' to 'NULL'
#> Assigning arguments of function: utils::packageDate
#> Skipping arg without default: pkg
#> Assigning global ->> lib.loc
#> Assigning global ->> date.fields
#> Assigning global ->> tryFormats
#> Skipping arg without default: desc
#> $pkg
#> function () 
#> {
#>     stop("No default")
#> }
#> <bytecode: 0x55d8a414c4c0>
#> <environment: 0x55d8a427ee68>
#> 
#> $lib.loc
#> NULL
#> 
#> $date.fields
#> [1] "Date"             "Packaged"         "Date/Publication" "Built"           
#> 
#> $tryFormats
#> [1] "%Y-%m-%d" "%Y/%m/%d" "%D"       "%m/%d/%y"
#> 
#> $desc
#> packageDescription(pkg, lib.loc = lib.loc, fields = date.fields)
#> 
```
