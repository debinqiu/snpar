\name{runs.test}
\alias{runs.test}
\title{
Runs Test for Randomness
}
\description{
Perform the runs test for randomness of a numeric sequence.
}
\usage{
runs.test(x, exact = FALSE, alternative = c("two.sided", "less", "greater"))
}
\arguments{
  \item{x}{ a numeric vector of data values.
}
  \item{exact}{ \code{TRUE} or \code{FALSE} (default) indicating whether an exact p-value should be computed. See 'Details' for the meaning of \code{TRUE}.
}
  \item{alternative}{ indicates the alternative hypothesis and must be one of \code{"two.sided"} (default), \code{"less"}, or \code{"greater"}. See 'Details' for the meanings of the possible values.
}
}
\details{
Runs test examines the randomness of a numeric sequence \eqn{x} by studying the frequency of runs \eqn{R}. Generally, every numeric sequence can be transformed into dichotomous (binary) data defined as 0 and 1 by comparing each element of the sequence to its median (default threshold). Given \eqn{m} 0 and \eqn{n} 1, the runs \eqn{R} is defined as a series of similar responses and has a statistical distribution. See Wald, A. and Wolfowitz, J. (1940) for more details of this distribution. Based on the known distribution, the exact p-value can be computed for the data with small sample size. When the sample size is large, one can use the normal approximation (argument \code{exact = TRUE}) with mean \eqn{2mn/(m + n) +1} and variance \eqn{2mn(2mn - m - n)/((m + n)^2*(m + n - 1))}. The null of randomness is tested against the "under-mixing" trend and "over-mixing" trend by using alternative \code{"less"} and \code{"greater"}. Missing values have been removed.
}
\value{
A list with class "htest" containing the following components: 
  \item{data.name}{a character string giving the names of the data.}
  \item{method }{the type of test applied.}
  \item{alternative}{a character string describing the alternative hypothesis.}
  \item{statistic}{the value of the test statistic with a name describing it.}
  \item{p.value}{the p-value for the test.}
}
\references{
Wald, A. and Wolfowitz, J. (1940). On a test whether two samples are from the same population. \emph{Ann. Math Statist.} 11, 147-162.

Wu, X. and Zhao, B. (2013). \emph{Nonparametric Statistics} (Fourth Edition ed). China Statistics Press. pp. 40-42.
}
\author{
Debin Qiu  <\email{debinqiu@uga.edu}>
}
\section{Warning}{
When the runs \eqn{R} is large, the exact p-value cannot be computed as the combination in the distribution function of \eqn{R} will be infinity. Please use argument \code{"exact = F"} or \code{"exact = FALSE"} in this case.
}
\examples{
x <- rnorm(100)
runs.test(x)

y <- c(12.85, 13.29, 12.41, 15.21, 14.23, 13.56)
runs.test(y, exact = TRUE)
}
\keyword{ runtest }
