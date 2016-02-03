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
