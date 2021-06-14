
#' Formattable Cell Editor
#' @description Easily edit cells in a table using \code{formattable}.
#' @param font.family Font family of values within the selected cells.
#' @param font.weight Font size of values within the selected cells.
#' @param format.fun Function to format the values within the selected cells.
#' @param digits Number of digits to which the values within the selected cells will be rounded.
#' @param ... Parameters passed to \code{style}.
#' @return Formatted table.
#' @export
format_cell <- function(font.family = "",
                        font.weight = "normal",
                        format.fun = "comma",
                        digits = 2,
                        ...){ # ... = style inputs
  format.fun <- match.fun(format.fun)
  formattable::formatter(
    "span",
    x ~ format.fun(x, digits = digits),
    style = function(x){
      formattable::style(`font-family` = font.family, font.weight = font.weight, ...)
    }
  )
}
