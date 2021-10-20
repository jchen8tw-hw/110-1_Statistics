# 02 Descriptive Statistics
# Jui-Chung Yang
# September 2021
#
# Heumann, Christian, Michael Schomaker, and Shalabh (2016),
# Introduction to Statistics and Data Analysis:
# With Exercises, Solutions and Applications in R, Springer.
#   https://link.springer.com/book/10.1007/978-3-319-46162-5
#
# This book's homepage:
#   http://chris.userweb.mwn.de/book/
#
# To execute the lines you select, and press Ctrl + Enter

rm(list = ls())
cat("\014")

pizza <- read.csv('pizza_delivery.csv', stringsAsFactors = T)

pizza <- read.csv('http://chris.userweb.mwn.de/book/pizza_delivery.csv',
                  stringsAsFactors = T)

fix(pizza)
View(pizza)
head(pizza)

table(pizza$branch)                         # absolute frequencies
length(pizza$branch)                        # sample size
table(pizza$branch) / 1266
table(pizza$branch) / length(pizza$branch)  # relative frequencies

f <- table(pizza$pizzas) / length(pizza$pizzas)
f[1:4]  # f is a table
F <- ecdf(pizza$pizzas)
F(1:4)  # F is a function

quartz()
plot.ecdf(pizza$pizzas, lwd = 3)

quartz()
barplot(table(pizza$branch))

quartz()
barplot(table(pizza$branch) / length(pizza$branch))

quartz()
pie(table(pizza$driver))

quartz()
barplot(table(pizza$driver))

quartz()
barplot(table(pizza$time))

quartz()
hist(pizza$time)

quartz()
hist(pizza$time, freq = FALSE)

quartz()
hist(pizza$time, breaks = 5)

quartz()
hist(pizza$time, breaks = 20)

quartz()
plot(density(pizza$time, kernel = "epanechnikov"))

quartz()
plot(density(pizza$time, kernel = "e", adjust = 0.5))

quartz()
plot(density(pizza$time, kernel = "e", adjust = 2))

(10 + 20 + 30 + 40 + 50) / 5
sum(c(10, 20, 30, 40, 50)) / 5
mean(c(10, 20, 30, 40, 50))

sum(pizza$temperature) / length(pizza$temperature)
mean(pizza$temperature)

mean(32 + 1.8 * pizza$temperature)
32 + 1.8 * mean(pizza$temperature)

median(c(10, 20, 30, 40, 50))
median(c(10, 20, 30, 40, 50, 60))
median(pizza$temperature)

quantile(pizza$time)
quantile(pizza$time, type = 6)
quantile(pizza$time, type = 7)
quantile(pizza$time, probs = c(0.01, 0.1, 0.25, 0.5, 0.75, 0.9, 0.99))

summary(pizza$time)
summary(pizza)

summary(pizza$time[pizza$driver == "Mario"])
summary(pizza$time[pizza$driver == "Luigi"])

Mario <- pizza$time[pizza$driver == "Mario"]
Luigi <- pizza$time[pizza$driver == "Luigi"]
mean(Mario)
mean(Luigi)
max(Mario) - min(Mario)
max(Luigi) - min(Luigi)
quantile(Mario, 0.75) - quantile(Mario, 0.25)
quantile(Luigi, 0.75) - quantile(Luigi, 0.25)

mean(abs(pizza$time - median(pizza$time)))
mean(abs(pizza$time - mean(pizza$time)))

mad(pizza$time)
mad(pizza$time, constant = 1)
median(abs(pizza$time - median(pizza$time)))

# ^: caret or circumflex

var(pizza$time)
sum((pizza$time - mean(pizza$time))^2) / 1266
sum((pizza$time - mean(pizza$time))^2) / 1265

sd(pizza$time)
sd(pizza$time)^2

mean(pizza$temperature)
mean(32 + 1.8 * pizza$temperature)
32 + 1.8 * mean(pizza$temperature)

var(pizza$temperature)
var(32 + 1.8 * pizza$temperature)
1.8^2 * var(pizza$temperature)

y <- (pizza$temperature - mean(pizza$temperature)) / sd(pizza$temperature)
mean(y)
var(y)

quartz()
hist(y)

z <- scale(pizza$temperature)
mean(z)
var(z)

quartz()
hist(z)

mean(pizza$time[pizza$driver == "Mario"])
sd(pizza$time[pizza$driver == "Mario"])

