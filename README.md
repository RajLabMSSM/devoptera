<img src='https://github.com/RajLabMSSM/devoptera/raw/master/inst/hex/hex.png' title='Hex sticker for devoptera' height='300'><br>
[![License:
GPL-3](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://cran.r-project.org/web/licenses/GPL-3)
[![](https://img.shields.io/badge/doi-10.1093/bioinformatics/btab658-blue.svg)](https://doi.org/10.1093/bioinformatics/btab658)
[![](https://img.shields.io/badge/devel%20version-0.99.1-black.svg)](https://github.com/RajLabMSSM/devoptera)
[![](https://img.shields.io/github/languages/code-size/RajLabMSSM/devoptera.svg)](https://github.com/RajLabMSSM/devoptera)
[![](https://img.shields.io/github/last-commit/RajLabMSSM/devoptera.svg)](https://github.com/RajLabMSSM/devoptera/commits/master)
<br> [![R build
status](https://github.com/RajLabMSSM/devoptera/workflows/rworkflows/badge.svg)](https://github.com/RajLabMSSM/devoptera/actions)
[![](https://codecov.io/gh/RajLabMSSM/devoptera/branch/master/graph/badge.svg)](https://app.codecov.io/gh/RajLabMSSM/devoptera)
<br>
<a href='https://app.codecov.io/gh/RajLabMSSM/devoptera/tree/master' target='_blank'><img src='https://codecov.io/gh/RajLabMSSM/devoptera/branch/master/graphs/icicle.svg' title='Codecov icicle graph' width='200' height='50' style='vertical-align: top;'></a>  
<h4>  
Authors: <i>Brian Schilder</i>  
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
    ##  version  R version 4.3.1 (2023-06-16)
    ##  os       macOS Sonoma 14.1.1
    ##  system   aarch64, darwin20
    ##  ui       X11
    ##  language (EN)
    ##  collate  en_US.UTF-8
    ##  ctype    en_US.UTF-8
    ##  tz       Europe/London
    ##  date     2023-12-10
    ##  pandoc   3.1.3 @ /Users/bms20/anaconda3/envs/pytorch/bin/ (via rmarkdown)
    ## 
    ## ─ Packages ───────────────────────────────────────────────────────────────────
    ##  package       * version    date (UTC) lib source
    ##  badger          0.2.3      2023-01-28 [1] CRAN (R 4.3.0)
    ##  Biobase         2.62.0     2023-10-26 [1] Bioconductor
    ##  BiocBaseUtils   1.4.0      2023-10-26 [1] Bioconductor
    ##  BiocCheck       1.38.0     2023-10-26 [1] Bioconductor
    ##  BiocFileCache   2.10.1     2023-10-26 [1] Bioconductor
    ##  BiocGenerics    0.48.1     2023-11-01 [1] Bioconductor
    ##  BiocManager     1.30.22    2023-08-08 [1] CRAN (R 4.3.0)
    ##  biocViews       1.70.0     2023-10-26 [1] Bioconductor
    ##  bit             4.0.5      2022-11-15 [1] CRAN (R 4.3.0)
    ##  bit64           4.0.5      2020-08-30 [1] CRAN (R 4.3.0)
    ##  bitops          1.0-7      2021-04-24 [1] CRAN (R 4.3.0)
    ##  blob            1.2.4      2023-03-17 [1] CRAN (R 4.3.0)
    ##  cachem          1.0.8      2023-05-01 [1] CRAN (R 4.3.0)
    ##  callr           3.7.3      2022-11-02 [1] CRAN (R 4.3.0)
    ##  cli             3.6.1      2023-03-23 [1] CRAN (R 4.3.0)
    ##  codetools       0.2-19     2023-02-01 [1] CRAN (R 4.3.1)
    ##  colorspace      2.1-0      2023-01-23 [1] CRAN (R 4.3.0)
    ##  crayon          1.5.2      2022-09-29 [1] CRAN (R 4.3.0)
    ##  curl            5.2.0      2023-12-08 [1] CRAN (R 4.3.1)
    ##  data.table      1.14.10    2023-12-08 [1] CRAN (R 4.3.1)
    ##  DBI             1.1.3      2022-06-18 [1] CRAN (R 4.3.0)
    ##  dbplyr          2.4.0      2023-10-26 [1] CRAN (R 4.3.1)
    ##  desc            1.4.2      2022-09-08 [1] CRAN (R 4.3.0)
    ##  devoptera       0.99.1     2023-12-10 [1] Bioconductor
    ##  devtools        2.4.5      2022-10-11 [1] CRAN (R 4.3.0)
    ##  digest          0.6.33     2023-07-07 [1] CRAN (R 4.3.0)
    ##  dlstats         0.1.7      2023-05-24 [1] CRAN (R 4.3.0)
    ##  dplyr           1.1.4      2023-11-17 [1] CRAN (R 4.3.1)
    ##  ellipsis        0.3.2      2021-04-29 [1] CRAN (R 4.3.0)
    ##  evaluate        0.23       2023-11-01 [1] CRAN (R 4.3.1)
    ##  fansi           1.0.6      2023-12-08 [1] CRAN (R 4.3.1)
    ##  fastmap         1.1.1      2023-02-24 [1] CRAN (R 4.3.0)
    ##  filelock        1.0.2      2018-10-05 [1] CRAN (R 4.3.0)
    ##  fs              1.6.3      2023-07-20 [1] CRAN (R 4.3.0)
    ##  generics        0.1.3      2022-07-05 [1] CRAN (R 4.3.0)
    ##  ggplot2         3.4.4      2023-10-12 [1] CRAN (R 4.3.1)
    ##  glue            1.6.2      2022-02-24 [1] CRAN (R 4.3.0)
    ##  graph           1.80.0     2023-10-26 [1] Bioconductor
    ##  gtable          0.3.4      2023-08-21 [1] CRAN (R 4.3.0)
    ##  here            1.0.1      2020-12-13 [1] CRAN (R 4.3.0)
    ##  htmltools       0.5.7      2023-11-03 [1] CRAN (R 4.3.1)
    ##  htmlwidgets     1.6.4      2023-12-06 [1] CRAN (R 4.3.1)
    ##  httpuv          1.6.13     2023-12-06 [1] CRAN (R 4.3.1)
    ##  httr            1.4.7      2023-08-15 [1] CRAN (R 4.3.0)
    ##  jsonlite        1.8.8      2023-12-04 [1] CRAN (R 4.3.1)
    ##  knitr           1.45       2023-10-30 [1] CRAN (R 4.3.1)
    ##  later           1.3.2      2023-12-06 [1] CRAN (R 4.3.1)
    ##  lifecycle       1.0.4      2023-11-07 [1] CRAN (R 4.3.1)
    ##  magrittr        2.0.3      2022-03-30 [1] CRAN (R 4.3.0)
    ##  memoise         2.0.1.9000 2023-10-12 [1] Github (r-lib/memoise@588007a)
    ##  mime            0.12       2021-09-28 [1] CRAN (R 4.3.0)
    ##  miniUI          0.1.1.1    2018-05-18 [1] CRAN (R 4.3.0)
    ##  munsell         0.5.0      2018-06-12 [1] CRAN (R 4.3.0)
    ##  pillar          1.9.0      2023-03-22 [1] CRAN (R 4.3.0)
    ##  pkgbuild        1.4.2      2023-06-26 [1] CRAN (R 4.3.0)
    ##  pkgconfig       2.0.3      2019-09-22 [1] CRAN (R 4.3.0)
    ##  pkgload         1.3.3      2023-09-22 [1] CRAN (R 4.3.1)
    ##  prettyunits     1.2.0      2023-09-24 [1] CRAN (R 4.3.1)
    ##  processx        3.8.2      2023-06-30 [1] CRAN (R 4.3.0)
    ##  profvis         0.3.8      2023-05-02 [1] CRAN (R 4.3.0)
    ##  promises        1.2.1      2023-08-10 [1] CRAN (R 4.3.0)
    ##  ps              1.7.5      2023-04-18 [1] CRAN (R 4.3.0)
    ##  purrr           1.0.2      2023-08-10 [1] CRAN (R 4.3.0)
    ##  R.methodsS3     1.8.2      2022-06-13 [1] CRAN (R 4.3.0)
    ##  R.oo            1.25.0     2022-06-12 [1] CRAN (R 4.3.0)
    ##  R.utils         2.12.3     2023-11-18 [1] CRAN (R 4.3.1)
    ##  R6              2.5.1      2021-08-19 [1] CRAN (R 4.3.0)
    ##  RBGL            1.78.0     2023-10-26 [1] Bioconductor
    ##  RColorBrewer    1.1-3      2022-04-03 [1] CRAN (R 4.3.0)
    ##  Rcpp            1.0.11     2023-07-06 [1] CRAN (R 4.3.0)
    ##  RCurl           1.98-1.13  2023-11-02 [1] CRAN (R 4.3.1)
    ##  remotes         2.4.2.9000 2023-11-17 [1] Github (r-lib/remotes@6fe8836)
    ##  renv            1.0.3      2023-09-19 [1] CRAN (R 4.3.1)
    ##  rlang           1.1.2      2023-11-04 [1] CRAN (R 4.3.1)
    ##  rmarkdown       2.25       2023-09-18 [1] CRAN (R 4.3.1)
    ##  rprojroot       2.0.4      2023-11-05 [1] CRAN (R 4.3.1)
    ##  RSQLite         2.3.4      2023-12-08 [1] CRAN (R 4.3.1)
    ##  rstudioapi      0.15.0     2023-07-07 [1] CRAN (R 4.3.0)
    ##  RUnit           0.4.32     2018-05-18 [1] CRAN (R 4.3.0)
    ##  rvcheck         0.2.1      2021-10-22 [1] CRAN (R 4.3.0)
    ##  rworkflows      1.0.2      2023-11-17 [1] Bioconductor
    ##  scales          1.3.0      2023-11-28 [1] CRAN (R 4.3.1)
    ##  sessioninfo     1.2.2      2021-12-06 [1] CRAN (R 4.3.0)
    ##  shiny           1.8.0      2023-11-17 [1] CRAN (R 4.3.1)
    ##  stringdist      0.9.12     2023-11-28 [1] CRAN (R 4.3.1)
    ##  stringi         1.8.2      2023-11-23 [1] CRAN (R 4.3.1)
    ##  stringr         1.5.1      2023-11-14 [1] CRAN (R 4.3.1)
    ##  tibble          3.2.1      2023-03-20 [1] CRAN (R 4.3.0)
    ##  tidyselect      1.2.0      2022-10-10 [1] CRAN (R 4.3.0)
    ##  urlchecker      1.0.1      2021-11-30 [1] CRAN (R 4.3.0)
    ##  usethis         2.2.2      2023-07-06 [1] CRAN (R 4.3.0)
    ##  utf8            1.2.4      2023-10-22 [1] CRAN (R 4.3.1)
    ##  vctrs           0.6.5      2023-12-01 [1] CRAN (R 4.3.1)
    ##  xfun            0.41       2023-11-01 [1] CRAN (R 4.3.1)
    ##  XML             3.99-0.16  2023-11-29 [1] CRAN (R 4.3.1)
    ##  xtable          1.8-4      2019-04-21 [1] CRAN (R 4.3.0)
    ##  yaml            2.3.7      2023-01-23 [1] CRAN (R 4.3.0)
    ##  yulab.utils     0.1.0      2023-09-20 [1] CRAN (R 4.3.1)
    ## 
    ##  [1] /Library/Frameworks/R.framework/Versions/4.3-arm64/Resources/library
    ## 
    ## ──────────────────────────────────────────────────────────────────────────────

</details>
<hr>
