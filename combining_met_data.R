# script to combine all the csv files from november 24 2003 to november 24 2011 (4 years before and after opening day)

library(dplyr)
library(readr)
dpath <- "C:/Users/dguan/Documents/team-charlotte for met/met_data_charlotte/"

file_list <- list.files(pattern = "*.csv")


print(file_list)


# file_list[1]
# read.csv(file_list[1])
combined <- data.frame()
for (i in 24:((24+2) + 8*365)){
  print(file_list[i])
  
  
  df <- read.csv(file_list[i])
  
  combined <- rbind(combined,df)
  

}
View(combined)

write.csv(combined,"combinedMeteorologyDataCharlotte.csv")
