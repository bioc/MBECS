% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mbecs_classes.R
\name{.mbecSetData}
\alias{.mbecSetData}
\title{Mbec-Data Setter}
\usage{
.mbecSetData(
  input.obj,
  new.cnts = NULL,
  type = c("otu", "ass", "cor", "clr", "tss"),
  label = character()
)
}
\arguments{
\item{input.obj}{MbecData object to work on.}

\item{new.cnts}{A matrix-like object with same dimension as 'otu_table' in
input.obj.}

\item{type}{Specify which type of data to add, by using one of 'ass'
(Assessement), 'cor' (Correction), 'clr' (Cumulative Log-Ratio) or 'tss'
(Total Scaled-Sum).}

\item{label}{For types 'ass' and 'cor' this sets the name within the lists.}
}
\value{
Input object with updated attributes.
}
\description{
Sets and/or replaces selected feature abundance matrix and handles correct
orientation. The argument type determines which slot to access, i.e. the base
matrices for un-transformed counts "otu", total sum-scaled counts "tss",
cumulative log-ratio transformed counts "clr" and batch effect corrected
counts "cor" and assessment vectors "ass". The later two additionally require
the use of the argument 'label' that specifies the name within the respective
lists of corrections and assessments.
}
\examples{
# This will fill the 'tss' slot with the supplied matrix.
data(dummy.mbec, dummy.list)
MBEC.obj <- mbecSetData(input.obj=dummy.mbec, new.cnts=dummy.list$cnts,
    type='tss')

# This will put the given matrix into the list of corrected counts under the
# name "nameOfMethod".
MBEC.obj <- mbecSetData(input.obj=dummy.mbec, new.cnts=dummy.list$cnts,
    type='cor', label="nameOfMethod")
}
\keyword{MBECS}
\keyword{Setter}
