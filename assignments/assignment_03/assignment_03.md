# Assignment 3

###### B06901048

###### 電機五 陳昱行



## Problem 1

### a.


$$
f_Y(y) &=& \int_{-\sqrt{1-y^2}}^{\sqrt{1-y^2}} \frac{1}{\pi} \,dx \\
&=& \left[\frac{1}{\pi}x\right]^\sqrt{1-y^2}_{-\sqrt{1-y^2}} \\
&=& \frac{2}{\pi}\sqrt{1-y^2}
$$

$$
f_{Y|X}(y|x) &=& \frac{f_{X,Y}(x,y)}{f_X(x)} \\
&=& \frac{\frac{1}{\pi}}{\frac{2}{\pi}\sqrt{1-x^2}} \\
&=&\frac{1}{2\sqrt{1-x^2}}
$$

### b.

$$
\mathbb{E}[Y|X = x] &=& \int_{-\sqrt{1-x^2}}^{\sqrt{1-x^2}}\frac{y}{2\sqrt{1-x^2}} \, dy \\
&=& 0
$$
Since
$$
f(x,y) = \frac{y}{2\sqrt{1-x^2}}
$$
is an odd function of $y$



## Problem 2
### a.

No it's not.

A valid CDF shoud have following property
$$
\lim_{x,y\to1}F(x,y) = 1 & (1) \\
\lim_{x,y\to0}F(x,y) = 0 & (2)
$$
And by definition of marginal CDF
$$
\lim_{x\to 0,y\to1}F(x,y) = 0 & (3) \\
\lim_{x \to 1,y\to0}F(x,y) = 0 & (4)
$$
And F(x,y) does not satisfy property (3) and (4)

### b.

By definition, we can derive marginal CDF by
$$
F(1,y) &=& F_Y(y) &=& \frac{1+y}{2} &, y \in [0,1] \\
F(x,1) &=& F_X(x) &=& \frac{1+x}{2} &, x \in [0,1]
$$
By definition of marginal pdf
$$
\frac{\partial F(x,y)}{\partial x} = f_X(x) = \frac{1}{2} &, x \in [0,1] \\
\frac{\partial F(x,y)}{\partial y} = f_Y(y) = \frac{1}{2} &, y \in [0,1]
$$

### c.
No, since
$$
\frac{\partial^2 F(x,y)}{\partial y \partial x} = 0
$$
which is not a valid joint PDF



## Problem 3

### a.

$$
P(X > Y) &=&  P(X=2,Y=1) + P(X=3,Y\le2)+P(X=4,Y\le3)+...+P(X=12,Y\le6)\\
&=&\frac{1\times1+2\times2+3\times3+4\times4+5\times5+6\times6+(6+5+4+3+2+1)\times6}{6\times6\times6} \\
&=& \frac{181}{216}
$$

### b.

Let the sum of Ray's daughter throwing $$2i$$ dices be $$X_i$$ and him throwing $$i$$ dices $Y_i$ 

Let $\bar{W}_i =\bar{X}_i - \bar{Y}_i= \frac{X_i-Y_i}{i}$

Then we know that
$$
\mathbb{E}[\bar{W}_i] &=& \mathbb{E}[\bar{X_i}] - \mathbb{E}[\bar{Y}_i] \\
&=& 7 - 3.5 \\
&=& 3.5 \\
Var[\bar{W}_i] &=& Var[\bar{X}_i] + Var[\bar{Y}_i] = \frac{35}{12} + \frac{70}{12} = \frac{35}{4}
$$
By Central limit theorem,
$$
&\sqrt{n}(\bar{X_n}-\mu) \xrightarrow{d} N(0,\sigma^2) \\
\Rightarrow& \sqrt{n}(\bar{W}_n-3.5) \xrightarrow{d} N(0,\frac{35}{4}) \\
\Rightarrow& \frac{\sqrt{n}(\bar{W}_n-3.5)}{\sqrt{\frac{35}{4}}} \xrightarrow{d} N(0,1) \\
\Rightarrow& P(\bar{W}_n > 0) = \Phi(\frac{-3.5\sqrt{n}}{\sqrt{\frac{35}{4}}})
$$
if $n$ is large enough



## Problem 4

### a.

