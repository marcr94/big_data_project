# exercises for presentations topic 1


rm(list = ls())

setwd("C:/R/ISLR")

library(ISLR)
library(stargazer)
## a)

pairs(Auto)

## b) 

# create auto subset without the name column

cor(Auto[, names(Auto) !="name"])

Auto$origin <- as.factor(Auto$origin)

## c)

model1 <- lm(mpg ~.-name, Auto)

stargazer(model1, type = "text")

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
