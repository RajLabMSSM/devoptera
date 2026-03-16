# Docker/Singularity Containers

## Installation

devoptera is now available via
[ghcr.io](https://ghcr.io/ghcr.io/RajLabMSSM/devoptera) as a
containerised environment with Rstudio and all necessary dependencies
pre-installed.

### Method 1: via Docker

First, [install Docker](https://docs.docker.com/get-docker/) if you have
not already.

Create an image of the [Docker](https://www.docker.com/) container in
command line:

    docker pull ghcr.io/RajLabMSSM/devoptera

Once the image has been created, you can launch it with:

    docker run \
      -d \
      -e ROOT=true \
      -e PASSWORD="<your_password>" \
      -v ~/Desktop:/Desktop \
      -v /Volumes:/Volumes \
      -p 8900:8787 \
      ghcr.io/RajLabMSSM/devoptera

#### NOTES

- Make sure to replace `<your_password>` above with whatever you want
  your password to be.\
- Change the paths supplied to the `-v` flags for your particular use
  case.
- The `-d` ensures the container will run in “detached” mode, which
  means it will persist even after you’ve closed your command line
  session.\
- The username will be *“rstudio”* by default.\
- Optionally, you can also install the [Docker
  Desktop](https://www.docker.com/products/docker-desktop/) to easily
  manage your containers.

### Method 2: via Singularity

If you are using a system that does not allow Docker (as is the case for
many institutional computing clusters), you can instead [install Docker
images via
Singularity](https://docs.sylabs.io/guides/2.6/user-guide/singularity_and_docker.html).

    singularity pull docker://ghcr.io/RajLabMSSM/devoptera

For troubleshooting, see the [Singularity
documentation](https://docs.sylabs.io/guides/latest/user-guide/singularity_and_docker.html#github-container-registry).

## Usage

Finally, launch the containerised Rstudio by entering the following URL
in any web browser: *<http://localhost:8900/>*

Login using the credentials set during the Installation steps.

## Session Info

``` r

utils::sessionInfo()
```

    ## R Under development (unstable) (2026-03-12 r89607)
    ## Platform: x86_64-pc-linux-gnu
    ## Running under: Ubuntu 24.04.4 LTS
    ## 
    ## Matrix products: default
    ## BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3 
    ## LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.26.so;  LAPACK version 3.12.0
    ## 
    ## locale:
    ##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
    ##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
    ##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
    ##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
    ##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    ## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
    ## 
    ## time zone: UTC
    ## tzcode source: system (glibc)
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] devoptera_1.0.0
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] stringdist_0.9.17    xfun_0.56            bslib_0.10.0        
    ##  [4] httr2_1.2.2          remotes_2.5.0.9000   devtools_2.4.6      
    ##  [7] htmlwidgets_1.6.4    Biobase_2.71.0       vctrs_0.7.1         
    ## [10] tools_4.6.0          bitops_1.0-9         generics_0.1.4      
    ## [13] stats4_4.6.0         RUnit_0.4.33.1       curl_7.0.0          
    ## [16] parallel_4.6.0       tibble_3.3.1         RSQLite_2.4.6       
    ## [19] blob_1.3.0           R.oo_1.27.1          pkgconfig_2.0.3     
    ## [22] BiocCheck_1.47.18    BiocBaseUtils_1.13.0 data.table_1.18.2.1 
    ## [25] dbplyr_2.5.2         desc_1.4.3           graph_1.89.1        
    ## [28] lifecycle_1.0.5      compiler_4.6.0       textshaping_1.0.5   
    ## [31] biocViews_1.79.3     codetools_0.2-20     usethis_3.2.1       
    ## [34] htmltools_0.5.9      sass_0.4.10          RCurl_1.98-1.17     
    ## [37] yaml_2.3.12          pillar_1.11.1        pkgdown_2.2.0       
    ## [40] jquerylib_0.1.4      ellipsis_0.3.2       R.utils_2.13.0      
    ## [43] cachem_1.1.0         sessioninfo_1.2.3    tidyselect_1.2.1    
    ## [46] digest_0.6.39        purrr_1.2.1          dplyr_1.2.0         
    ## [49] rprojroot_2.1.1      fastmap_1.2.0        here_1.0.2          
    ## [52] cli_3.6.5            magrittr_2.0.4       pkgbuild_1.4.8      
    ## [55] RBGL_1.87.0          XML_3.99-0.22        filelock_1.0.3      
    ## [58] rappdirs_0.3.4       bit64_4.6.0-1        rmarkdown_2.30      
    ## [61] bit_4.6.0            otel_0.2.0           ragg_1.5.1          
    ## [64] R.methodsS3_1.8.2    memoise_2.0.1        evaluate_1.0.5      
    ## [67] knitr_1.51           BiocFileCache_3.1.0  rlang_1.1.7         
    ## [70] glue_1.8.0           DBI_1.3.0            BiocManager_1.30.27 
    ## [73] BiocGenerics_0.57.0  pkgload_1.5.0        rstudioapi_0.18.0   
    ## [76] jsonlite_2.0.0       R6_2.6.1             systemfonts_1.3.2   
    ## [79] fs_1.6.7

\
