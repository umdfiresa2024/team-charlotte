#plotting the pm2.5 for each station over time



library(ggplot2)
library(dplyr)
library(terra)


alldata <- read.csv("refined_date_PM25_daily_data.csv")
testdata <- data %>% filter(city_num == 1)
testdata2 <- data %>% filter(city_num == 2)

#all the stations pm2.5 over time with points
ggplot(data = alldata,aes(x = date, y=pm25,color = city_num)) +labs(y= "PM2.5", x = "Date")+ geom_point()+facet_wrap(~ city_num)

#trying with box plot like rygel said
ggplot(data = alldata,aes(x = date, y=pm25,color = city_num)) +labs(y= "PM2.5", x = "Date")+ geom_boxplot()+facet_wrap(~ city_num)

ggplot(data = testdata,aes(x = date, y=pm25)) + geom_point()

ggplot(data = testdata2,aes(x = date, y=pm25)) + geom_point()

