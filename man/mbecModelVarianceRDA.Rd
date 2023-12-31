% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mbecs_analyses.R
\name{mbecModelVarianceRDA}
\alias{mbecModelVarianceRDA}
\title{Estimate Explained Variance with Redundancy Analysis}
\usage{
mbecModelVarianceRDA(model.vars, tmp.cnts, tmp.meta, type)
}
\arguments{
\item{model.vars}{Covariates to use for model building.}

\item{tmp.cnts}{Abundance matrix in 'sample x feature' orientation.}

\item{tmp.meta}{Covariate table that contains at least the used variables.}

\item{type}{String the denotes data source, i.e., one of "otu","clr" or "tss"
for the transformed counts or the label of the batch corrected count-matrix.}
}
\value{
Data.frame that contains proportions of variance for given covariates
in a partial redundancy analysis approach.
}
\description{
The function offers a selection of methods/algorithms to estimate the
proportion of variance that can be attributed to covariates of interest.
This shows, how much variation is explained by the treatment effect, which
proportion is introduced by processing in batches and the leftover variance,
i.e., residuals that are not currently explained. Covariates of interest
(CoI) are selected by the user and the function will incorporate them into
the model.
}
\details{
partial Redundancy Analysis (rda): Iterates over given covariates, builds a
model of all covariates that includes one variable as condition/constraint
and then fits it to the feature abundance matrix. The difference in explained
variance between the full- and the constrained-model is then attributed to
the constraint. (cnts ~ group + Condition(batch) vs. cnts ~ group + batch)
}
\keyword{Analysis}
\keyword{Partial}
\keyword{Redundancy}
\keyword{Variance}
\keyword{of}
