context("waterfall_plot")

test_that("waterfall_plot works", {

  g = waterfall_plot(mtcars, "am", "1", "cyl")
  expect_equal(g$data$label, c("0", "4", "6", "8", "1"))
  expect_equal(g$data$value, c(19, 5, -1, -10, 13))

  g = waterfall_plot(mtcars, "am", "1", "cyl",
                     ingroup_label = TRUE, rotate_xlabel = TRUE)
  expect_equal(g$data$label, c("0", "4", "6", "8", "1"))
  expect_equal(g$data$value, c(19, 5, -1, -10, 13))

  expect_error(waterfall_plot(mtcars, "1", "mpg", "am"))

})
