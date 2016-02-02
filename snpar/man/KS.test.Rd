\name{KS.test}
\alias{KS.test}
\title{
Kolmogorov-Smirnov Test
}
\description{
Perform a Kolmogorov-Smirnov test for one sample or two samples using kernel method.
}
\usage{
KS.test(x, y, ..., kernel = c("epan", "unif", "tria", 
        "quar", "triw", "tric", "gaus", "cos"), hx, hy, 
        alternative = c("two.sided", "less", "greater"))
}
\arguments{
  \item{x}{a numeric vector of data values.}
  
  \item{y}{either a numeric vector of data values, or a character string naming a cumulative distribution function or an actual cumulative distribution function such as \code{"pnorm"}. Only continuous CDFs are valid.}
  
  \item{\dots}{parameters of the distribution specified (as a character string) by \code{y}.}
  
  \item{kernel}{a character string which determines the smoothing kernel function. TThis must be one of \code{"unif"} (uniform), \code{"tria"} (triangular), \code{"epan"} (epanechnikov), \code{"quar"} (quartic), \code{"triw"} (triweight), \code{"tric"} (tricube), \code{"gaus"} (gaussian) and \code{"cos"} (cosine). The default is \code{"epan"}. }
  
  \item{hx}{the smoothing bandwidth for \code{x}. See 'Details' of the default bandwidth.}
  
  \item{hy}{the smoothing bandwidth for \code{y}. See 'Details' of the default bandwidth.}
  
  \item{alternative}{indicates the alternative hypothesis and must be one of "\code{two.sided}" (default), "\code{less}", or "\code{greater}".}
}
\details{
The traditional Kolmogorov-Smirnov test is based on the empirical cumulative distribution function (CDF) which is not continuous and may not provide good estimations to the true CDF. However, the CDF estimated by kernel method overcomes this shortcoming and generally performs much better than the empirical CDF. Namely, the kernel CDF is closer to the true CDF than the empirical CDF. Therefore, applying the kernel CDF is more reasonable than using the empirical CDF in Kolmogorov-Smirnov test. The test statistic is defined as the maximum difference in value and depends on the form of the alternative hypothesis. When the sample size is large, the test statistic has the following Kolmogorov-Smirnov distribution function: \deqn{K(x) = \sum(-1)^(j)*exp{-2*j^2*x^2}, j = - inf, ..., inf, x \ge 0,} and \eqn{K(x) = 0, x < 0}. See Conover, W. J. (1999) for more details. The default smoothing bandwidth is the plug-in optimal bandwidth used in Wang, Cheng and Yang (2013). Missing values have been removed.
}
\value{
A list with class "htest" containing the following components:

  \item{data.name}{	a character string giving the name(s) of the data. }

  \item{statistic}{	the value of the test statistic.}

  \item{p.value}{	the p-value of the test.}
  
  \item{method}{a character string indicating what type of test was performed.}

  \item{alternative}{	a character string describing the alternative hypothesis.}
}
\references{
Conover, W. J. (1999). \emph{Practical Nonparameteric Statistics} (Third Edition ed.). Wiley. pp. 396-406.

Wang, J., Cheng, F. and Yang, L. (2013). Smooth simultaneous confidence bands for cumulative distribution functions. \emph{Journal of Nonparametric Statistics}. 25, 395-407.
}
\author{
Debin Qiu <\email{debinqiu@uga.edu}>
}
\note{
This function only computes the p-value for large sample size. For small sample size, you can use \code{\link{ks.test}} to compute the exact p-value. Missing values have been removed.
}

\section{Warning }{The smoothing bandwidth is always a critical issue in non-parametric statistics. The default smoothing bandwidth suggested by Wang, Cheng and Yang (2013) may not perform well. This only gives the initial bandwidth in some cases. You are recommended to provide one obtained by other methods.}

\seealso{
\code{\link{ks.test}}
}
\examples{
# one-sample Kolmogorov-Smirnov test
x <- rnorm(100,2,3)
KS.test(x, "pnorm", 2, 3)

# two-sample Kolmogorov-Smirnov test
y <- rgamma(100,1,6)
KS.test(x,y)
}
\keyword{ KStest }
