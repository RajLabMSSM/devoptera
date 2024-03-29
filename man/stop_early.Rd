% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stop_early.R
\name{stop_early}
\alias{stop_early}
\title{Stop early}
\usage{
stop_early(msg = "Exiting function early.")
}
\arguments{
\item{msg}{Message to print.}
}
\value{
Null
}
\description{
Stop a function early without an error.
}
\examples{
testfun <- function(...) {stop_early(); message("Completed function."); 1}
if(interactive()) testfun()
}
