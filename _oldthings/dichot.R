

library(pwr)
pwr.r.test(n=80, power=0.8)


library(MASS)
x = data.frame(mvrnorm(n=50, mu=c(0,0), Sigma = matrix(c(1,0.5,0.5,1),nrow=2)))

cor(x)


plot(x)
summary(lm(dat=x, X1~X2))
summary(lm(dat=x, X1~X2>0))

library(ggplot2)
ggplot(x, aes(X1, X2)) + geom_point() + geom_smooth(method="lm")
ggplot(x, aes(X1>0, X2)) + geom_boxplot() + geom_point()
xtabs(data=x, X1>0 ~ X2>0)
