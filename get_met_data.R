library("terra")
library("tidyverse")

path <- "G:/Shared drives/2024 FIRE Light Rail/DATA/GLDAS/"
files <- dir(path)

shpname <- "C:/Users/dguan/Documents/charlotte meteorology data/buffer_light_rail.shp"
shpname <- "buffer_light_rail.shp"
for(i in 4010:5053){

  print(files[i])
  r <- rast(paste0(path,files[i]))
  
  names(r)
  
  temperature <- r[[29]]
  plot(temperature)
  
  sta <- vect(shpname)
  
  int <-crop(r, sta, snap = "in",mask = TRUE)
  
  plot(int)
  
  metdf <- terra::extract(int, sta, fun = "mean",na.rm = TRUE)%>%
    summarise(across(where(is.numeric),~mean(.x,na.rm = TRUE))) %>%
    select(-ID)
  
  metdf$date<-files[i]
  
  write.csv(metdf,
            paste0("met_data_charlotte/",
                   files[i],
                   ".csv")
            , row.names = F)
  

}

