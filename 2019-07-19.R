# This practice excerpt from https://jamesclear.com/goals-systems

## Get Data
data("iris")

## Load packages
library(dplyr) #for data manipulation grammar (the pipe operator)
library(tidyr) #for tidying up the data
library(ggplot2) #for data viz

## Raw data overview
glimpse(iris) # gives a sneak-peek into the data

str(iris) # 輸出該物件的基本架構

summary(iris)
# Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species
# Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50
# 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50
# Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50
# Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199
# 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800
# Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500

names(iris) # "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species" 

class(iris) # "data.frame"

head(iris) # first six

##  & Tranformation
mini_iris <- head(iris)
five_iris <- mini_iris%>%
  # gather(part,value,Sepal.Length,Sepal.Width,Petal.Length ,Petal.Width)
  gather(part,value,Sepal.Length,Sepal.Width,Petal.Length ,Petal.Width)%>%
  separate(part, c('part', 'measure'), sep = '\\.')

five_iris

# Some Housekeeping
Missing_d <- function(x){sum(is.na(x))/length(x)*100}

apply(five_iris, 2, Missing_d)
## Species    part measure   value 
##       0       0       0       0

is_special <- function(x){
  if(is.numeric(x)) !is.finite(x) else is.na(x)
}

sapply(five_iris, is_special)

# lets check and verify the presence of NAs
sum(is.na(long_iris$value))

# Descriptive Analytics

# Conclusion