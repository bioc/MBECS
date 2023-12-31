% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mbecs_corrections.R
\name{mbecBat}
\alias{mbecBat}
\title{Combat Batch Effects (ComBat)}
\usage{
mbecBat(input.obj, model.vars, type = c("clr", "otu", "tss"))
}
\arguments{
\item{input.obj}{phyloseq object or numeric matrix (correct orientation is
handeled internally)}

\item{model.vars}{Vector of covariate names. First element relates to batch.}

\item{type}{Which abundance matrix to use, one of 'otu, tss, clr'. DEFAULT is
'clr'.}
}
\value{
A matrix of batch-effect corrected counts
}
\description{
This method uses an non-/parametric empirical  Bayes framework to correct
for BEs. Described by Johnson et al. 2007 this method was initially conceived
to work with gene expression data and is part of the sva-package in R.
}
\details{
The input for this function is supposed to be an MbecData object that
contains total sum-scaled and cumulative log-ratio transformed abundance
matrices. Output will be a matrix of corrected abundances.
}
\keyword{BECA}
\keyword{Batch}
\keyword{Centering}
\keyword{Mean}
