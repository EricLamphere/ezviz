
#' Formattable Gradient Tile
#' @description More flexible alternative to \code{formattable::color_tile}.
#' @param format.fun Function to format the values within the selected cells.
#' @param format.digits Number of digits to which the values within the selected cells will be rounded.
#' @param font.family Font family of values within the selected cells.
#' @param font.weight Font size of values within the selected cells.
#' @param border.radius Radius of the border.
#' @param color Color assigned to text.
#' @param ... Parameters passed to \code{get_colors}.
#' @return Formatted table.
#' @export
gradient_tile <- function(format.fun = "percent",
                          format.digits = 2,
                          font.family = "Arial",
                          font.weight = "normal",
                          border.radius = NULL,
                          color = NULL,
                          ...){ # ... = inputs to get_colors function

  format.fun <- match.fun(format.fun)

  formatter("span",
            x ~ format.fun(x, digits = format.digits),
            style = function(x){
              formattable::style(
                display = "block",
                padding = "4px",
                `border-radius` = border.radius,
                color = color,
                `font-family` = font.family,
                `font-weight` = font.weight,
                `background-color` = get_colors(as.numeric(x), ...)
              )
            }
  )
}
