# exercises for presentations topic 1

## set up

rm(list = ls())

setwd("C:/R/ISLR")

library(ISLR) # contains Auto data set

data(Auto) # load data set

## a)

pairs(Auto[, !names(Auto) == "name"]) # scatterplot between all variables , excluding name

## b)

cor(Auto[, !names(Auto) == "name"])

## c)

 
Auto$origin <- as.factor(Auto$origin) # create dummy variable

model1 <- lm(mpg ~.-name, Auto)

summary(model1)

# some are significant
# some not 

# one additional unit of year is asscociated with a 0.75 increase with mpg , all other things being held equal

## d)

model3 <- lm(mpg ~. -name + cylinders:displacement + cylinders*origin + horsepower*acceleration , Auto)

par(mfrow  = c(2,2))
plot(model3)

model3_selection <- stepAIC(model3, direction = "forward")

summary(model3_selection)
summary(lm(mpg ~. + horsepower*weight, auto_sub))

summary(lm(mpg ))

log(6)
log(7)
