# A Harmless Introduction to R
# Jui-Chung Yang
# September 2021

(1 + 2 * (3 + 4)) / 5 - 4 * 3^2 # 3^2 == 3 * 3 == 9
3**2                            # 3**2 == 3^2

7 %/% 3 # integer division
7 %% 3  # modulo operation

sqrt(2)   # square root, = 2**0.5 or 2^0.5
exp(1)    # Euler's constant, e = 2.71828...
log(3)    # Logarithms, by default natural logarithms
pi        # pi = 3.14159...

A <- 3
B = 2

X <- c(2, 12, 22, 32) # `<-` or `=` assigns values.
print(X)              # prints its argument.

Y = seq(1, 4)         # generates sequences.
Y       # Instead of `print`, one may simply do this.

w <- vector(mode = "numeric", length = 5)
x <- numeric(5)
y <- c(0, 0, 0, 0, 0)
z <- rep(0, 5)
c(w, x, y, z)

x[2] = x[4] = 3 # Elements can be accessed by `[]`
x
sum(x)          # The sum function

# Ctrl + L cleans the console.

x <- c(74, 31, 95, 61, 76, 34, 23, 54, 96)
x
x[2:4]
x[c(1, 3, 4, 8, 10)]
x[-c(1, 3, 4, 8, 10)]
x[ (x >= 60) ]
x[ (x%%2 == 0) ]  # We use `==` because `=` assigns values.

x[ (x < 60) ] <- NA # NA == not applicable 
x
y <- x[!is.na(x)] # all x which are not missing
y

w.log <- vector(mode = "logical", length = 2)
x.log <- logical(2)
y.log <- c(FALSE, F)  # F == FALSE
z.log <- rep(F, 2)
c(w.log, x.log, y.log, z.log)

x.log[1] = x.log[2] = T # T == TRUE
x.log
sum(x.log)          # The sum function

x <- c(2, 3, 5, 7, 11, 13)
X <- matrix(nrow=2, ncol=3, data=x, byrow=T)
X
X[2, 2]

A <- array(data=1:12, dim=c(2,3,2))
A

L <- list(one=c(1,2,3), two=c("Hello","World","!"))
L
L[[2]]
L$one

name <- c("Ray", "Andrew", "Anna")
age <- c(40, 9, 3)
music <- c("guitar","piano",NA)
dat <- data.frame(name, age, music)
names(dat) <- c("Name", "Age", "Favorite.Instrument")
dat

write.csv(x=dat, file="music.csv", row.names=F)
write.csv(x=dat, file="music2.csv", row.names=T)

getwd() # returns the current working directory

dat.r <- read.csv(file="music.csv")
dat.r[3,]

X <- c(2, 4, 6)
cumsum(X)     # 2, 2+4, 2+4+6
cumprod(X)    # 2, 2*4, 2*4*6
factorial(4)  # 4! = 4 * 3 * 2 * 1
choose(5, 2)  # 5 choose 2 = 5C2 = 5! / (3! * 2!)

my.cute.func <- function(x, a=1, b=1, c=1){
  h <- a * x^2 + b * x + c
  return(h)
}

my.cute.func(2) # Default values: a=1, b=1, c=1
my.cute.func(2, a=2, b=3, c=5)

X = Y = c(2, 4, 6, 8, 10, 12)

X

for (i in 1:6){
  if (X[i] %% 3 == 0){
    X[i] <- X[i] * 2
  }
}

X

Y

Y[ (Y %% 3 == 0) ] <- Y[ (Y %% 3 == 0) ] * 2

Y

X <- c(1, 3, 2, 5, 2)
sort(X)
rank(X)
duplicated(X)
unique(X)

?sum

example(sum)
