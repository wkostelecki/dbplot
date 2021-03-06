% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ez_png.R
\name{ez_png}
\alias{ez_png}
\title{ez_png}
\usage{
ez_png(
  g,
  file,
  width = 1200,
  height = 600,
  res = 72,
  resx = 1,
  ...,
  vp = NULL,
  dir.create = FALSE,
  check = TRUE
)
}
\arguments{
\item{g}{A ggplot or ezplot object.}

\item{file}{A png file path.}

\item{width}{Image width (in pixels). Default is 1200.}

\item{height}{Image height (in pixels). Default is 600.}

\item{res}{Resolution (PPI) of output image. Default is 72.}

\item{resx}{Resolution multiplier. Default is 1.}

\item{...}{Further arguments to pass to \code{png()}.}

\item{vp}{A viewport object created with grid::viewport.}

\item{dir.create}{Logical. If \code{TRUE}, creates the directory to save
into. Default is \code{FALSE}.}

\item{check}{Logical. If \code{TRUE}, opens png file after saving. Default is \code{TRUE}.}
}
\description{
Saves ggplot or ezplot objects to png (with useful defaults).
}
