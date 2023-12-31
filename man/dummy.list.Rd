% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{dummy.list}
\alias{dummy.list}
\title{Mock-up microbiome abundance table and meta-data.}
\format{
A list object containing counts and meta-data:
\describe{
  \item{cnts}{Compositional Abundance Data}
  \item{meta}{Covariate Information}
}
}
\usage{
dummy.list
}
\description{
An artificial data-set containing pre-processed abundance table of
microbial communities and a matrix of covariate information. The data was
created using the \code{\link{mbecDummy}} function for the sole purpose of
running examples and showing the package workflow.
}
\examples{
data(dummy.list)
}
\keyword{datasets}