$$
\mathbb{E}[X] = \frac{1}{2}\times3 + \frac{1}{2}\times\frac{1}{3} = \frac{5}{3}\\
\mathbb{E}[\ln(X)] = 1/2\times\ln(3)+1/2\times\ln(\frac{1}{3}) = 0
$$

### b.

Since $\{X_i\}^n_{i=1}$ are i.i.d random variables
$$
\mathbb{E}[Y_n] = \mathbb{E}[\prod_{i=1}^{n}X_i] = \prod_{i=1}^{n}\mathbb{E}[X_i] = \left(\frac{5}{3}\right)^n\\
\mathbb{E}[\ln(Y_n)] = \mathbb{E}[\sum^n_{i=1}\ln X_i] = \sum^n_{i=1}\mathbb{E}[\ln X_i] = 0
$$

### c.

``` r
par(mfcol=c(3,2))
y_n <- function(n){
    # do n trials(Xn) with fliping only once and count success time (0 or 1)
    return(replicate(2000,prod(8/3*rbinom(n,1,0.5)+1/3), simplify = "array"))
}
log_y_n <- function(n){
    return(replicate(2000,sum(log(8/3*rbinom(n,1,0.5)+1/3)), simplify = "array"))
}
y_1 <- y_n(1)
y_10 <- y_n(10)
y_100 <- y_n(100)
log_y_1 <- log_y_n(1)
log_y_10 <- log_y_n(10)
log_y_100 <- log_y_n(100)
hist(y_1,breaks = 20)
hist(y_10,breaks= 20)
hist(y_100,breaks= 20)
hist(log_y_1,breaks = 20)
hist(log_y_10,breaks = 20)
hist(log_y_100,breaks = 20)
```

![](assignment_03_R_files/figure-markdown_github/unnamed-chunk-1-1.png)



## Problem 5

### a.

Let $\mathbb{E}[X] = \mu$ and $\mathbb{E}[Y] = \nu$
$$
\mathbb{E}\left[\sum_{i=1}^n(X_i-\bar{X})(Y_i-\bar{Y})\right] = \mathbb{E}\left[\sum_{i=1}^n\left[(X_i-\mu)+(\mu-\bar{X})\right]\left[((Y_i-\nu)+(\nu-\bar{Y})\right]\right] \\
=\mathbb{E}\left[\sum_{i=1}^n\left[(X_i-\mu)(Y_i-\mu)+(X_i-\mu)(\nu-\bar{Y}) + (\mu-\bar{X})(Y_i-\nu)+(\mu-\bar{X})(\nu-\bar{Y})\right]\right] \\
= ncov(X,Y) - cov(X,Y)  - cov(X,Y) + cov(X,Y) \\
= (n-1)cov(X,Y)
$$
Therfore $ \hat{\sigma}_{XY} = \frac{1}{n}\mathbb{E}\left[\sum_{i=1}^n(X_i-\bar{X})(Y_i-\bar{Y})\right]  = \frac{n-1}{n}cov(X,Y)$

which is a downward biased estimator

### b.

$$
\hat{\sigma}_{XY} &=& \frac{1}{n}\sum_{i=1}^n(X_i-\bar{X})(Y_i-\bar{Y}) \\
&=&\frac{1}{n}\sum_{i=1}^nX_iY_i - \bar{X}\bar{Y}
$$

By WLLN
$$
\frac{1}{n}\sum_{i=1}^nX_iY_i - \bar{X}\bar{Y} \xrightarrow[W.L.L.N]{p} \frac{1}{n}\sum_{i=1}^nX_iY_i - \mu\nu = cov(X,Y)
$$
Therefore, $\hat{\sigma_{XY}}$ is a consistent estimator

### c.

``` r
library("MASS")
cov_mat  <- matrix(c(1,0.5,0.5,1),2,2)
mu <- c(0,0)
sigma_n <- function(n){
    #cov return a covariance matrix
    return(replicate(2000,cov(mvrnorm(n,mu,cov_mat))[1,2],simplify = "array"))
}
sigma_10 <- sigma_n(10)
sigma_100 <- sigma_n(100)
par(mfrow=c(1,2))
hist(sigma_10,breaks=100)
hist(sigma_100,breaks=100)
```

![](assignment_03_R_files/figure-markdown_github/unnamed-chunk-2-1.png)