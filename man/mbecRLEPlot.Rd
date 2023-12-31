% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mbecs_plots.R
\name{mbecRLEPlot}
\alias{mbecRLEPlot}
\title{RLE plotting function}
\usage{
mbecRLEPlot(rle.df, model.vars, label = NULL)
}
\arguments{
\item{rle.df}{'mbecRLE'  data output}

\item{model.vars}{two covariates of interest to select by first variable
selects panels and second one determines coloring}

\item{label}{Name of the plot displayed as legend title.}
}
\value{
ggplot2 object
}
\description{
Takes data.frame from mbecRLE and produces a ggplot2 object.
}
\examples{
# This will return a paneled plot that shows results for the variance
# assessment.
data(dummy.mbec)
rle.df <- mbecRLE(input.obj=dummy.mbec, model.vars=c('group','batch'),
type="clr", return.data=TRUE)
plot.rle <- mbecRLEPlot(rle.df, c('group','batch'))
}
\keyword{Expression}
\keyword{Log}
\keyword{Plot}
\keyword{RLE}
\keyword{Relative}
