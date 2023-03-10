% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/args2vars.R
\name{args2vars}
\alias{args2vars}
\title{Set function argument defaults to global variables}
\usage{
args2vars(
  fn,
  remove = FALSE,
  envir = .GlobalEnv,
  reassign = FALSE,
  run_source_all = TRUE,
  ...
)
}
\arguments{
\item{fn}{The function for which you want to convert its default
argument values into global variables (e.g. \code{utils::packageDate}).}

\item{remove}{If \code{TRUE}, will remove globals 
assigned by \code{args2vars} (if supplying the same \code{fn} as before).
If the global does not exist, it will be skipped.}

\item{envir}{the \code{\link[base]{environment}} to use.  See \sQuote{Details}.}

\item{reassign}{If a global variable of the same name already exists, 
reassign its value anyway.}

\item{run_source_all}{Source all R scripts first.}

\item{...}{
  Arguments passed on to \code{\link[=source_all]{source_all}}
  \describe{
    \item{\code{path}}{Directory containing R files.}
    \item{\code{pattern}}{File name pattern to search for.}
    \item{\code{packages}}{Packages to load.}
  }}
}
\value{
A named list with each argument's default value, or simply a
\link[base]{stop} function declaring "No default".
}
\description{
Useful for development, where you want to quickly initialize default values
for a function while editing its internal code.
}
\details{
Note the lack of parentheses at the end of the function
(to avoid calling it).
}
\examples{
args2vars(fn = utils::packageDate)
}
