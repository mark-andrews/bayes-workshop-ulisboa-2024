% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bernoulli_models.R
\name{beta_summary}
\alias{beta_summary}
\title{Summary statistics of a Beta distribution}
\usage{
beta_summary(alpha, beta, interval = 0.95)
}
\arguments{
\item{alpha}{First shape parameter of the Beta distribution}

\item{beta}{Second shape parameter of the Beta distribution}

\item{interval}{The probability mass in posterior quantile interval}
}
\value{
A list with summary statistics of the Beta distribution
}
\description{
Summary statistics of a Beta distribution
}
\examples{
beta_summary(3, 5)
}