mean(pizza$time[pizza$driver == "Luigi"])
sd(pizza$time[pizza$driver == "Luigi"])

sd(pizza$time[pizza$driver == "Mario"]) /
  mean(pizza$time[pizza$driver == "Mario"])
sd(pizza$time[pizza$driver == "Luigi"]) /
  mean(pizza$time[pizza$driver == "Luigi"])

quartz()
Mario <- pizza$time[pizza$driver == "Mario"]
Luigi <- pizza$time[pizza$driver == "Luigi"]
qqplot(Mario, Luigi)
abline(a=0,b=1)

quartz()
boxplot(pizza$time)

quartz()
boxplot(pizza$time, range = 0)

# install.packages("ineq")
library(ineq)
x <- c(20,20,20,20,20)
y <- c(0, 0, 0, 0, 100)

quartz()
plot(Lc(x))

quartz()
plot(Lc(y))

Z <- c(20, 14, 59, 9, 36, 23, 3)
ineq(Z)
ineq(Z) * 7 / 6


###

rm(list = ls())
cat("\014")

pizza <- read.csv('pizza_delivery.csv', stringsAsFactors = T)

table(pizza$free_wine, pizza$driver)
addmargins(table(pizza$free_wine, pizza$driver))

options(digits=1)
proportions(table(pizza$free_wine, pizza$driver))
addmargins(proportions(table(pizza$free_wine, pizza$driver)))
options(digits=7)

library(lattice)

quartz() # quartz() if you are a Mac user
barchart(table(pizza$driver, pizza$free_wine),
         horizontal = FALSE, stack = FALSE)

# Chisq

Joint.Freq.Dist <- table(pizza$free_wine, pizza$driver)
Exp.Joint.Freq.Dist <- chisq.test((table(pizza$free_wine, pizza$driver)))$expected

chi2 <- sum((Joint.Freq.Dist - Exp.Joint.Freq.Dist)^2 / Exp.Joint.Freq.Dist)

chi2

chisq.test((table(pizza$free_wine, pizza$driver)))

sqrt(chi2 / (1266 * (min(5, 2) - 1)))
sqrt( min(5, 2) / (min(5, 2) - 1) ) * sqrt( chi2 / (chi2 + 1266))

install.packages("vcd")
library(vcd)
assocstats(xtabs(~pizza$free_wine+pizza$driver))
assocstats(xtabs(~pizza$free_wine+pizza$driver))$cont * sqrt(2)

Smoking <- c(rep(1, 56), rep(0, 184))
Disease <- c(rep(1, 34), rep(0, 22), rep(1, 66), rep(0, 118))
addmargins(table(Disease, Smoking))

(34/56)/(66/184)
(22/56)/(118/184)
(34 * 118) / (22 * 66)

Timeliness <- c(rep(1, 17), rep(2, 26), rep(3, 57))
Payment <- c(rep(1, 7), rep(2, 10), rep(1, 11), rep(2, 15), rep(1, 26), rep(2, 31))
addmargins(table(Payment, Timeliness))

Tweets <- c(25, 11800, 99, 1934, 199, 2539, 4334, 952, 3245, 2468)
Followers <- c(7194, 43400000, 324000, 2330000, 39000,
               189000, 639000, 688000, 2690000, 110000)

quartz() # quartz() if you are a Mac user
plot(Tweets, Followers)

quartz()
plot(Tweets[-2], Followers[-2])


set.seed(12345)
X <- rnorm(1000)
Y1 <- X + 0.4 * rnorm(1000)
Y2 <- -X + 0.4 * rnorm(1000)
Y3 <- rnorm(1000)
Y4 <- X^5 + 0.4 * rnorm(1000)
Y5 <- X^4 + 0.2 * rnorm(1000)

cor(X, Y1, method = 'pearson')
cor(X, Y2, method = 'pearson')
cor(X, Y3, method = 'pearson')
cor(X, Y4, method = 'pearson')
cor(X, Y5, method = 'pearson')

cor(X, Y1, method = 'spearman')
cor(X, Y2, method = 'spearman')
cor(X, Y3, method = 'spearman')
cor(X, Y4, method = 'spearman')
cor(X, Y5, method = 'spearman')

quartz()
plot(X, Y1)

quartz()
plot(X, Y2)

quartz()
plot(X, Y3)

quartz()
plot(X, Y4)

quartz()
plot(X, Y5)
