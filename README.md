<img src='https://github.com/RajLabMSSM/devoptera/raw/master/inst/hex/hex.png' title='Hex sticker for devoptera' height='300'><br>
[![License:
GPL-3](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://cran.r-project.org/web/licenses/GPL-3)
[![](https://img.shields.io/badge/doi-10.1093/bioinformatics/btab658-blue.svg)](https://doi.org/10.1093/bioinformatics/btab658)
[![](https://img.shields.io/badge/devel%20version-0.99.0-black.svg)](https://github.com/RajLabMSSM/devoptera)
[![](https://img.shields.io/github/languages/code-size/RajLabMSSM/devoptera.svg)](https://github.com/RajLabMSSM/devoptera)
[![](https://img.shields.io/github/last-commit/RajLabMSSM/devoptera.svg)](https://github.com/RajLabMSSM/devoptera/commits/master)
<br> [![R build
status](https://github.com/RajLabMSSM/devoptera/workflows/rworkflows/badge.svg)](https://github.com/RajLabMSSM/devoptera/actions)
[![](https://codecov.io/gh/RajLabMSSM/devoptera/branch/master/graph/badge.svg)](https://app.codecov.io/gh/RajLabMSSM/devoptera)
<br>
<a href='https://app.codecov.io/gh/RajLabMSSM/devoptera/tree/master' target='_blank'><img src='https://codecov.io/gh/RajLabMSSM/devoptera/branch/master/graphs/icicle.svg' title='Codecov icicle graph' width='200' height='50' style='vertical-align: top;'></a>  
<h4>  
Authors: <i>Brian Schilder, Jack Humphrey, Towfique Raj</i>  
</h4>

## `devoptera`: Practical tools for R developers.

This R package is part of the *echoverse* suite that supports
[`echolocatoR`](https://github.com/RajLabMSSM/echolocatoR): an automated
genomic fine-mapping pipeline.

If you use `devoptera`, please cite:

> Brian M Schilder, Jack Humphrey, Towfique Raj (2021) echolocatoR: an
> automated end-to-end statistical and functional genomic fine-mapping
> pipeline, *Bioinformatics*; btab658,
> <https://doi.org/10.1093/bioinformatics/btab658>

## Installation

``` r
if(!require("remotes")) install.packages("remotes")

remotes::install_github("RajLabMSSM/devoptera")
library(devoptera)
```

## Documentation

### [Website](https://rajlabmssm.github.io/devoptera)

### [Get started](https://rajlabmssm.github.io/devoptera/articles/devoptera)

## Name

<details>
<summary>
<strong>❓🦇❓ So what does <code>devoptera</code> mean,
anyways?</strong> (click to find out)
</summary>

[**DevOps**](https://en.wikipedia.org/wiki/DevOps) is a software
engineering methodology that is itself an amalgam of software
**Dev**lopment and IT **Op**eration**s**.

**Chiroptera** is a the name of the phylogenetic order to which bats
belong. `devoptera` is part of the broader *echoverse* suite that
supports [`echolocatoR`](https://github.com/RajLabMSSM/echolocatoR), and
`echolocatoR` is an R package that facilitates fine-mapping to pinpoint
causal genetic variants underlying complex traits.

You know, like bats do (kind of). :cricket::wavy_dash::bat:
</details>
<hr>

## Contact

<a href="https://bschilder.github.io/BMSchilder/" target="_blank">Brian
M. Schilder, Bioinformatician II</a>  
<a href="https://rajlab.org" target="_blank">Raj Lab</a>  
<a href="https://icahn.mssm.edu/about/departments/neuroscience" target="_blank">Department
of Neuroscience, Icahn School of Medicine at Mount Sinai</a>

# Session info

<details>

``` r
devoptera::session_info()
```

    ## ─ Session info ───────────────────────────────────────────────────────────────
    ##  setting  value
    ##  version  R version 4.2.1 (2022-06-23)
    ##  os       macOS Big Sur ... 10.16
    ##  system   x86_64, darwin17.0
    ##  ui       X11
    ##  language (EN)
    ##  collate  en_US.UTF-8
    ##  ctype    en_US.UTF-8
    ##  tz       Europe/London
    ##  date     2023-08-17
    ##  pandoc   3.1.1 @ /Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/ (via rmarkdown)
    ## 
    ## ─ Packages ───────────────────────────────────────────────────────────────────
    ##  package       * version   date (UTC) lib source
    ##  badger          0.2.3     2023-01-28 [2] CRAN (R 4.2.0)
    ##  Biobase         2.58.0    2022-11-01 [2] Bioconductor
    ##  BiocCheck       1.34.3    2023-03-03 [2] Bioconductor
    ##  BiocFileCache   2.6.1     2023-02-17 [2] Bioconductor
    ##  BiocGenerics    0.44.0    2022-11-01 [2] Bioconductor
    ##  BiocManager     1.30.20   2023-02-24 [2] CRAN (R 4.2.0)
    ##  BiocPkgTools    1.16.1    2023-02-28 [2] Bioconductor
    ##  biocViews       1.66.3    2023-03-06 [2] Bioconductor
    ##  bit             4.0.5     2022-11-15 [2] CRAN (R 4.2.0)
    ##  bit64           4.0.5     2020-08-30 [2] CRAN (R 4.2.0)
    ##  bitops          1.0-7     2021-04-24 [2] CRAN (R 4.2.0)
    ##  blob            1.2.4     2023-03-17 [2] CRAN (R 4.2.0)
    ##  cachem          1.0.8     2023-05-01 [2] CRAN (R 4.2.0)
    ##  callr           3.7.3     2022-11-02 [2] CRAN (R 4.2.0)
    ##  cli             3.6.1     2023-03-23 [1] CRAN (R 4.2.0)
    ##  codetools       0.2-19    2023-02-01 [2] CRAN (R 4.2.0)
    ##  colorspace      2.1-0     2023-01-23 [2] CRAN (R 4.2.1)
    ##  crayon          1.5.2     2022-09-29 [2] CRAN (R 4.2.0)
    ##  crul            1.4.0     2023-05-17 [2] CRAN (R 4.2.0)
    ##  curl            5.0.0     2023-01-12 [2] CRAN (R 4.2.0)
    ##  data.table      1.14.8    2023-02-17 [2] CRAN (R 4.2.0)
    ##  DBI             1.1.3     2022-06-18 [2] CRAN (R 4.2.0)
    ##  dbplyr          2.3.2     2023-03-21 [2] CRAN (R 4.2.0)
    ##  desc            1.4.2     2022-09-08 [2] CRAN (R 4.2.1)
    ##  devoptera       0.99.0    2023-08-17 [1] Bioconductor
    ##  devtools        2.4.5     2022-10-11 [2] CRAN (R 4.2.0)
    ##  digest          0.6.31    2022-12-11 [2] CRAN (R 4.2.0)
    ##  dlstats         0.1.7     2023-05-24 [2] CRAN (R 4.2.0)
    ##  dplyr           1.1.2     2023-04-20 [2] CRAN (R 4.2.0)
    ##  DT              0.28      2023-05-18 [2] CRAN (R 4.2.0)
    ##  ellipsis        0.3.2     2021-04-29 [2] CRAN (R 4.2.0)
    ##  evaluate        0.21      2023-05-05 [2] CRAN (R 4.2.0)
    ##  fansi           1.0.4     2023-01-22 [2] CRAN (R 4.2.1)
    ##  fastmap         1.1.1     2023-02-24 [2] CRAN (R 4.2.0)
    ##  fauxpas         0.5.2     2023-05-03 [2] CRAN (R 4.2.0)
    ##  filelock        1.0.2     2018-10-05 [2] CRAN (R 4.2.0)
    ##  fs              1.6.2     2023-04-25 [2] CRAN (R 4.2.0)
    ##  generics        0.1.3     2022-07-05 [2] CRAN (R 4.2.0)
    ##  ggplot2         3.4.2     2023-04-03 [2] CRAN (R 4.2.0)
    ##  gh              1.4.0     2023-02-22 [2] CRAN (R 4.2.0)
    ##  glue            1.6.2     2022-02-24 [2] CRAN (R 4.2.0)
    ##  graph           1.76.0    2022-11-01 [2] Bioconductor
    ##  gtable          0.3.3     2023-03-21 [2] CRAN (R 4.2.0)
    ##  here            1.0.1     2020-12-13 [2] CRAN (R 4.2.0)
    ##  hms             1.1.3     2023-03-21 [2] CRAN (R 4.2.0)
    ##  htmltools       0.5.5     2023-03-23 [2] CRAN (R 4.2.0)
    ##  htmlwidgets     1.6.2     2023-03-17 [2] CRAN (R 4.2.0)
    ##  httpcode        0.3.0     2020-04-10 [2] CRAN (R 4.2.0)
    ##  httpuv          1.6.11    2023-05-11 [2] CRAN (R 4.2.0)
    ##  httr            1.4.6     2023-05-08 [2] CRAN (R 4.2.0)
    ##  igraph          1.5.0.1   2023-07-23 [1] CRAN (R 4.2.0)
    ##  jsonlite        1.8.4     2022-12-06 [2] CRAN (R 4.2.0)
    ##  knitr           1.43      2023-05-25 [2] CRAN (R 4.2.0)
    ##  later           1.3.1     2023-05-02 [2] CRAN (R 4.2.0)
    ##  lifecycle       1.0.3     2022-10-07 [2] CRAN (R 4.2.0)
    ##  magrittr        2.0.3     2022-03-30 [1] CRAN (R 4.2.0)
    ##  memoise         2.0.1     2021-11-26 [2] CRAN (R 4.2.0)
    ##  mime            0.12      2021-09-28 [2] CRAN (R 4.2.0)
    ##  miniUI          0.1.1.1   2018-05-18 [2] CRAN (R 4.2.0)
    ##  munsell         0.5.0     2018-06-12 [2] CRAN (R 4.2.0)
    ##  pillar          1.9.0     2023-03-22 [2] CRAN (R 4.2.1)
    ##  pkgbuild        1.4.0     2022-11-27 [2] CRAN (R 4.2.0)
    ##  pkgconfig       2.0.3     2019-09-22 [1] CRAN (R 4.2.0)
    ##  pkgload         1.3.2     2022-11-16 [2] CRAN (R 4.2.0)
    ##  prettyunits     1.1.1     2020-01-24 [2] CRAN (R 4.2.0)
    ##  processx        3.8.1     2023-04-18 [2] CRAN (R 4.2.1)
    ##  profvis         0.3.8     2023-05-02 [2] CRAN (R 4.2.0)
    ##  promises        1.2.0.1   2021-02-11 [2] CRAN (R 4.2.0)
    ##  ps              1.7.5     2023-04-18 [2] CRAN (R 4.2.0)
    ##  purrr           1.0.1     2023-01-10 [2] CRAN (R 4.2.0)
    ##  R6              2.5.1     2021-08-19 [2] CRAN (R 4.2.0)
    ##  rappdirs        0.3.3     2021-01-31 [2] CRAN (R 4.2.0)
    ##  RBGL            1.74.0    2022-11-01 [2] Bioconductor
    ##  RColorBrewer    1.1-3     2022-04-03 [2] CRAN (R 4.2.0)
    ##  Rcpp            1.0.10    2023-01-22 [2] CRAN (R 4.2.1)
    ##  RCurl           1.98-1.12 2023-03-27 [2] CRAN (R 4.2.0)
    ##  readr           2.1.4     2023-02-10 [2] CRAN (R 4.2.0)
    ##  remotes         2.4.2     2021-11-30 [2] CRAN (R 4.2.0)
    ##  renv            0.17.3    2023-04-06 [2] CRAN (R 4.2.0)
    ##  rlang           1.1.1     2023-04-28 [1] CRAN (R 4.2.0)
    ##  rmarkdown       2.22      2023-06-01 [2] CRAN (R 4.2.0)
    ##  rorcid          0.7.0     2021-01-20 [2] CRAN (R 4.2.0)
    ##  rprojroot       2.0.3     2022-04-02 [2] CRAN (R 4.2.0)
    ##  RSQLite         2.3.1     2023-04-03 [2] CRAN (R 4.2.0)
    ##  rstudioapi      0.14      2022-08-22 [2] CRAN (R 4.2.0)
    ##  RUnit           0.4.32    2018-05-18 [2] CRAN (R 4.2.0)
    ##  rvcheck         0.2.1     2021-10-22 [2] CRAN (R 4.2.0)
    ##  rvest           1.0.3     2022-08-19 [2] CRAN (R 4.2.0)
    ##  rworkflows      0.99.10   2023-07-15 [1] Bioconductor
    ##  scales          1.2.1     2022-08-20 [2] CRAN (R 4.2.0)
    ##  sessioninfo     1.2.2     2021-12-06 [2] CRAN (R 4.2.0)
    ##  shiny           1.7.4     2022-12-15 [2] CRAN (R 4.2.1)
    ##  stringdist      0.9.10    2022-11-07 [2] CRAN (R 4.2.1)
    ##  stringi         1.7.12    2023-01-11 [2] CRAN (R 4.2.0)
    ##  stringr         1.5.0     2022-12-02 [2] CRAN (R 4.2.0)
    ##  tibble          3.2.1     2023-03-20 [2] CRAN (R 4.2.0)
    ##  tidyselect      1.2.0     2022-10-10 [2] CRAN (R 4.2.0)
    ##  tzdb            0.4.0     2023-05-12 [2] CRAN (R 4.2.0)
    ##  urlchecker      1.0.1     2021-11-30 [2] CRAN (R 4.2.0)
    ##  usethis         2.1.6     2022-05-25 [2] CRAN (R 4.2.0)
    ##  utf8            1.2.3     2023-01-31 [2] CRAN (R 4.2.1)
    ##  vctrs           0.6.2     2023-04-19 [2] CRAN (R 4.2.0)
    ##  whisker         0.4.1     2022-12-05 [2] CRAN (R 4.2.0)
    ##  xfun            0.39      2023-04-20 [2] CRAN (R 4.2.0)
    ##  XML             3.99-0.14 2023-03-19 [2] CRAN (R 4.2.0)
    ##  xml2            1.3.4     2023-04-27 [2] CRAN (R 4.2.0)
    ##  xtable          1.8-4     2019-04-21 [2] CRAN (R 4.2.0)
    ##  yaml            2.3.7     2023-01-23 [2] CRAN (R 4.2.1)
    ##  yulab.utils     0.0.6     2022-12-20 [2] CRAN (R 4.2.1)
    ## 
    ##  [1] /Users/bms20/Library/R/x86_64/4.2/library
    ##  [2] /Library/Frameworks/R.framework/Versions/4.2/Resources/library
    ## 
    ## ──────────────────────────────────────────────────────────────────────────────

</details>
<hr>
