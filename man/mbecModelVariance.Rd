% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mbecs_analyses.R
\name{mbecModelVariance}
\alias{mbecModelVariance}
\title{Estimate Explained Variance}
\usage{
mbecModelVariance(
  input.obj,
  model.vars = character(),
  method = c("lm", "lmm", "rda", "pvca", "s.coef"),
  model.form = NULL,
  type = c("otu", "clr", "tss", "ass", "cor"),
  label = character(),
  no.warning = TRUE,
  na.action = NULL
)
}
\arguments{
\item{input.obj}{MbecData object}

\item{model.vars}{Vector of covariates to include in model-construction, in
case parameter 'model.form' is not supplied.}

\item{method}{Select method of modeling: Linear Model (lm), Linear Mixed
Model (lmm), Redundancy Analysis (rda), Principal Variance Component Analysis
(pvca) or Silhouette Coefficient (s.coef).}

\item{model.form}{string that describes a model formula, i.e.,
'y ~ covariate1 + (1|covariate2)'.}

\item{type}{Which abundance matrix to use for the calculation.}

\item{label}{Which corrected abundance matrix to use for analysis.}

\item{no.warning}{(OPTIONAL) True/False-flag that should turn of singularity
warnings, but it doesn't quite work}

\item{na.action}{(OPTIONAL) set NA handling, will take global option if not
supplied}
}
\value{
Data.frame that contains proportions of variance for given covariates
in every feature.
}
\description{
The function offers a selection of methods/algorithms to estimate the
proportion of variance that can be attributed to covariates of interest.
This shows, how much variation is explained by the treatment effect, which
proportion is introduced by processing in batches and the leftover variance,
i.e., residuals that are not currently explained. Covariates of interest
(CoI) are selected by the user and the function will incorporate them into
the model building for the respective algorithm. The user can select from
five different approaches to adapt to the characteristics of the data-set,
e.g., LMMs are a better choice than LMs for a very unbalanced study design.
Available approaches are: Linear Model (lm), Linear Mixed Model (lmm),
Redundancy Analysis (rda), Principal Variance Component Analysis (pvca) or
Silhouette Coefficient (s.coef).
}
\details{
Linear Model (lm): An additive model of all covariates is fitted to each
feature respectively and the proportion of variance is extracted for each
covariate (OTU_x ~ covariate_1 + covariate_2 + ...).

Linear Mixed Model (lmm): All but the first covariate are considered mixed
effects. A model is fitted to each OTU respectively and the proportion of
variance extracted for each covariate.
(OTU_x ~ covariate_1 + (1|covariate_2) + (1|...)).

partial Redundancy Analysis (rda): Iterates over given covariates, builds a
model of all covariates that includes one variable as condition/constraint
and then fits it to the feature abundance matrix. The difference in explained
variance between the full- and the constrained-model is then attributed to
the constraint. (cnts ~ group + Condition(batch) vs. cnts ~ group + batch)

Principal Variance Component Analysis (pvca): Algorithm - calculate the
correlation of the fxs count-matrix - from there extract the eigenvectors and
eigenvalues and calculate the proportion of explained variance per
eigenvector (i.e. principal component) by dividing the eigenvalues by the
sum of eigenvalues. Now select as many PCs as required to fill a chosen
quota for the total proportion of explained variance. Iterate over all PCs
and fit a linear mixed model that contains all covariates as random effect
and all unique interactions between two covariates. Compute variance
covariance components form the resulting model --> From there we get the
Variance that each covariate(variable) contributes to this particular PC.
Then just standardize variance by dividing it through the sum of variance for
that model. Scale each PCs results by the proportion this PC accounted for in
the first place. And then do it again by dividing it through the total amount
of explained variance, i.e. the cutoff to select the number of PCs to take
(obviously not the cutoff but rather the actual values for the selected PCs).
Finally take the average over each random variable and interaction term and
display in a nice plot.

Silhouette Coefficient (s.coef): Calculate principal components and get
sample-wise distances on the resulting (sxPC) matrix. Then iterate over all
the covariates and calculate the cluster silhouette (which is basically
either zero, if the cluster contains only a single element, or it is the
distance to the closest different cluster minus the distance of the sample
within its own cluster divided (scaled) by the maximum distance). Average
over each element in a cluster for all clusters and there is the
representation of how good the clustering is. This shows how good a
particular covariate characterizes the data, i.e., a treatment variable for
instance may differentiate the samples into treated and untreated groups
which implies two clusters. In an ideal scenario, the treatment variable,
i.e., indicator for some biological effect would produce a perfect
clustering. In reality, the confounding variables, e.g., batch, sex or age,
will also influence the ordination of samples. Hence, the clustering
coefficient is somewhat similar to the amount of explained variance metric
that the previous methods used. If used to compare an uncorrected data-set to
a batch-corrected set, the expected result would be an increase of clustering
coefficient for the biological effect (and all other covariates - because a
certain amount of uncertainty was removed from the data) and a decrease for
the batch effect.

The function returns a data-frame for further analysis - the report functions
(mbecReport and mbecReportPrelim) will automatically produce plots. Input for
the data-set can be an MbecData-object, a phyloseq-object or a list that
contains counts and covariate data. The covariate table requires an 'sID'
column that contains sample IDs equal to the sample naming in the counts
table. Correct orientation of counts will be handled internally.
}
\examples{
# This will return a data-frame that contains the variance attributable to
# group and batch according to linear additive model.
data(dummy.mbec)
df.var.lm <- mbecModelVariance(input.obj=dummy.mbec,
model.vars=c("batch", "group"), method='lm', type='clr')
# This will return a data-frame that contains the variance attributable to
# group and batch according to principal variance component analysis.
df.var.pvca <- mbecModelVariance(input.obj=dummy.mbec,
model.vars=c("batch", "group"), method='pvca')
}
\keyword{Evaluation}
\keyword{Model}
\keyword{Variance}
