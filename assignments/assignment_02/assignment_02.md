# Assignment 2

###### b06901048 電機五 陳昱行

Problem1
--------

### a.

``` r
H <- function(n,r){
    return(choose(n+r-1,r))
}
H(6,20)
```

    ## [1] 53130

### b.

``` r
H(6,14)
```

    ## [1] 11628

Problem2
--------

### a.

``` r
1/choose(12,2)
```

    ## [1] 0.01515152

### b.

``` r
choose(10,2)/choose(12,2)
```

    ## [1] 0.6818182

Problem3
--------

### a.

``` r
p.die <- 2/3*1/2 + 1/3*1/4
p.die
```

    ## [1] 0.4166667

### b.

``` r
# P(didn't take care | die) = P(didn't take care && die)/P(die)
(1/3)*(3/4)/p.die
```

    ## [1] 0.6

Problem4
--------

### a.

$$
f(x)=\left\{
\begin{align*}
& 0 & ,  & if\quad x<2 \quad or \quad x>4& \\
& -\frac 12 x + 2 & , & if\quad 2\le x \le 4 & \\
\end{align*}
\right.
$$

### b.

$$
\mathbb{P}(X < 3) = F(3) = 0.75 \\
\mathbb{P}(X = 4) = 0
$$

### c.

$$
\mathbb{E}(X) = \int_{2}^{4} xf(x)dx = [ - \frac 16 x^3 + x^2 ]_2^4 = \frac 83 \\
\mathbb{E}(X^2) = \mathbb{E}(X^2) = \int_{2}^4 x^2f(x)dx = \frac {22}{3} \\
var(X) = \frac{22}{3} - \frac{64}{9} = \frac 29
$$

Problem5
--------

### a.

``` r
1-pnorm(50,mean=42.1,sd=20.8)
```

    ## [1] 0.3520441

### b.

``` r
pnorm(40,mean=42.1,sd=20.8) - pnorm(30,mean=42.1,sd=20.8)
```

    ## [1] 0.1794165

Problem6
--------

``` r
1-pbinom(7,10,0.5)
```

    ## [1] 0.0546875

Problem7
--------

### a.

poisson distrubution

### b.

$$
\mathbb{E}(Y) = 3,\quad \mathbb{E}(X) = \frac 13 
$$

### c.

``` r
# P(Y=5)
dpois(5,3)
```

    ## [1] 0.1008188

``` r
# P(Y < 1)
dpois(0,3)
```

    ## [1] 0.04978707

Problem8
--------

``` r
print(paste("A single pair: ",choose(4,2)*13*choose(48,3)/choose(52,5)))
```

    ## [1] "A single pair:  0.519087635054022"

``` r
print(paste("Two pairs: ",choose(4,2)*choose(4,2)*choose(13,2)*choose(11,1)*4/choose(52,5)))
```

    ## [1] "Two pairs:  0.0475390156062425"

``` r
print(paste("Tree of a kind ",choose(4,3)*13*choose(48,2)/choose(52,5)))
```

    ## [1] "Tree of a kind  0.0225690276110444"

``` r
print(paste("Flush: ",4*(choose(13,5)-9)/choose(52,5)))
```

    ## [1] "Flush:  0.00196694062240281"

``` r
print(paste("Full House ",13*choose(4,3)*12*choose(4,2)/choose(52,5)))
```

    ## [1] "Full House  0.0014405762304922"

``` r
print(paste("Four of a kind",13*12*4/choose(52,5)))
```

    ## [1] "Four of a kind 0.000240096038415366"

``` r
print(paste("Straight Flush: ",4*9/choose(52,5)))
```

    ## [1] "Straight Flush:  1.38516945239634e-05"
