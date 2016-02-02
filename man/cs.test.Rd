%%%%
\name{cs.test}
\alias{cs.test}
\title{
Cox-Stuart Trend Test
}
\description{
Perform one-sample Cox-Stuart trend test.
}
\usage{
cs.test(x, alternative = c("two.sided", "increasing", "decreasing"), 
        exact = TRUE, correct = TRUE)
}
\arguments{
  \item{x}{ a numeric vector of data values.}

  \item{alternative}{ indicates the alternative hypothesis and must be one of \code{"two.sided"} (default), \code{"increasing"}, or \code{"decreasing"}.}

  \item{exact}{ \code{TRUE} (default) or \code{FALSE} indicating whether an exact p-value should be computed. See 'Details' for the meaning of \code{TRUE}.}

  \item{correct}{ a logical indicating whether to apply continuity correction in the normal approximation for the p-value. The default is \code{TRUE}.}
}
\details{
Cox-Stuart trend analysis is a robust method to detect the presence of the trend regardless of the distribution of the data. Given the independent data, i.e., \eqn{X[1],...,X[n]}, one can divide the data into two sequences with equal number of observations cutted in the midpoint and then take the paired difference, i.e., \eqn{D = X[i] - X[i+c], i = 1, ..., floor(n/2)}, where \eqn{c} is the index of midpoint. The totals of the positive or negative sign in \eqn{D} is defined as \eqn{S+} or \eqn{S-}. Under null hypothesis, \eqn{S+} or \eqn{S-} has a binomial distribution with the number of experiment being the number of elements in \eqn{D} after removing element(s) 0 and probability \eqn{p = 0.5}. The exact method (\code{exact = TRUE}) is based on binomial distribution of statistic \eqn{S+} (\code{"increasing"}) or \eqn{S-} (\code{"decreasing"}) or \eqn{S = min(S+, S-)} (\code{"two.sided"}) and one can thus compute the exact p-value. When the sample size is large, one can also use the normal approximation (argument \code{exact = TRUE}) to the binomial distribution with or without continuity correction. Missing values have been removed.
}
\value{
A list with class "htest" containing the following components:

  \item{data.name}{a character string giving the names of the data.}

  \item{method }{the type of test applied.}

  \item{alternative}{a character string describing the alternative hypothesis.}

  \item{p.value}{the p-value for the test.}

  \item{statistic}{the value of the test statistic with a name describing it.}
}
\references{
 D.R. Cox and A. Stuart (1955). Some quick sign tests for trend in location and dispersion. \emph{Biometrika}, Vol. 42, pp. 80-95.
}
\author{
Debin Qiu  <\email{debinqiu@uga.edu}>
}
\examples{
x <- 0.5*c(1:100) + rnorm(100,2,20)
# exact method
cs.test(x)
# approximate method
cs.test(x, exact = FALSE)
}
\keyword{cstest }