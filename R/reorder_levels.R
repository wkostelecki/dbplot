
#' Order levels of factor columns using fct_reorder
#'
#' @param data A data.frame.
#' @param cols Names of columns to reorder.
#' @param y Numeric column for order priority.
#' @param .desc A logical vector of length 1 or ncol(data). Default is TRUE for
#'   all columns in \code{cols}.
#' @return A data.frame.
#' @examples
#' str(ezplot:::reorder_levels(mtcars, "cyl", "1"))
#' str(ezplot:::reorder_levels(mtcars, "cyl", "1", FALSE))
#' str(ezplot:::reorder_levels(mtcars, "cyl", "mpg"))
reorder_levels = function(data,
                          cols = c("group", "facet_x", "facet_y"),
                          y = "y",
                          .desc = rep(TRUE, length(cols))) {

  stopifnot(is.data.frame(data))

  reorder = forcats::fct_reorder

  for (i in seq_along(cols)) {
    this_col = cols[i]
    if (!is.null(data[[this_col]])) {
      data[[this_col]] = reorder(
        factor(data[[this_col]]),
        if (y == "1") rep(1, nrow(data)) else data[[y]],
        function(x) sum(x, na.rm = TRUE),
        .desc = .desc[i]
      )
    }
  }

  data

}
