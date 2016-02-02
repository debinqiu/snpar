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