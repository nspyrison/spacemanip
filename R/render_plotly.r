#' Render the slides as a *plotly* animation
#'
#' Takes the result of `array2df()` and renders them into a 
#' *plotly* animation.
#'
#' @param slides The result of `array2df()`, a long df of the projected frames.
#' @param manip_col String of the color to highlight the `manip_var`. 
#'   Defaults to "blue".
#' @param col Color of the projected points. Defaults to "black".
#' @param pch Point character of the projected points. Defaults to 20.
#' @param axes Position of the axes: "center", "bottomleft" or "off". Defaults 
#'   to "center".
#' @param fps Frames/slides shown per second. Defaults to 3.
#' @param ... Optional, pass addition arguments to `plotly::animation_opts()` 
#'   and `plotly::layout()`.
#' @export
#' @examples
#' \dontrun{
#' flea_std <- tourr::rescale(tourr::flea[, 1:6])
#' 
#' rb <- basis_random(n = ncol(flea_std))
#' mtour <- manual_tour(basis = rb, manip_var = 4)
#' sshow <- array2df(array = mtour, data = flea_std)
#' render_plotly(slides = sshow)
#' 
#' render_plotly(slides = sshow, col = col_of(flea$species), 
#'   axes = "bottomleft", fps = 2)
#' }
render_plotly <- function(slides,
                          manip_col = "blue",
                          col = "black", 
                          pch = 20,
                          axes = "center",
                          fps = 3,
                          ...) 
{
  # Initialize
  gg <- render_(slides = slides, manip_col = manip_col, 
                col = col, pch = pch, axes = axes)
  
  ggp <- plotly::ggplotly(p = gg, tooltip = "none") 
  ggp <- plotly::animation_opts(p = ggp, frame = 1 / fps * 1000, 
                                transition = 0, redraw = FALSE, ...)
  ggp <- plotly::layout(
    ggp, showlegend = F, yaxis = list(showgrid = F, showline = F),
    xaxis = list(scaleanchor = "y", scaleratio = 1, showgrid = F, showline = F),
    ...
  )
  
  ggp
}