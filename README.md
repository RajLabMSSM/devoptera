<img src='https://github.com/RajLabMSSM/devoptera/raw/master/inst/hex/hex.png' title='Hex sticker for devoptera' height='300'><br>
[![License:
GPL-3](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://cran.r-project.org/web/licenses/GPL-3)
[![](https://img.shields.io/badge/doi-10.1093/bioinformatics/btab658-blue.svg)](https://doi.org/10.1093/bioinformatics/btab658)
[![](https://img.shields.io/badge/devel%20version-0.99.0-black.svg)](https://github.com/RajLabMSSM/devoptera)
[![](https://img.shields.io/github/languages/code-size/RajLabMSSM/devoptera.svg)](https://github.com/RajLabMSSM/devoptera)
[![](https://img.shields.io/github/last-commit/RajLabMSSM/devoptera.svg)](https://github.com/RajLabMSSM/devoptera/commits/master)
<br> [![R build
status](https://github.com/RajLabMSSM/devoptera/workflows/rworkflows/badge.svg)](https://github.com/RajLabMSSM/devoptera/actions)
[![](https://codecov.io/gh/RajLabMSSM/devoptera/branch/master/graph/badge.svg)](https://codecov.io/gh/RajLabMSSM/devoptera)
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
    ##  date     2023-03-08
    ##  pandoc   3.1 @ /usr/local/bin/ (via rmarkdown)
    ## 
    ## ─ Packages ───────────────────────────────────────────────────────────────────
    ##  package      * version   date (UTC) lib source
    ##  badger         0.2.3     2023-01-28 [1] CRAN (R 4.2.0)
    ##  Biobase        2.58.0    2022-11-01 [1] Bioconductor
    ##  BiocCheck      1.34.2    2022-11-17 [1] Bioconductor
    ##  BiocGenerics   0.44.0    2022-11-01 [1] Bioconductor
    ##  BiocManager    1.30.20   2023-02-24 [1] CRAN (R 4.2.0)
    ##  biocViews      1.66.2    2022-12-22 [1] Bioconductor
    ##  bitops         1.0-7     2021-04-24 [1] CRAN (R 4.2.0)
    ##  cachem         1.0.6     2021-08-19 [1] CRAN (R 4.2.0)
    ##  callr          3.7.3     2022-11-02 [1] CRAN (R 4.2.0)
    ##  cli            3.6.0     2023-01-09 [1] CRAN (R 4.2.0)
    ##  codetools      0.2-19    2023-02-01 [1] CRAN (R 4.2.0)
    ##  colorspace     2.1-0     2023-01-23 [1] CRAN (R 4.2.1)
    ##  crayon         1.5.2     2022-09-29 [1] CRAN (R 4.2.0)
    ##  data.table     1.14.8    2023-02-17 [1] CRAN (R 4.2.0)
    ##  desc           1.4.2     2022-09-08 [1] CRAN (R 4.2.1)
    ##  devoptera      0.99.0    2023-03-08 [1] Bioconductor
    ##  devtools       2.4.5     2022-10-11 [1] CRAN (R 4.2.0)
    ##  digest         0.6.31    2022-12-11 [1] CRAN (R 4.2.0)
    ##  dlstats        0.1.6     2022-12-14 [1] Github (GuangchuangYu/dlstats@dc0d72b)
    ##  dplyr          1.1.0     2023-01-29 [1] CRAN (R 4.2.1)
    ##  ellipsis       0.3.2     2021-04-29 [1] CRAN (R 4.2.0)
    ##  evaluate       0.20      2023-01-17 [1] CRAN (R 4.2.1)
    ##  fansi          1.0.4     2023-01-22 [1] CRAN (R 4.2.1)
    ##  fastmap        1.1.0     2021-01-25 [1] CRAN (R 4.2.0)
    ##  fs             1.6.1     2023-02-06 [1] CRAN (R 4.2.0)
    ##  generics       0.1.3     2022-07-05 [1] CRAN (R 4.2.0)
    ##  ggplot2        3.4.1     2023-02-10 [1] CRAN (R 4.2.0)
    ##  glue           1.6.2     2022-02-24 [1] CRAN (R 4.2.0)
    ##  graph          1.76.0    2022-11-01 [1] Bioconductor
    ##  gtable         0.3.1     2022-09-01 [1] CRAN (R 4.2.0)
    ##  here           1.0.1     2020-12-13 [1] CRAN (R 4.2.0)
    ##  htmltools      0.5.4     2022-12-07 [1] CRAN (R 4.2.0)
    ##  htmlwidgets    1.6.1     2023-01-07 [1] CRAN (R 4.2.0)
    ##  httpuv         1.6.9     2023-02-14 [1] CRAN (R 4.2.1)
    ##  httr           1.4.4     2022-08-17 [1] CRAN (R 4.2.0)
    ##  jsonlite       1.8.4     2022-12-06 [1] CRAN (R 4.2.0)
    ##  knitr          1.42      2023-01-25 [1] CRAN (R 4.2.1)
    ##  later          1.3.0     2021-08-18 [1] CRAN (R 4.2.0)
    ##  lifecycle      1.0.3     2022-10-07 [1] CRAN (R 4.2.0)
    ##  magrittr       2.0.3     2022-03-30 [1] CRAN (R 4.2.0)
    ##  memoise        2.0.1     2021-11-26 [1] CRAN (R 4.2.0)
    ##  mime           0.12      2021-09-28 [1] CRAN (R 4.2.0)
    ##  miniUI         0.1.1.1   2018-05-18 [1] CRAN (R 4.2.0)
    ##  munsell        0.5.0     2018-06-12 [1] CRAN (R 4.2.0)
    ##  pillar         1.8.1     2022-08-19 [1] CRAN (R 4.2.0)
    ##  pkgbuild       1.4.0     2022-11-27 [1] CRAN (R 4.2.0)
    ##  pkgconfig      2.0.3     2019-09-22 [1] CRAN (R 4.2.0)
    ##  pkgload        1.3.2     2022-11-16 [1] CRAN (R 4.2.0)
    ##  prettyunits    1.1.1     2020-01-24 [1] CRAN (R 4.2.0)
    ##  processx       3.8.0     2022-10-26 [1] CRAN (R 4.2.0)
    ##  profvis        0.3.7     2020-11-02 [1] CRAN (R 4.2.0)
    ##  promises       1.2.0.1   2021-02-11 [1] CRAN (R 4.2.0)
    ##  ps             1.7.2     2022-10-26 [1] CRAN (R 4.2.0)
    ##  purrr          1.0.1     2023-01-10 [1] CRAN (R 4.2.0)
    ##  R6             2.5.1     2021-08-19 [1] CRAN (R 4.2.0)
    ##  RBGL           1.74.0    2022-11-01 [1] Bioconductor
    ##  RColorBrewer   1.1-3     2022-04-03 [1] CRAN (R 4.2.0)
    ##  Rcpp           1.0.10    2023-01-22 [1] CRAN (R 4.2.1)
    ##  RCurl          1.98-1.10 2023-01-27 [1] CRAN (R 4.2.0)
    ##  remotes        2.4.2     2021-11-30 [1] CRAN (R 4.2.0)
    ##  renv           0.17.0    2023-03-02 [1] CRAN (R 4.2.0)
    ##  rlang          1.0.6     2022-09-24 [1] CRAN (R 4.2.0)
    ##  rmarkdown      2.20.1    2023-02-16 [1] Github (rstudio/rmarkdown@a75dc37)
    ##  rprojroot      2.0.3     2022-04-02 [1] CRAN (R 4.2.0)
    ##  rstudioapi     0.14      2022-08-22 [1] CRAN (R 4.2.0)
    ##  RUnit          0.4.32    2018-05-18 [1] CRAN (R 4.2.0)
    ##  rvcheck        0.2.1     2021-10-22 [1] CRAN (R 4.2.0)
    ##  rworkflows     0.99.7    2023-03-07 [1] Bioconductor
    ##  scales         1.2.1     2022-08-20 [1] CRAN (R 4.2.0)
    ##  sessioninfo    1.2.2     2021-12-06 [1] CRAN (R 4.2.0)
    ##  shiny          1.7.4     2022-12-15 [1] CRAN (R 4.2.1)
    ##  stringdist     0.9.10    2022-11-07 [1] CRAN (R 4.2.1)
    ##  stringi        1.7.12    2023-01-11 [1] CRAN (R 4.2.0)
    ##  stringr        1.5.0     2022-12-02 [1] CRAN (R 4.2.0)
    ##  tibble         3.1.8     2022-07-22 [1] CRAN (R 4.2.0)
    ##  tidyselect     1.2.0     2022-10-10 [1] CRAN (R 4.2.0)
    ##  urlchecker     1.0.1     2021-11-30 [1] CRAN (R 4.2.0)
    ##  usethis        2.1.6     2022-05-25 [1] CRAN (R 4.2.0)
    ##  utf8           1.2.3     2023-01-31 [1] CRAN (R 4.2.1)
    ##  vctrs          0.5.2     2023-01-23 [1] CRAN (R 4.2.1)
    ##  xfun           0.37      2023-01-31 [1] CRAN (R 4.2.1)
    ##  XML            3.99-0.13 2022-12-04 [1] CRAN (R 4.2.0)
    ##  xtable         1.8-4     2019-04-21 [1] CRAN (R 4.2.0)
    ##  yaml           2.3.7     2023-01-23 [1] CRAN (R 4.2.1)
    ##  yulab.utils    0.0.6     2022-12-20 [1] CRAN (R 4.2.1)
    ## 
    ##  [1] /Library/Frameworks/R.framework/Versions/4.2/Resources/library
    ## 
    ## ──────────────────────────────────────────────────────────────────────────────

</details>
<hr>
