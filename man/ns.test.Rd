\name{ns.test}
\alias{ns.test}
\title{
Normal Score (Van der Waerden) Test 
}
\description{
Perform a normal score (Van der Waerden) test of location(s) for one sample or two or multiple samples.
}
\usage{
ns.test(x, g = NULL, q, alternative = c("two.sided", "less", "greater"), 
        paired = FALSE, compared = FALSE, alpha = 0.05)
}
\arguments{
  \item{x}{a numeric vector of data values.}
  
  \item{g}{a factor of group values. The default is \code{NULL} for one-sample test.}
  
  \item{q}{a number used to form the null hypothesis for one-sample test only.}
  
  \item{paired}{a logical indicating whether you want a paired test for two samples.}
  
  \item{compared}{a logical indicating whether you want to compare the location of each group for multiple-sample test.}
  
  \item{alpha}{the Type I error for the pairwise comparision in multiple-sample test.}
  
  \item{alternative}{a character string specifying the alternative hypothesis, must be one of \code{"two.sided"} (default), \code{"greater"} or \code{"less"}.}
}
\details{
Normal score (Van der Waerden) test examines the location of one sample or equality of locations for two or multiple samples regardless of the distributions of the numeric data based on Van der Waerden rank scores. The Van der Waerden rank scores are defined  as the ranks of data, i.e., \eqn{R[i], i = 1, 2, ..., n}, divided by \eqn{1 + n} transformed to a normal score by applying the inverse of the normal distribution function, i.e., \eqn{\Phi^(-1)(R[i]/(1 + n))}. For two-sample or multiple-sample test, the ranks of data are obtained by ordering the observations from all groups. Note that the statistic for one-sample and two-sample test is normally distributed, but has a chi-squared distribution with \eqn{k-1} degrees of freedom for multiple-sample test, where \eqn{k} is the number of groups. For multiple-sample test, the pairwise comparsion is applied by controlling the familywise error rate with Bonferroni correction method. See Abdi, H. (2007) for more details.
}
\value{
For one- or two-sample test, a list with class "htest" containing the following components:
  
  \item{data.name}{a character string giving the names of the data.}
  
  \item{method }{the type of test applied.}
  
  \item{statistic}{the value of the test statistic with a name describing it.}
  
  \item{p.value}{the p-value for the test.}
  
  \item{alternative}{a character string describing the alternative hypothesis.}
  
For multiple-sample test, a list containing the above components plus the following components:
\item{df}{ degrees of freedom of chi-squared distribution for multiple-sample test.}

\item{compare}{a matrix indicting whether the locations of two different groups are equal.}
}
\references{
Abdi, H. (2007). Bonferroni and Sidak corrections for multiple comparisons". In Salkind, N. J. \emph{Encyclopedia of Measurement and Statistics}. Thousand Oaks, CA: Sage.

Conover, W. J. (1999). \emph{Practical Nonparameteric Statistics} (Third Edition ed.). Wiley. pp. 396-406.

Wu, X. and Zhao, B. (2013). \emph{Nonparametric Statistics} (Fourth Edition ed). China Statistics Press.
}
\author{
Debin Qiu   <\email{debinqiu@uga.edu}>
}
\note{
The normal score test provides high efficiency compared to other nonparametric test methods based on ranks of data when the normality assumptions are nealy or in fact satisfied. It is also roubust to the violation of normality assumtions. 
}
\seealso{
\code{\link{wilcox.test}}, \code{\link{kruskal.test}}
}
\examples{
# one-sample test
x <- c(14.22, 15.83, 17.74, 19.88, 20.42, 21.96, 22.33, 22.79, 23.56, 24.45)
ns.test(x, q = 19)

# two-sample test
y <- c(5.54, 5.52, 5.00, 4.89, 4.95, 4.85, 4.80, 4.78, 4.82, 4.85, 4.72, 4.48, 
       4.39, 4.36, 4.30, 4.26, 4.25, 4.22)
group <- gl(2,9)
## independent two-sample test
ns.test(y, group)
## paired two-sample test
ns.test(y,group, paired = TRUE)

# multiple-sample test
z <- c(10.7, 10.8, 10.5, 10.9, 9.7, 14.5, 12.2, 12.4, 12.8, 12.7, 15.2, 12.3, 
       13.5, 14.7, 15.6)
gr <- gl(3,5)
ns.test(z, gr, compared = TRUE)
}
\keyword{ nstest }
