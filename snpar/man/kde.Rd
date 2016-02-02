\name{kde}
\alias{kde}
\title{
Kernel Density and Distribution Estimation
}
\description{
To compute the non-parametric kernel estimation of the probability density function (PDF) and cumulative distribution function (CDF).
}
\usage{
kde(x, h, xgrid, ngrid, kernel = c("epan", "unif", "tria", "quar", 
    "triw", "tric", "gaus", "cos"), plot = FALSE)    
}
\arguments{
  \item{x}{a numeric vector of data values.}
  \item{h}{the smoothing bandwidth. See 'Details' of the default bandwidth.}
  \item{xgrid}{the user-defined data points at which the PDF and CDF are to be evaluated. The default is the data values \code{x}.}
  \item{ngrid}{the number of equally spaced points at which the PDF and CDF are to be evaluated. The default is \code{NULL}.}
  \item{kernel}{a character string which determines the smoothing kernel function. This must be one of \code{"unif"} (uniform), \code{"tria"} (triangular), \code{"epan"} (epanechnikov), \code{"quar"} (quartic), \code{"triw"} (triweight), \code{"tric"} (tricube), \code{"gaus"} (gaussian) and \code{"cos"} (cosine). The default is \code{"epan"}. }
  \item{plot}{a logical indicating whether to plot the estimated PDF and CDF graphs.}
}
\details{
Kernel density and distribution estimation is a non-parametric method to estimate the probability density function (PDF) and cumulative distribution function (CDF) by using kernel function for a continuous random variable. The default smoothing bandwidth is the plug-in optimal one in Fan and Gijbels (1996), i.e., \eqn{h = c*n^(-1/5)}, where the constant is replaced by (8*pi/3)^(1/5)*2.0362*(((quantile(x, 0.75) - quantile(x, 0.25))/1.349)^(2/3)) in this function. Missing values have been removed. 
}
\value{

  \item{x }{the original data values.}
  \item{xgrid}{the points where the PDF and CDF are to be evaluated.}
  \item{fhat}{the estimated PDF values at the specified points.}
  \item{Fhat}{the estimated CDF values at the specified points.}
  \item{bw}{the smoothing bandwidth used.}
}
\references{
Fan, I. Gijbels (1996). \emph{Local Polynomial Modeling and its Applications}. Chapman & Hall, London. pp. 47.

Wand, M. P. and Jones, M. C. (1995). \emph{Kernel Smoothing}. Chapman and Hall, London.
}
\author{
Debin Qiu <\email{debinqiu@uga.edu}>
}
\section{Warning}{The smoothing bandwidth is always a critical issue in non-parametric statistics. The default smoothing bandwidth suggested by Fan and Gijbels (1996) may not perform the best in some cases. You are recommended to provide one obtained by other methods.}
\examples{

x <- rnorm(200,2,3)
# with default bandwidth
kde(x, kernel = "quar", plot = TRUE)

# with specified bandwidth
kde(x, h = 4, kernel = "quar", plot = TRUE)
}
\keyword{ kde}