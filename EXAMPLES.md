## Examples of `snpar` examples ##

We give some simple examples below to show the usages of each function in this package. 

- **Con-Stuart Trend Test**: 
```
cs.test(x, alternative = c("two.sided", "increasing", "decreasing"), exact = TRUE, correct = TRUE)
```
 This function performs a one-sample Cox-Stuart trend test which is to examine the decreasing or increasing or none trend for a univariate data. The null hypothesis is that the data has no trend. For example, we generate data which contain an increasing trend and use `cs.test` to test the trend. Both exact and approximate give a small p-value which is smaller than 0.05, indicating that the data have a monotonic trend.
```
> set.seed(123)
> x <- 0.5*c(1:100) + rnorm(100,2,20)
> cs.test(x) # exact method for small samples

	Exact Cox-Stuart trend test
	
data:  x
S = 8, p-value = 1.164e-06
alternative hypothesis: data have a monotonic trend

> cs.test(x, exact = FALSE) # approximate method for large samples

	Approximate Cox-Stuart trend test
	
data:  x
S = 8, p-value = 3.058e-06
alternative hypothesis: data have a monotonic trend
```
![trendx](https://cloud.githubusercontent.com/assets/16762941/12869162/0ecf2ec8-cce5-11e5-8927-2caa61452cec.png)

- **Randomness Test**:
```
runs.test(x, exact = FALSE, alternative = c("two.sided", "less", "greater"))
```
This function performs the runs test for randomness of univariate data. The null hypothesis is that the univariate data is random without any patterns. We first examine the randomness of data generated from standard normal distribution. The p-value indicates to not reject the null hypothesis. 
```
> set.seed(123)
> x <- rnorm(100)
> runs.test(x)

	Approximate runs rest

data:  x
Runs = 49, p-value = 0.6877
alternative hypothesis: two.sided
```
The second example examines the data generated from AR(1) process which is indeed not a random series. This is confirmed by the small p-value that we reject the null hypothesis.  
```
> set.seed(123)
> y <- arima.sim(list(order = c(1,0,0), ar = 0.7), n = 200)
> runs.test(y)

	Approximate runs rest

data:  y
Runs = 54, p-value = 2.673e-11
alternative hypothesis: two.sided
```

- **Normal Score (Van der Waerden) Test**:
```
ns.test(x, g = NULL, q, alternative = c("two.sided", "less", "greater"), 
        paired = FALSE, compared = FALSE, alpha = 0.05)
```
This function performs a normal score (Van der Waerden) test of location(s) for one sample or two or multiple samples. The normal score test provides high efficiency compared to other nonparametric test methods based on ranks of data when the normality assumptions are nealy or in fact satisfied. It is also roubust to the violation of normality assumtions.

We first examine the true location of a one-sample data whether is equal to 19. The p-value suggests us to not rejrect the null hypothesis. We also use the t-test to examine the true location and get the same result.
```
> x <- c(14.22, 15.83, 17.74, 19.88, 20.42, 21.96, 22.33, 22.79, 23.56, 24.45)
> ns.test(x, q = 19)

	One-sample normal score test

data:  x
statistic = 1.1345, p-value = 0.2566
alternative hypothesis: true location is not equal to 19

> t.test(x,mu = 19)

	One Sample t-test

data:  x
t = 1.2225, df = 9, p-value = 0.2526
alternative hypothesis: true mean is not equal to 19
95 percent confidence interval:
 17.87907 22.75693
sample estimates:
mean of x 
   20.318 
```
The second example is to examine independent or paired two-sample data

```
> y <- c(5.54, 5.52, 5.00, 4.89, 4.95, 4.85, 4.80, 4.78, 4.82, 4.85, 4.72, 4.48, 
         4.39, 4.36, 4.30, 4.26, 4.25, 4.22)
> group <- gl(2,9)
> ns.test(y, group) ## independent two-sample test

	Two-sample normal score test

data:  y with group group
statistic = 3.16, p-value = 0.001578
alternative hypothesis: true location shift is not equal to 0

> ns.test(y,group, paired = TRUE)  ## paired two-sample test

	Paired two-sample normal score test

data:  y with group group
statistic = 2.5419, p-value = 0.01103
alternative hypothesis: true location is not equal to 0
```
The third example is to test the true locations of each independent sample from different groups. The p-value (0.00622) shows that the true locations of each sample is different. More specifically, group 1 and 2 ("YES"), group 1 and 3 ("YES") are different in true locations, but group 2 and 3 ("NO") are not distinct. 
```
> z <- c(10.7, 10.8, 10.5, 10.9, 9.7, 14.5, 12.2, 12.4, 12.8, 12.7, 15.2, 12.3, 
         13.5, 14.7, 15.6)
> gr <- gl(3,5)
> ns.test(z, gr, compared = TRUE)
$data.name
[1] "z with group gr"

$method
[1] "Multiple-sample normal score test"

$statistic
statistic 
  10.1596 

$p.value
[1] 0.00622115

$alternative
[1] "at least one population is greater than at least one of the others"

$parameter
df 
 2 

$compare
     group group DIFF 
[1,] "1"   "2"   "YES"
[2,] "1"   "3"   "YES"
[3,] "2"   "3"   "NO" 
```

- **Quantile Test**
```
quant.test(x, y = NULL, q, paired = FALSE, p = 0.5, alternative = c("two.sided", "less", "greater"), 
          exact = FALSE, correct = TRUE)
```
This function examines the quantile of one-sample or two-sample data, i.e., whether the quantile of one-sample data is equal to some value, or whether the two-sample data have the same quantile. The default of quantile is the median (`p = 0.5`).
```
> x <- c(14.22, 15.83, 17.74, 19.88, 20.42, 21.96, 22.33, 22.79, 23.56, 24.45)  # one-sample test
> quant.test(x, q = 19)  ## normal approximation test

	Approximate one-sample quantile test

data:  x
location = 21.19, p-value = 0.2059
alternative hypothesis: true location is not equal to 19

> quant.test(x, q = 19, exact = TRUE)  ## exact quantile test 

	Exact one-sample quantile test

data:  x
location = 21.19, p-value = 0.3438
alternative hypothesis: true location is not equal to 19

> y <- c(5.54, 5.52, 5.00, 4.89, 4.95, 4.85, 4.80, 4.78, 4.82, 4.85, 4.72, 4.48, 
         4.39, 4.36, 4.30, 4.26, 4.25, 4.22)  # two-sample test
> group <- as.numeric(gl(2,9))
> quant.test(y, group, exact = TRUE)  ## independent two-sample test

	Exact two-sample (Brown-Mood) quantile test

data:  y with group group
Difference = 0.53, p-value = 4.114e-05
alternative hypothesis: true location shift is not equal to 0

> quant.test(y,group, paired = TRUE)  ## paired two-sample test

	Approximately paired two-sample quantile test

data:  y with group group
location = 0.55, p-value = 0.0027
alternative hypothesis: true location is not equal to 0
```
- **Kernel Density and Distribution Estimation**:
```
kde(x, h, xgrid, ngrid, kernel = c("epan", "unif", "tria", "quar", 
                                   "triw", "tric", "gaus", "cos"), plot = FALSE)  
```
This function is to compute the non-parametric kernel estimation of the probability density function (PDF) and cumulative distribution function (CDF).
```
> set.seed(123)
> x <- rnorm(200,2,3)
> kde(x, kernel = "quar", plot = TRUE)  # with default bandwidth
```
![kde1](https://cloud.githubusercontent.com/assets/16762941/12869161/0ecdc088-cce5-11e5-95b9-7271a03493f1.png)

```
> kde(x, h = 4, kernel = "quar", plot = TRUE)   # with specified bandwidth
```
![kde2](https://cloud.githubusercontent.com/assets/16762941/12869163/0ecf6140-cce5-11e5-8379-ef855d5a39ba.png)

- **Kernel Regression**:
```
kre(x, y, h, kernel = c("epan", "unif", "tria", "quar", "triw", "tric", "gaus", "cos"), plot = FALSE) 
```
This function is to fit a non-parametric relation between a pair of random variables by using kernel method.
```
> set.seed(123)
> x <- rnorm(100)
> y <- 1 + 4*x^2 + rnorm(100)
> kr <- kre(x,y, kernel = "epan", plot = TRUE)
```
![kre](https://cloud.githubusercontent.com/assets/16762941/12869164/0ecf7fa4-cce5-11e5-8906-38b5ff2fddc0.png)

- **Kolmogorov-Smirnov Test**:
```
KS.test(x, y, ..., kernel = c("epan", "unif", "tria", "quar", "triw", "tric", "gaus", "cos"), hx, hy, 
        alternative = c("two.sided", "less", "greater"))
```
This function performs a Kolmogorov-Smirnov test for one sample or two samples using kernel method. It is similar to `ks.test` for the default Kolmogorov-Smirnov test in R, but different in that `KS.test` uses the kernel method to estimate the CDF instead of empirical CDF. We first look at an example for one-sample test.
```
> # one-sample Kolmogorov-Smirnov test
> set.seed(123)
> x <- rnorm(100,2,3)
> KS.test(x, "pnorm", 2, 3)

	One-sample kernel Kolmogorov-Smirnov test

data:  x
D = 0.053588, p-value = 0.4681
alternative hypothesis: two.sided

> 
> # compared with normal Kolmogorov-Smirnov test
> ks.test(x, "pnorm", 2, 3)

	One-sample Kolmogorov-Smirnov test

data:  x
D = 0.093034, p-value = 0.3522
alternative hypothesis: two-sided
```
Now we examine the test for two-sample data, which is to test if the two samples have the same distribution.
```
> # two-sample Kolmogorov-Smirnov test
> set.seed(123)
> y <- rgamma(100,1,6)
> KS.test(x,y)

	Two-sample kernel Kolmogorov-Smirnov test

data:  x and y
D = 0.6031, p-value < 2.2e-16
alternative hypothesis: two.sided

> 
> ks.test(x,y)

	Two-sample Kolmogorov-Smirnov test

data:  x and y
D = 0.72, p-value < 2.2e-16
alternative hypothesis: two-sided
```
