#' Make hex
#' 
#' Make a hex sticker for the 
#' \href{https://github.com/RajLabMSSM/echolocatoR#the-echoverse}{echoverse}.
#' @param pkg Package name.
#' @param subtitle Hex sticker subtitle.
#' @param save_path Path to save the hex sticker to.
#' @param new_coords Generate new random x/y coordinates to position the bats in 
#' the background along.
#' @param n_bats The number of bats you want to plot in the background.
#' @param gradient Two colors to use to create a gradient for coloring the bats.
#' @param s_size Convenience argument for controlled both 
#' \code{s_height} and \code{s_width} at the same time.
#' @param seed Random seed to make point coordinates reproducible 
#' (only relevant when \code{new_coords=TRUE}).
#' @param show_plot Print the plot once created.
#' @inheritParams make_hex
#' @inheritParams hexSticker::sticker
#' @returns Plot of class \link[hexSticker]{sticker}.
#' 
#' @export
#' @importFrom here here
#' @importFrom methods show
#' @examples
#' hex <- make_hex(pkg="mypackage",
#'                 save_path = tempfile(fileext = "hex.png"))
make_hex <- function(pkg = read.dcf(here::here("DESCRIPTION"),
                                    fields = "Package")[1],  
                     subtitle = "echoverse",
                     subplot = NULL,
                     save_path = here::here("inst","hex","hex.png"), 
                     new_coords = FALSE,
                     n_bats = 20,
                     gradient = c("#194f68","#56ffff"),
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
                     seed = 1234,
                     show_plot = TRUE
  ){
  requireNamespace("hexSticker")
  
  .args <- as.list(match.call()[-1])
  if(is.null(subplot)){
    subplot <- do.call(what = make_hex_echoverse, 
                       args = .args) 
  } 
  #### Create hex sticker ####
  stick <- hexSticker::sticker(
    subplot = subplot, 
    #### Package name ####
    package = pkg, p_size=p_size, p_x = p_x, p_y = p_y,
    #### Subplot #####
    s_x=s_x, s_y=s_y,  s_height = s_height, s_width = s_width,
    #### Fill & border ####
    h_fill = h_fill, h_color = h_color, #56ffff
    #### Spotlight ####
    spotlight = spotlight, l_alpha = l_alpha, l_width = l_width,
    #### File output ####
    filename = save_path, dpi = dpi)
  #### Print plot ####
  if(isTRUE(show_plot)) methods::show(stick)
  #### Return ####
  return(stick)
  
}