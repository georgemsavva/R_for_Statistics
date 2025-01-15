
library(ggplot2)
library(dplyr)

#' Analysis of iris dataset showing some important features of R.

#' Load data from a csv file using `read.csv`
iris <- read.csv("iris.csv")

#' Get some statistics on the structure of the dataset to make sure it's all read in OK.
nrow(iris)
str(iris)

#' Extract single variables (vectors) from the dataset
iris$Sepal.Length

#' By default, `Species` is read as a string (because the option `stringsAsFactors` is set to FALSE by default).  
#' So if we want to use `Species` as a categorical variable we have to convert it into a 'factor'.
iris$Species <- factor(iris$Species)

#' We can use the default plotting system to make a quick plot, but it's a bit ugly!
plot(iris, col=iris$Species)

#' Demonstration of using the base `hist` function if we want a quick histogram
iris$Sepal.Width |> hist(breaks=20)


#' We can do a statistical test using two variables. 
#' (Although this association is better tested using `lm` as below)
cor.test(iris$Sepal.Length, iris$Petal.Width)

#' Find the minimum sepal width
min(iris$Sepal.Width)

#' Tabulate the species to find the number of observations for each
table(iris$Species)

#' We can use dplyr to make more complex tables:

iris |> 
  group_by(Species) |>
  summarise( "Mean Sepal Length"=mean(Sepal.Length) , "SD"=sd(Sepal.Length) , n())


#' ## Graphing
#'
#' Make a histogram with red bars
hist(iris$Sepal.Length, col="red")

#' To quickly demonstrate the formula interface we made a (not very nice) boxplot.
boxplot( Petal.Length ~ Species , data=iris)

#' We can make a much nicer boxplot using ggplot2.
#' Make sure you understand what each of these lines does!
iris |> ggplot() + 
  aes(x=Species , y=Petal.Length, fill=Species) + 
  geom_boxplot() + 
  ggtitle("Petal length by Species") + 
  theme_bw() + 
  scale_y_log10(breaks=c(1,2,3,4,5,6,7,8,9,10)) + 
  labs(y="Petal length (cm)")


#' If we want to export the plot we can assign it to an object then save that object with `ggsave`:
boxplot1 <- ggplot(iris) + 
  aes(x=Species , y=Petal.Length, fill=Species) + 
  geom_boxplot()
ggsave("lengthboxplot.png",boxplot1, width=5, height=5, dpi="retina")


#' ## Modelling

#' Most of our statistical tests can be thought of in terms of statistical
#' models.  Simple linear regression models are the simplest models, we can do most things by generalisaing these.
s#'
#' In R, we use a formula to describe the model we want to estimate. 
#' Here we want to model how the average of sepal width varies (statistically, not necessarily causally) with sepal length.
lm(data=iris , Sepal.Width ~ Sepal.Length)

#' To do anything useful we need to make an `lm` object (here called model1)
model1 <- lm(data=iris , Sepal.Width ~ Sepal.Length)

#' Now we extract the model summary
summary(model1)

#' Check the model validity
performance::check_model(model1)

#' Get the `gtsummary` package if you don't have it already.
#' (with `install.packages("gtsummary")`).  
#' The `tbl_regression` function from this package makes a nicely formatted regression table.
gtsummary::tbl_regression(model1)

#' We can also use `ggplot` to draw a linear model:
#' Note how the slope and intercept of the `stat_smooth` line corresponds to the model summary output

iris |> ggplot() + 
  aes(x=Sepal.Length,y=Sepal.Width) + 
  geom_point() +
  theme_bw() +
  stat_smooth(method="lm")

#' By adding colours we can see that our first model may not be the best, because
#' there is clearly an effect of species on the outcome variable that we have
#' ignored. So we should estimate a separate line for each species, but consider
#' that we have changed the reserach question quite substantially:

iris |> ggplot() + 
  aes(x=Sepal.Length , 
      y=Sepal.Width, 
      shape=Species,
      col=Species) + 
  geom_point() +
  theme_bw() +
  stat_smooth(method="lm")

#' We can make linear models corresponding to more complex relationships!
#' This is an advantage of using linear models instead of other 'ad hoc' statistical testing.

#' This model corrects for the effect of species on sepal width:
#' 
#' Entering just the main effect (as below) lead to a separate but parallel line for each species.  The slope (effect of sepal length) does not vary with species.
model2 <- lm(data = iris , Sepal.Width ~ Sepal.Length + Species )
summary(model2)

#' But we can add an *interaction term* to allow the effect of sepal length to vary by species
#' These two models are the same.
model4 <- lm(data = iris , Sepal.Width ~ Sepal.Length + Species + Sepal.Length:Species )
model4 <- lm(data = iris , Sepal.Width ~ Sepal.Length * Species )
summary(model4)

#' We can use the `emmeans` package to extract the slope at each level of `Species` from model 4.
emmeans::emtrends(model4 , pairwise~Species , var="Sepal.Length")


#' The `ANOVA` function can be used to generate the old-fashioned ANOVA table corresponding to each model:
anova(model4)

#' Or to test whether one model is a significantly better fit than another:
anova(model1 , model2, model4)

library(ggbeeswarm)

#' A box plot shows a great 'five point summary' for each distribution
ggplot(iris) + aes(x=Species, y=Petal.Length, fill=Species) + 
  geom_boxplot(outlier.colour = NA) + 
  geom_beeswarm(size=1)

#' The log-scale graph suggested that a log-transformed model might be more appropriate
ggplot(iris) + aes(x=Species, y=Petal.Length, fill=Species) + 
  geom_boxplot(outlier.colour = NA) + 
  geom_beeswarm(size=1) + 
  scale_y_log10()

#' A 'dynamite' plot is less useful, but could be acceptable if you overlay the true data points.
ggplot(iris) + aes(x=Species, y=Petal.Length, fill=Species) + 
  stat_summary(geom="col") + 
  stat_summary(geom="errorbar", width=0.5) + 
  geom_beeswarm()

