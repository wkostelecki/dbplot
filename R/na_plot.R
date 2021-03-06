

#' na_plot
#' @description Visual representation of the NAs in a data.frame
#' @inheritParams area_plot
#' @return A ggplot object.
#' @export
#' @examples
#' na_plot(airquality)
na_plot = function(data, palette = ez_col) {

  cols = names(data)

  # names(data) = paste("Column", seq_len(ncol(data)))
  data = data %>%
    ungroup %>%
    mutate_all(function(x) ifelse(is.na(x), "NA", "Value"))

  data$.row = seq_len(nrow(data))

  tidyr::gather(data, column, value, -.row) %>%
    mutate(column = factor(column, cols),
           value = factor(value, c("Value", "NA"))) %>%
    ggplot() +
    geom_tile(aes(column, .row,
                  fill = value,
                  colour = value)) +
    scale_fill_manual(NULL, values = palette(2)) +
    scale_colour_manual(NULL, values = c(NA, palette(2)[2])) +
    scale_y_reverse() +
    scale_x_discrete(position = "top") +
    xlab(NULL) +
    ylab("row") +
    theme_minimal() +
    coord_cartesian(expand = FALSE) +
    theme(axis.text.x = element_text(angle = 90,
                                     hjust = 0,
                                     vjust = 0.38))

}

globalVariables(c("column", "value", ".row"))
