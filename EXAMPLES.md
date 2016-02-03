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
