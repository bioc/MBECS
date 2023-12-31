% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mbecs_corrections.R
\name{mbecRUV2}
\alias{mbecRUV2}
\title{Remove unwanted Variation 2 (RUV-2)}
\usage{
mbecRUV2(
  input.obj,
  model.vars,
  type = c("clr", "otu", "tss"),
  nc.features = NULL
)
}
\arguments{
\item{input.obj}{phyloseq object or numeric matrix (correct orientation is
handeled internally)}

\item{model.vars}{Vector of covariate names. First element relates to batch.}

\item{type}{Which abundance matrix to use, one of 'otu, tss, clr'. DEFAULT is
'clr'.}

\item{nc.features}{(OPTIONAL) A vector of features names to be used as
negative controls in RUV-3. If not supplied, the algorithm will use an 'lm'
to find pseudo-negative controls}
}
\value{
A vector of p-values that indicate significance of the batch-effect
for the features.
}
\description{
Estimates unknown BEs by using negative control variables that, in principle,
are unaffected by treatment/study/biological effect (aka the effect of
interest in an experiment). These variables are generally determined prior
to the experiment. An approach to RUV-2 without the presence of negative
control variables is the estimation of pseudo-negative controls. To that end
an lm or lmm (depending on whether or not the study design is balanced) with
treatment is fitted to each feature and the significance calculated. The
features that are not significantly affected by treatment are considered as
pseudo-negative control variables. Subsequently, the actual RUV-2 function
is applied to the data and returns the p-values for treatment, considering
unwanted BEs (whatever that means).
}
\details{
The input for this function is supposed to be an MbecData object that
contains total sum-scaled and cumulative log-ratio transformed abundance
matrices. Output will be a vector of p-values.
}
\keyword{Assessment}
\keyword{Batch-Effect}
\keyword{Correction}
