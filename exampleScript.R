
#' This file demonstrates some simple features of R and the use of an R script to preserve analysis.

#' Note I'm using #' for comments instead of just # in case I want to 'spin' the file into a report one day.

#' Generate a vector of 100 normally distributed values.
x = rnorm(100)

#' Find the mean average of the vector
mean(x)

#' Make a histogram of x
hist(x, col="red")

#' Generate a second vector of 100 normally distributed values
y = rnorm(100)

#' Plot x vs y
plot(x,y)

#' Test whether x and y are correlated:
cor.test(x,y)
