% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mbecs_helper.R
\name{poscore}
\alias{poscore}
\title{Percentile of Score}
\usage{
poscore(cnt.vec, cnt, type = c("rank", "weak", "strict", "mean"))
}
\arguments{
\item{cnt.vec}{A vector of counts that acts as reference for score
calculation.}

\item{cnt}{A numeric value to calculate percentile-score for.}

\item{type}{One of 'rank', 'weak', 'strict' or 'mean' to determine how the
score is calculated.}
}
\value{
A score for given count in relation to reference counts.
}
\description{
Helper function that calculates percentiles of scores for batch-correction
method 'pn' (percentile normalization). R-implementation of Claire Duvallet's
'percentileofscore()' for python.
}
\details{
Calculates the number of values that bigger than reference (left) and the
number of values that are smaller than the reference (right). Percentiles of
scores are given in the interval \eqn{I:[0,100]}. Depending on type of
calculation, the score will be computed as follows:

\code{rank = (right + left + ifelse(right > left, 1, 0)) * 50/n}

\code{weak = right / n*100}

\code{strict = left / n*100}

\code{mean = (right + left) * 50/n)}
}
\examples{
# This will return a score for the supplied vector with default evaluation
# (strict).
val.score <- poscore(cnt.vec=runif(100, min=0, max=100), cnt=42,
type="strict")
}
\keyword{Percentile}
\keyword{Score}
