#' Make hex: echoverse
#' 
#' Make a hex sticker for the echoverse.
#' @inheritParams make_hex
#' @inheritParams hexSticker::sticker
#' @inheritParams ggplot2::element_text
#' @returns Spooky ggplot
#' 
#' @keywords internal
#' @importFrom utils download.file
#' @importFrom data.table :=
#' @importFrom stats rexp
make_hex_echoverse <- function(pkg,
                               subtitle = "echoverse",
                               save_path = here::here("inst","hex","hex.png"),
                               new_coords = FALSE,
                               n_bats = 20,
                               gradient = c("#194f68","#56ffff"),
                               family = "Aller_Rg",
                               #### Package name ####
                               p_size=14, 
                               p_x = 1,
                               p_y = 1.4,
                               #### Subplot #####
                               s_size = 1,
                               s_x=1, 
                               s_y=.8,  
                               s_height = s_size, 
                               s_width = s_size,
                               #### Fill & border ####
                               h_fill = "#25355c", 
                               h_color = "#41c6c8", #56ffff
                               #### Spotlight ####
                               spotlight = TRUE, 
                               l_alpha = .3, 
                               l_width = 10,
                               dpi = 300,
                               seed = 1234){
  # devoptera::args2vars(make_hex_echoverse)
  requireNamespace("ggplot2")
  requireNamespace("data.table")
  requireNamespace("R.utils")
  # If you're using R<4.1.1, need this version of rvcheck
  # devtools::install_version('rvcheck',version='0.1.8') 
  requireNamespace("ggimage")
  bsize <- x <- y <- image <- NULL;
  set.seed(seed)
  #### Download bat silhouette ####
  # Download bat logo from the  echoverseTemplate GitHub Release.
  tmp <- tempfile()
  #### Side view ####
  URL <- paste0(
    "https://github.com/RajLabMSSM/echoverseTemplate/",
    "releases/download/latest/bat_silhouette.png"   
  )
  utils::download.file(URL, tmp)
  
  #### Create file path #### 
  dir.create(dirname(save_path), showWarnings = FALSE, recursive = TRUE)
  #### Make coordinates #####
  if(isTRUE(new_coords)){
    set.seed(seed)
    d <- data.table::data.table(x = -stats::rexp(n_bats, rate = 3),
                                y = stats::rexp(n_bats, rate = 3),
                                image = URL)
    d[,bsize:=abs(x*y^2)]
    data.table::setorderv(d,cols = c("x","y"), order = c(-1,-1)) 
    # qplot(d$x, d$y, size=d$bsize)
  } 
  #### Import point coordinates for reproducibility ####
  d <- data.table::fread(paste0(
    "https://github.com/RajLabMSSM/echoverseTemplate/",
    "releases/download/latest/echoverse_points.csv.gz"
  ))
  #### Create bat background with `ggplot2` ####
  gg_bats <- ggplot2::ggplot(
    d, ggplot2::aes(x = x, y = y, 
                    color=bsize, image=image)) + 
    ggimage::geom_image(ggplot2::aes(size=I(bsize)), alpha=1, na.rm = TRUE) +
    ggplot2::scale_color_gradient(low = gradient[1],
                                  high = gradient[2]) +   
    ggplot2::coord_cartesian(clip = "off") +
    ggplot2::labs(title = subtitle) +  
    ggplot2::theme_void() +
    ggplot2::theme(
      plot.title = ggplot2::element_text(color = gradient[2], 
                                         size = 25,
                                         hjust = .5, 
                                         vjust = 5,
                                         family = family), 
          legend.position = "none")  
 return(gg_bats)
}