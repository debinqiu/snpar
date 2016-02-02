\name{quant.test}
\alias{quant.test}
\title{
Quantile Test 
}
\description{
Perform a one-sample quantile test  and two-sample equality of quantiles. 
}
\usage{
quant.test(x, y = NULL, q, paired = FALSE, p = 0.5,
          alternative = c("two.sided", "less", "greater"), 
          exact = FALSE, correct = TRUE)
}
\arguments{
  \item{x}{a numeric vector of data values.}
  
  \item{y}{a numeric vector of data or group values.}
  
  \item{q}{a quantile used to form the null hypothesis for one-sample test only.}
  
  \item{paired}{a logical indicating whether you want a paired test for two samples. }
  
  \item{p}{probability of the quantile, must be between 0 and 1. The default is 0.50 which is the median.}
  
  \item{alternative}{a character string specifying the alternative hypothesis, must be one of \code{"two.sided"} (default), \code{"greater"} or \code{"less"}.}
  
  \item{exact}{a logical indicating whether an exact p-value should be computed. See 'Details' for the meaning of \code{TRUE}.}
  
  \item{correct}{a logical indicating whether to apply continuity correction in the normal approximation for the p-value. The default is \code{TRUE}.}
}
\details{
Quantile test examines the location of one sample or the equality of locations for two samples. Compared to the t-test, quantile test does not require the normality assumptions of the data. So it is more general than the t-test, although it lacks statistical power when the normality assumptions do hold. For exact one-sample test, it is also called sign test. For this test, a new sequence is obtained by subtracting the location \eqn{q} from the original numeric sample and removing element(s) 0. The totals of positive or negative signs of the new sequence is defined as \eqn{S+} or \eqn{S-}. Thus, \eqn{S+} or \eqn{S-} has a binomial distribution with probability \eqn{p}. The paired-sample test has the similar procedures for the sequence of paired difference except setting \eqn{q = 0}. For exact two-sample quantile test, it is also called Brwon-Mood test which is based on hypergeometric distribution for the total numbers of the first sample greater than the pooled median. When the sample size is large, one can also use the normal approximation, i.e., argument \code{exact = FALSE}, to the binomal distribution (one-sample case) and hypergeometric distribution (two-sample case) with or without continuity correction. See Conover, W. J. (1999) for more details. Missing values have been removed.   
}
\value{
A list with class "htest" containing the following components:
  \item{data.name}{	a character string giving the names of the data.}
  
  \item{method}{ the type of test applied.}
  
  \item{statistic}{	the value of the test statistic with a name describing it.}

  \item{p.value}{	the p-value for the test.}

  \item{alternative}{	a character string describing the alternative hypothesis.}
}
\references{
Conover, W. J. (1999). \emph{Practical Nonparameteric Statistics} (Third Edition ed.). Wiley. pp. 396-406.

}
\author{
Debin Qiu  <\email{debinqiu@uga.edu}>
}
\seealso{
\code{\link{wilcox.test}}, \code{\link{ns.test}}
}
\examples{
# one-sample test
x <- c(14.22, 15.83, 17.74, 19.88, 20.42, 21.96, 22.33, 22.79, 23.56, 24.45)
## normal approximation test
quant.test(x, q = 19)
## exact quantile test 
quant.test(x, q = 19, exact = TRUE)

# two-sample test
y <- c(5.54, 5.52, 5.00, 4.89, 4.95, 4.85, 4.80, 4.78, 4.82, 4.85, 4.72, 4.48, 
       4.39, 4.36, 4.30, 4.26, 4.25, 4.22)
group <- as.numeric(gl(2,9))
## independent two-sample test
quant.test(y, group, exact = TRUE)
## paired two-sample test
quant.test(y,group, paired = TRUE)
}
\keyword{ quanttest }
