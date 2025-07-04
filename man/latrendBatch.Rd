% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/latrend.R
\name{latrendBatch}
\alias{latrendBatch}
\title{Cluster longitudinal data for a list of method specifications}
\usage{
latrendBatch(
  methods,
  data,
  cartesian = TRUE,
  seed = NULL,
  parallel = FALSE,
  errorHandling = "stop",
  envir = NULL,
  verbose = getOption("latrend.verbose")
)
}
\arguments{
\item{methods}{A \code{list} of \code{lcMethod} objects.}

\item{data}{The dataset(s) to which to fit the respective \code{lcMethod} on.
Either a \code{data.frame}, \code{matrix}, \code{list} or an expression evaluating to one of the supported types.
Multiple datasets can be supplied by encapsulating the datasets using \code{data = .(df1, df2, ..., dfN)}.
Doing this results in a more readable \code{call} associated with each fitted \code{lcModel} object.}

\item{cartesian}{Whether to fit the provided methods on each of the datasets. If \code{cartesian=FALSE}, only a single dataset may be provided or a list of data matching the length of \code{methods}.}

\item{seed}{Sets the seed for generating a seed number for the methods.
Seeds are only set for methods without a seed argument or \code{NULL} seed.}

\item{parallel}{Whether to enable parallel evaluation. See \link{latrend-parallel}. Method evaluation and dataset transformation is done on the calling thread.}

\item{errorHandling}{Whether to \code{"stop"} on an error, or to \verb{"remove'} evaluations that raised an error.}

\item{envir}{The \code{environment} in which to evaluate the \code{lcMethod} arguments.}

\item{verbose}{The level of verbosity. Either an object of class \code{Verbose} (see \link[R.utils:Verbose]{R.utils::Verbose} for details),
a \code{logical} indicating whether to show basic computation information,
a \code{numeric} indicating the verbosity level (see \link[R.utils:Verbose]{R.utils::Verbose}),
or one of \code{c('info', 'fine', 'finest')}.}
}
\value{
A \code{lcModels} object.
In case of a model fit error under \code{errorHandling = pass}, a \code{list} is returned.
}
\description{
Fit a list of longitudinal cluster methods on one or more datasets.
}
\details{
Methods and datasets are evaluated and validated prior to any fitting. This ensures that the batch estimation fails as early as possible in case of errors.
}
\examples{
data(latrendData)
refMethod <- lcMethodLMKM(Y ~ Time, id = "Id", time = "Time")
methods <- lcMethods(refMethod, nClusters = 1:2)
models <- latrendBatch(methods, data = latrendData)

# different dataset per method
models <- latrendBatch(
   methods,
   data = .(
     subset(latrendData, Time > .5),
     subset(latrendData, Time < .5)
   )
)

}
\seealso{
lcMethods

Other longitudinal cluster fit functions: 
\code{\link{latrend}()},
\code{\link{latrendBoot}()},
\code{\link{latrendCV}()},
\code{\link{latrendRep}()}
}
\concept{longitudinal cluster fit functions}
