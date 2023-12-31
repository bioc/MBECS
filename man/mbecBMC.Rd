% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mbecs_corrections.R
\name{mbecBMC}
\alias{mbecBMC}
\title{Batch Mean Centering (BMC)}
\usage{
mbecBMC(input.obj, model.vars, type = c("clr", "otu", "tss"))
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
For known BEs, this method takes the batches, i.e., subgroup of samples
within a particular batch, and centers them to their mean.
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
