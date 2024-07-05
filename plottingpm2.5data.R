#plotting the pm2.5 for each station over time



library(ggplot2)
library(dplyr)
library(terra)


alldata <- read.csv("refined_date_PM25_daily_data.csv")
testdata <- data %>% filter(city_num == 1)
testdata2 <- data %>% filter(city_num == 2)

#tried plotting over time but having each day as a point was too crowded
# ggplot(data = alldata,aes(x = date, y=pm25,color = city_num)) +labs(y= "PM2.5", x = "Date")+ geom_point()+facet_wrap(~ city_num)


ggplot(data = alldata,aes(x = city_num, y=pm25,color = city_num)) +labs(y= "PM2.5", x = "Station Number")+ geom_boxplot(aes(group = city_num, color = factor(city_num)),outlier.shape = NA)


#individual pm2.5 over time plots for some specific light rail stations (too crowded)
#ggplot(data = testdata,aes(x = date, y=pm25)) + geom_point(shape = "o")

#ggplot(data = testdata2,aes(x = date, y=pm25)) + geom_point()

