# Get started

``` r

library(devoptera)
```

## Development workflow

Here, we show how `devoptera` can be used to greatly accelerate your R
package development workflow.

### `source_all`

Let’s say you have many functions in your *R* folder and want to have
access to them all without having to write out the `pkg:::internal_func`
notation. You can source all the functions at once by running
[`devoptera::source_all`](https://rajlabmssm.github.io/devoptera/reference/source_all.md).

This function can also load any R packages you need by supplying the
package names to the `packages` argument.

``` r

devoptera::source_all(packages = c("rlang","data.table"))
```

    ## Loading required package: rlang

    ## Loading required package: data.table

    ## 
    ## Attaching package: 'data.table'

    ## The following object is masked from 'package:rlang':
    ## 
    ##     :=

    ## The following object is masked from 'package:base':
    ## 
    ##     %notin%

    ## Sourcing 19 files.

### `args2vars`

As a developer, how often do you find yourself realizing there’s a bug
somewhere inside your function? You could:

- **Strategy 1: Edit –\> Rebuild –\> Repeat**: Make a change to the
  code, rebuild the package, and rerun the function as a whole. This
  most closely mimics how it will run in production, but is extremely
  slow when iterating this edit-rebuild process many, many times over.
- **Strategy 2: Run internal code line-by-line**: Alternatively, you
  could go within your function, run one line of code at a time and
  inspect the variables it produces at each step. This is much faster
  than guessing whether your changes fixed the bug and rebuilding each
  time to find out whether they worked. But in order to do this, you
  first need to initialise each argument in your function as a global
  variable so that you can run the code line-by-line. But your function
  has many arguments, so now you spend the next minute(s) tediously
  making each argument into a variable of the same name (using the
  defaults as the assigned values).

[`devoptera::args2vars`](https://rajlabmssm.github.io/devoptera/reference/args2vars.md)
automates **Strategy 2** by first running `source_all` (from previous
example) and then automatically assigning each of your function’s
arguments as global variables in your R environment. No more tedious
argument defining, allowing you to rapidly debug your code before going
to rebuild the entire package.

#### Define a function

Here we define an arbitrary function with 3 arguments. If your function
is already in one of your source files (i.e. a *.R* file within the *R/*
subfolder), you can skip this step.

``` r

myfunc <- function(a=1, b=2, c=a+b){
  return(list(a,b,c))
}
```

#### Convert arguments to variables

Now we will convert all the default arguments of `myfunc` to global
variables. It also returns a named list with each variable’s assigned
value.

``` r

args <- devoptera::args2vars(myfunc)
```

    ## Sourcing 19 files.

    ## Using input function.

    ## Assigning '...' to 'NULL'

    ## Assigning arguments of function: myfunc

    ## Assigning global ->> a

    ## Assigning global ->> b

    ## Reassigning global ->> c

``` r

args
```

    ## $a
    ## [1] 1
    ## 
    ## $b
    ## [1] 2
    ## 
    ## $c
    ## [1] 3

After debugging your code, you can now proceed to the next steps.

#### Clear

Remove all variables using
[`devoptera::rma()`](https://rajlabmssm.github.io/devoptera/reference/rma.md),
or by clicking the little broom in the upper right of your `Environment`
panel in RStudio.

This is important as it will ensure that the names of
functions/variables in your global environment (created with
`source_all`/`args2vars`) don’t override the functions/variables within
your reinstalled package (in the next step).

``` r

devoptera::rma()
```

#### Reinstall

(Re)install your package with
[`devtools::install()`](https://devtools.r-lib.org/reference/install.html),
or by clicking the `Install` button within the `Build` panel in RStudio.

This is equivalent to the keystrokes `CMD`+`SHIFT`+`B` within RStudio.

``` r

devtools::install()
```

#### Check

Now you can recheck your package as usual to make sure everything runs
as expected.

##### [CRAN](https://cran.r-project.org/) checks

The `check` function from
*[devtools](https://CRAN.R-project.org/package=devtools)* runs
`R CMD check` on your package.

This is equivalent to the keystrokes `CMD`+`SHIFT`+`E` within RStudio.

``` r

devtools::check()
```

##### [Bioconductor](https://bioconductor.org/) checks

The `BiocCheck` function from
*[BiocCheck](https://bioconductor.org/packages/3.23/BiocCheck)* runs
additional Bioconductor-specific checks.

``` r

BiocCheck::BiocCheck()
```

If you still run into some bugs or unexpected behaviour, don’t worry!
You can still easily go back and repeat this process until everything is
working smoothly.

## Extra functions

### Restarting R

Restarting your R session can be helpful or necessary in a variety of
situations. Not only does it clear your variables, it unloads all
packages which is necessary when you want to use a package you just
installed a new version of.

This is equivalent to the keystrokes `CMD`+`SHIFT`+`0` within RStudio.

``` r

devoptera::restart()
```

## Session Info

It is best practice to always include your R Session Info in any
Rmarkdown report or vignette. It contains information about which OS, R
version, and R package versions you generated the report with.

[`devoptera::session_info`](https://rajlabmssm.github.io/devoptera/reference/session_info.md)
provides a collapsible version of the Session Info, which can be helpful
when Session Info is particularly long.

``` r

devoptera::session_info()
```

    ## ─ Session info ───────────────────────────────────────────────────────────────
    ##  setting  value
    ##  version  R Under development (unstable) (2026-03-12 r89607)
    ##  os       Ubuntu 24.04.4 LTS
    ##  system   x86_64, linux-gnu
    ##  ui       X11
    ##  language en
    ##  collate  en_US.UTF-8
    ##  ctype    en_US.UTF-8
    ##  tz       UTC
    ##  date     2026-03-16
    ##  pandoc   3.9 @ /usr/bin/ (via rmarkdown)
    ##  quarto   1.8.27 @ /usr/local/bin/quarto
    ## 
    ## ─ Packages ───────────────────────────────────────────────────────────────────
    ##  package       * version    date (UTC) lib source
    ##  Biobase         2.71.0     2025-10-30 [1] Bioconductor 3.23 (R 4.6.0)
    ##  BiocBaseUtils   1.13.0     2025-10-30 [1] Bioconductor 3.23 (R 4.6.0)
    ##  BiocCheck       1.47.18    2026-02-03 [1] Bioconductor 3.23 (R 4.6.0)
    ##  BiocFileCache   3.1.0      2025-10-30 [1] Bioconductor 3.23 (R 4.6.0)
    ##  BiocGenerics    0.57.0     2025-10-30 [1] Bioconductor 3.23 (R 4.6.0)
    ##  BiocManager     1.30.27    2025-11-14 [1] CRAN (R 4.6.0)
    ##  BiocStyle     * 2.39.0     2025-10-30 [1] Bioconductor 3.23 (R 4.6.0)
    ##  biocViews       1.79.3     2026-02-25 [1] Bioconductor 3.23 (R 4.6.0)
    ##  bit             4.6.0      2025-03-06 [1] CRAN (R 4.6.0)
    ##  bit64           4.6.0-1    2025-01-16 [1] CRAN (R 4.6.0)
    ##  bitops          1.0-9      2024-10-03 [1] CRAN (R 4.6.0)
    ##  blob            1.3.0      2026-01-14 [1] CRAN (R 4.6.0)
    ##  bookdown        0.46       2025-12-05 [1] CRAN (R 4.6.0)
    ##  bslib           0.10.0     2026-01-26 [2] CRAN (R 4.6.0)
    ##  cachem          1.1.0      2024-05-16 [2] CRAN (R 4.6.0)
    ##  cli             3.6.5      2025-04-23 [2] CRAN (R 4.6.0)
    ##  codetools       0.2-20     2024-03-31 [3] CRAN (R 4.6.0)
    ##  curl            7.0.0      2025-08-19 [2] CRAN (R 4.6.0)
    ##  data.table    * 1.18.2.1   2026-01-27 [1] CRAN (R 4.6.0)
    ##  DBI             1.3.0      2026-02-25 [1] CRAN (R 4.6.0)
    ##  dbplyr          2.5.2      2026-02-13 [1] CRAN (R 4.6.0)
    ##  desc            1.4.3      2023-12-10 [2] CRAN (R 4.6.0)
    ##  devoptera     * 1.0.0      2026-03-16 [1] Bioconductor
    ##  devtools        2.4.6      2025-10-03 [2] CRAN (R 4.6.0)
    ##  digest          0.6.39     2025-11-19 [2] CRAN (R 4.6.0)
    ##  dplyr           1.2.0      2026-02-03 [1] CRAN (R 4.6.0)
    ##  ellipsis        0.3.2      2021-04-29 [2] CRAN (R 4.6.0)
    ##  evaluate        1.0.5      2025-08-27 [2] CRAN (R 4.6.0)
    ##  fastmap         1.2.0      2024-05-15 [2] CRAN (R 4.6.0)
    ##  filelock        1.0.3      2023-12-11 [1] CRAN (R 4.6.0)
    ##  fs              1.6.7      2026-03-06 [2] CRAN (R 4.6.0)
    ##  generics        0.1.4      2025-05-09 [1] CRAN (R 4.6.0)
    ##  glue            1.8.0      2024-09-30 [2] CRAN (R 4.6.0)
    ##  graph           1.89.1     2025-12-02 [1] Bioconductor 3.23 (R 4.6.0)
    ##  here            1.0.2      2025-09-15 [1] CRAN (R 4.6.0)
    ##  htmltools       0.5.9      2025-12-04 [2] CRAN (R 4.6.0)
    ##  htmlwidgets     1.6.4      2023-12-06 [2] CRAN (R 4.6.0)
    ##  httr2           1.2.2      2025-12-08 [2] CRAN (R 4.6.0)
    ##  jquerylib       0.1.4      2021-04-26 [2] CRAN (R 4.6.0)
    ##  jsonlite        2.0.0      2025-03-27 [2] CRAN (R 4.6.0)
    ##  knitr           1.51       2025-12-20 [2] CRAN (R 4.6.0)
    ##  lifecycle       1.0.5      2026-01-08 [2] CRAN (R 4.6.0)
    ##  magrittr        2.0.4      2025-09-12 [2] CRAN (R 4.6.0)
    ##  memoise         2.0.1      2021-11-26 [2] CRAN (R 4.6.0)
    ##  otel            0.2.0      2025-08-29 [2] CRAN (R 4.6.0)
    ##  pillar          1.11.1     2025-09-17 [2] CRAN (R 4.6.0)
    ##  pkgbuild        1.4.8      2025-05-26 [2] CRAN (R 4.6.0)
    ##  pkgconfig       2.0.3      2019-09-22 [2] CRAN (R 4.6.0)
    ##  pkgdown         2.2.0      2025-11-06 [1] CRAN (R 4.6.0)
    ##  pkgload         1.5.0      2026-02-03 [2] CRAN (R 4.6.0)
    ##  purrr           1.2.1      2026-01-09 [2] CRAN (R 4.6.0)
    ##  R.methodsS3     1.8.2      2022-06-13 [1] CRAN (R 4.6.0)
    ##  R.oo            1.27.1     2025-05-02 [1] CRAN (R 4.6.0)
    ##  R.utils         2.13.0     2025-02-24 [1] CRAN (R 4.6.0)
    ##  R6              2.6.1      2025-02-15 [2] CRAN (R 4.6.0)
    ##  ragg            1.5.1      2026-03-06 [2] CRAN (R 4.6.0)
    ##  rappdirs        0.3.4      2026-01-17 [2] CRAN (R 4.6.0)
    ##  RBGL            1.87.0     2025-10-30 [1] Bioconductor 3.23 (R 4.6.0)
    ##  RCurl           1.98-1.17  2025-03-22 [1] CRAN (R 4.6.0)
    ##  remotes         2.5.0.9000 2026-03-13 [1] Github (r-lib/remotes@6c988cc)
    ##  rlang         * 1.1.7      2026-01-09 [2] CRAN (R 4.6.0)
    ##  rmarkdown       2.30       2025-09-28 [1] CRAN (R 4.6.0)
    ##  rprojroot       2.1.1      2025-08-26 [2] CRAN (R 4.6.0)
    ##  RSQLite         2.4.6      2026-02-06 [1] CRAN (R 4.6.0)
    ##  rstudioapi      0.18.0     2026-01-16 [2] CRAN (R 4.6.0)
    ##  RUnit           0.4.33.1   2025-06-17 [1] CRAN (R 4.6.0)
    ##  sass            0.4.10     2025-04-11 [2] CRAN (R 4.6.0)
    ##  sessioninfo     1.2.3      2025-02-05 [2] CRAN (R 4.6.0)
    ##  stringdist      0.9.17     2026-01-16 [1] CRAN (R 4.6.0)
    ##  systemfonts     1.3.2      2026-03-05 [2] CRAN (R 4.6.0)
    ##  textshaping     1.0.5      2026-03-06 [2] CRAN (R 4.6.0)
    ##  tibble          3.3.1      2026-01-11 [2] CRAN (R 4.6.0)
    ##  tidyselect      1.2.1      2024-03-11 [1] CRAN (R 4.6.0)
    ##  usethis         3.2.1      2025-09-06 [2] CRAN (R 4.6.0)
    ##  vctrs           0.7.1      2026-01-23 [2] CRAN (R 4.6.0)
    ##  xfun            0.56       2026-01-18 [2] CRAN (R 4.6.0)
    ##  XML             3.99-0.22  2026-02-10 [1] CRAN (R 4.6.0)
    ##  yaml            2.3.12     2025-12-10 [2] CRAN (R 4.6.0)
    ## 
    ##  [1] /__w/_temp/Library
    ##  [2] /usr/local/lib/R/site-library
    ##  [3] /usr/local/lib/R/library
    ##  * ── Packages attached to the search path.
    ## 
    ## ──────────────────────────────────────────────────────────────────────────────

------------------------------------------------------------------------
