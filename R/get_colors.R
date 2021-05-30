
#' Get Colors
#' @description Create a matrix from vector to represent colors in gradient.
#' @param x A numeric vector.
#' @param pos Color of the value farthest above \code{zero_val}.
#' @param neg Color of the value farthest below \code{zero_val}.
#' @param zero Color assigned to \code{zero_val}.
#' @param zero_val The value you wish to represent 0 (the default, or median value in \code{x}).
#' @return A data frame with the newly calculated columns. See \code{gradient} documentation for relevant information.
#' @importFrom dplyr "%>%" left_join
#' @importFrom formattable csscolor gradient
#' @export
get_colors <- function(x, pos = "#8af3a3", neg = "#f49c9c", zero = "#ffffff", zero_val = 0){
  xsort <- sort(as.numeric(x))
  xpos <- x[x > zero_val] %>% sort()
  xneg <- x[x < zero_val] %>% sort()
  x0 <- x[x == zero_val]

  colors_pos <- formattable::csscolor(
    formattable::gradient(c(zero_val, xpos), zero, pos)
  ) %>%
    tail(-1)

  colors_neg <- formattable::csscolor(
    formattable::gradient(c(xneg, zero_val), neg, zero)
  ) %>%
    head(-1)

  x0 <- rep(zero, length(x0))

  colors <- dplyr::tibble(vals = x) %>%
    dplyr::left_join(
      dplyr::tibble(
        vals = xsort,
        colors = c(colors_neg, x0, colors_pos)
      ),
      by = "vals") %>%
    dplyr::pull(colors)

  return(colors)
}
