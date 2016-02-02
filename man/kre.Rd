\name{kre}
\alias{kre}
\title{
Kernel Regression Estimation
}
\description{
To fit a non-parametric relation between a pair of random variables by using kernel method.
}
\usage{
kre(x, y, h, kernel = c("epan", "unif", "tria", "quar", 
     "triw", "tric", "gaus", "cos"), plot = FALSE)   
}
\arguments{
  \item{x}{input of explanatory values.}
  
  \item{y}{input of response values.}
  
  \item{h}{the smoothing bandwidth. See 'Details' of the default bandwidth.}
  
  \item{kernel}{a character string which determines the smoothing kernel function. This must be one of \code{"unif"} (uniform), \code{"tria"} (triangular), \code{"epan"} (epanechnikov), \code{"quar"} (quartic), \code{"triw"} (triweight), \code{"tric"} (tricube), \code{"gaus"} (gaussian) and \code{"cos"} (cosine). The default is \code{"epan"}. }
  
  \item{plot}{a logical indicating whether to plot the graph with fitted line. }
}
\details{
Kernel regression is a non-parametric technique to find a non-linear relation between a pair of random variables \eqn{X} and \eqn{Y}. It is also called Nadaraya-Watson kernel regression which estimates the conditional expectation of a random variable, i.e., \eqn{E(Y|X)}. The default smoothing bandwidth is the optimal plug-in bandwidth in Fan and Gijbels (1996), i.e., \eqn{h = c*n^(-1/5)}, where \eqn{c} is a constant and replaced by \eqn{IQR} in this function. Note that it provides the initial bandwidth and may not be the best one. Missing values have been removed.
}
\value{
       \item{results}{a matrix including the original data of explanatory variable \code{x} (first column), the original data of response variable \code{y} (second column), and the fitted values of response \code{yhat} (third column). }
       
       \item{bw}{ the smoothing bandwidth used.}
}
\references{
Fan, I. Gijbels (1996). \emph{Local Polynomial Modeling and its Applications}. Chapman & Hall, London.

Li, Q., Racine, J. (2007). \emph{Nonparametric Econometrics: Theory and Practice}. Princeton University Press. ISBN 0-691-12161-3.

Nadaraya, E. A. (1964). On Estimating Regression. \emph{Theory of Probability and its Applications} 9(1): 141-2.

}
\author{
Debin Qiu <\email{debinqiu@uga.edu}>
}

\section{Warning }{The smoothing bandwidth is always a critical issue in non-parametric statistics. The default smoothing bandwidth suggested by Fan and Gijbels (1996) may not perform well in some cases. You are recommended to provide one obtained by other methods.} 
\examples{
x <- rnorm(100)
y <- 1 + 4*x^2 + rnorm(100)
kr <- kre(x,y, kernel = "epan", plot = TRUE)

}
\keyword{ kre }
