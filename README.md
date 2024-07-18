# Team Charlotte Weekly Report
Adityaraj Padmanabhna & David Guan

## Research Question

1.  Does the introduction of light rails affect the particulate matter
    (PM2.5) levels in Charlotte, North Carolina?
2.  Do different income brackets have different levels of reduction
    after introducing light rails?

## Hypothesis

1.  **Light Rail opening:**
    - Null Hypothesis (H₀): The introduction of light rails has no
      effect on particulate matter (PM2.5) levels in Charlotte, North
      Carolina.​

    - Alternative Hypothesis (H<sub>A</sub>): The introduction of light
      rails has an effect on particulate matter (PM2.5) levels in
      Charlotte, North Carolina.
2.  **Income:**
    - Null Hypothesis (H₀): There is no difference in the levels of
      PM2.5 reduction across different income brackets after introducing
      light rails.

    - Alternative Hypothesis (H<sub>A</sub>): There is a difference in
      the levels of PM2.5 reduction across different income brackets
      after introducing light rails.

## Context

- Area of study: Blue Lynx Light Rail, Charlotte, North Caroline

  - Table with corresponding above stations

    ``` r
    library("knitr")

    stations_table <- read.csv("new_station_coords_data.csv")
    kable(stations_table)
    ```

    | stations                               | Opening.Dates                                 | Parking   |       lon |                                         lat | address                                                                 |      lat2 |                                        lon2 | address2                                                                |
    |:---------------------------------------|:----------------------------------------------|:----------|----------:|--------------------------------------------:|:------------------------------------------------------------------------|----------:|--------------------------------------------:|:------------------------------------------------------------------------|
    | I-485/South Boulevard                  | November 24, 2007                             | TRUE      | -80.88292 |                                    35.10708 | i-485/south boulevard station, charlotte, nc 28134, usa                 |  35.10708 |                                   -80.88292 | i-485/south boulevard station, charlotte, nc 28134, usa                 |
    | Sharon Road West station               | November 24, 2007                             | TRUE      | -80.88219 |                                    35.11927 | sharon road west station, charlotte, nc 28134, usa                      |  35.11927 |                                   -80.88219 | sharon road west station, charlotte, nc 28134, usa                      |
    | Arrowood station                       | November 24, 2007                             | TRUE      | -80.87637 |                                    35.13569 | arrowood, 7717 england st, charlotte, nc 28273, usa                     |  35.13569 |                                   -80.87637 | arrowood, 7717 england st, charlotte, nc 28273, usa                     |
    | Archdale station                       | November 24, 2007                             | TRUE      | -80.87748 |                                    35.15290 | archdale, charlotte, nc 28217, usa                                      |  35.15290 |                                   -80.87748 | archdale, charlotte, nc 28217, usa                                      |
    | Tyvola station                         | November 24, 2007                             | TRUE      | -80.87750 |                                    35.16285 | tyvola, 5703 old pineville rd, charlotte, nc 28217, usa                 |  35.16285 |                                   -80.87750 | tyvola, 5703 old pineville rd, charlotte, nc 28217, usa                 |
    | Woodlawn station (Charlotte)           | November 24, 2007                             | TRUE      | -80.87930 |                                    35.17590 | woodlawn station, charlotte, nc 28217, usa                              |  35.17590 |                                   -80.87930 | woodlawn station, charlotte, nc 28217, usa                              |
    | Scaleybark station                     | November 24, 2007                             | FALSE     | -80.87501 |                                    35.19092 | scaleybark, charlotte, nc 28217, usa                                    |  35.19092 |                                   -80.87501 | scaleybark, charlotte, nc 28217, usa                                    |
    | New Bern station                       | November 24, 2007                             | FALSE     | -80.86904 |                                    35.19985 | new bern station, charlotte, nc 28209, usa                              |  35.19985 |                                   -80.86904 | new bern station, charlotte, nc 28209, usa                              |
    | East/West Boulevard station            | August 30, 1996 \| (rebuilt November 24, 2007 |           |           |                                             |                                                                         |           |                                             |                                                                         |
    | )                                      | FALSE                                         | -80.85895 |  35.21212 | east/west station, charlotte, nc 28203, usa | 35.21212                                                                | -80.85895 | east/west station, charlotte, nc 28203, usa |                                                                         |
    | Bland Street station                   | August 30, 1996 \| (rebuilt November 24, 2007 |           |           |                                             |                                                                         |           |                                             |                                                                         |
    | )                                      | FALSE                                         | -80.85525 |  35.21582 |             bland, charlotte, nc 28203, usa | 35.21622                                                                | -80.85446 |        1511 Camden Road, charlotte, nc, usa |                                                                         |
    | Carson light rail station (Charlotte)  | November 24, 2007                             | FALSE     | -80.84313 |                                    35.22709 | charlotte, nc, usa                                                      |  35.21944 |                                   -80.84823 | 218 East Carson Boulevard, charlotte, nc, usa                           |
    | Brooklyn Village (Charlotte)           | August 30, 1996 \| (rebuilt November 24, 2007 |           |           |                                             |                                                                         |           |                                             |                                                                         |
    | )                                      | FALSE                                         | -80.84299 |  35.21867 |      e brooklyn vlg ave, charlotte, nc, usa | 35.21867                                                                | -80.84299 |      e brooklyn vlg ave, charlotte, nc, usa |                                                                         |
    | Third Street/Convention Center station | June 28, 2004 \| (rebuilt November 24, 2007)  | FALSE     | -80.84312 |                                    35.22375 | 3rd st./convention center, charlotte, nc 28244, usa                     |  35.22375 |                                   -80.84312 | 3rd st./convention center, charlotte, nc 28244, usa                     |
    | Charlotte Transportation Center        | November 24, 2007                             | FALSE     | -80.84313 |                                    35.22709 | charlotte, nc, usa                                                      |  35.21944 |                                   -80.84823 | 310 East Trade Street, charlotte, nc, usa                               |
    | 7th Street station (Charlotte)         | June 28, 2004 \| (rebuilt November 24, 2007)  | FALSE     | -80.83798 |                                    35.22751 | 7th st station, charlotte, nc 28202, usa                                |  35.22751 |                                   -80.83798 | 7th st station, charlotte, nc 28202, usa                                |
    | 9th Street station (Charlotte)         | June 24, 2004 \| (rebuilt March 16, 2018)     | FALSE     | -80.83516 |                                    35.22948 | 239 e 9th st, charlotte, nc 28202, usa                                  |  35.22948 |                                   -80.83516 | 239 e 9th st, charlotte, nc 28202, usa                                  |
    | Parkwood station                       | March 16, 2018                                | FALSE     | -80.82323 |                                    35.23689 | parkwood, charlotte, nc 28206, usa                                      |  35.23689 |                                   -80.82323 | parkwood, charlotte, nc 28206, usa                                      |
    | 25th Street station (Charlotte)        | March 16, 2018                                | FALSE     | -80.81708 |                                    35.24174 | 25th street, charlotte, nc 28206, usa                                   |  35.24174 |                                   -80.81708 | 25th street, charlotte, nc 28206, usa                                   |
    | 36th Street station (Charlotte)        | March 16, 2018                                | FALSE     | -80.80545 |                                    35.24854 | 36th street station, charlotte, nc 28205, usa                           |  35.24854 |                                   -80.80545 | 36th street station, charlotte, nc 28205, usa                           |
    | Sugar Creek station (Charlotte)        | March 16, 2018                                | TRUE      | -80.79184 |                                    35.25106 | sugar creek station, bearwood ave, charlotte, nc 28205, usa             |  35.25106 |                                   -80.79184 | sugar creek station, bearwood ave, charlotte, nc 28205, usa             |
    | Old Concord Road station               | March 16, 2018                                | TRUE      | -80.77271 |                                    35.25996 | old concord road station, charlotte, nc 28213, usa                      |  35.25996 |                                   -80.77271 | old concord road station, charlotte, nc 28213, usa                      |
    | Tom Hunter station                     | March 16, 2018                                | FALSE     | -80.76629 |                                    35.27795 | tom hunter station, charlotte, nc 28213, usa                            |  35.27795 |                                   -80.76629 | tom hunter station, charlotte, nc 28213, usa                            |
    | University City Blvd station           | March 16, 2018                                | TRUE      | -80.76074 |                                    35.28692 | university city blvd, 7205 n tryon st, charlotte, nc 28262, usa         |  35.28692 |                                   -80.76074 | university city blvd, 7205 n tryon st, charlotte, nc 28262, usa         |
    | McCullough station                     | March 16, 2018                                | FALSE     | -80.75288 |                                    35.30112 | mccullough, 8312 n tryon st, charlotte, nc 28262, usa                   |  35.30112 |                                   -80.75288 | mccullough, 8312 n tryon st, charlotte, nc 28262, usa                   |
    | JW Clay Blvd/UNC Charlotte station     | March 16, 2018                                | TRUE      | -80.74503 |                                    35.31083 | 9234-9300 n tryon st, charlotte, nc 28262, usa                          |  35.31155 |                                   -80.74547 | 9048 North Tryon Street, charlotte, nc, usa                             |
    | UNC Charlotte–Main station             | March 16, 2018                                | FALSE     | -80.73371 |                                    35.31218 | unc charlotte main station, 9025 cameron blvd, charlotte, nc 28262, usa |  35.31218 |                                   -80.73371 | unc charlotte main station, 9025 cameron blvd, charlotte, nc 28262, usa |

- Time Frame: November 2003 - November 2011

- Factors associated with PM2.5

  - Airport

  - Power Plant(s)

  - Factories

  - Major Intersection

    - Table with corresponding above factors

      ``` r
      factors_table <- read.csv("new_pm_coords_data.csv")
      kable(factors_table)
      ```

      | Type          | sources                                                 | Address                                                                | Reason.s.                                                                                       |       lon |      lat | address                                                                                            |     lat2 |      lon2 | address2                                                                                           |
      |:--------------|:--------------------------------------------------------|:-----------------------------------------------------------------------|:------------------------------------------------------------------------------------------------|----------:|---------:|:---------------------------------------------------------------------------------------------------|---------:|----------:|:---------------------------------------------------------------------------------------------------|
      | Power Plant   | GG Allen steam station                                  | 253 Plant Allen Rd, Belmont, NC 28012                                  | Coal-fired power plant.                                                                         | -81.00855 | 35.18982 | 253 plant allen rd, belmont, nc 28012, usa                                                         | 35.18982 | -81.00855 | 253 plant allen rd, belmont, nc 28012, usa                                                         |
      | Neighbourhood | South End                                               | South End, Charlotte, NC 28203                                         | Once heavily industrial, still contains some light industrial facilities despite redevelopment. | -80.85878 | 35.21256 | south end, charlotte, nc 28203, usa                                                                | 35.21256 | -80.85878 | south end, charlotte, nc 28203, usa                                                                |
      | Airport       | Charlotte Douglas International Airport                 | 5501 Josh Birmingham Pkwy, Charlotte, NC 28208                         |                                                                                                 | -80.95395 | 35.21630 | charlotte douglas international airport (clt), 5501 josh birmingham pkwy, charlotte, nc 28208, usa | 35.21630 | -80.95395 | charlotte douglas international airport (clt), 5501 josh birmingham pkwy, charlotte, nc 28208, usa |
      | Intersection  | Ardrey Kell Rd Rea Rd                                   | Ardrey Kell Rd Rea Rd, Charlotte, NC                                   |                                                                                                 | -80.80554 | 35.03361 | ardrey kell rd & rea rd, charlotte, nc 28277, usa                                                  | 35.03361 | -80.80554 | ardrey kell rd & rea rd, charlotte, nc 28277, usa                                                  |
      | Intersection  | Ardrey Kell Rd Tom Short Rd                             | Ardrey Kell Rd Tom Short Rd, Charlotte, NC                             |                                                                                                 | -80.79392 | 35.04063 | ardrey kell rd & tom short rd, providence crossing, nc 28277, usa                                  | 35.04063 | -80.79392 | ardrey kell rd & tom short rd, providence crossing, nc 28277, usa                                  |
      | Intersection  | Back Creek Church Rd Pavilion Blvd University City Blvd | Back Creek Church Rd Pavilion Blvd University City Blvd, Charlotte, NC |                                                                                                 | -80.71236 | 35.31127 | pavilion blvd & university city blvd, charlotte, nc 28262, usa                                     | 35.31127 | -80.71236 | pavilion blvd & university city blvd, charlotte, nc 28262, usa                                     |
      | Intersection  | Ballantyne Commons Pkwy Johnston Rd                     | Ballantyne Commons Pkwy Johnston Rd, Charlotte, NC                     |                                                                                                 | -80.85015 | 35.05458 | ballantyne commons pkwy & johnston rd, charlotte, nc 28277, usa                                    | 35.05458 | -80.85015 | ballantyne commons pkwy & johnston rd, charlotte, nc 28277, usa                                    |
      | Intersection  | Ballantyne Commons Pkwy Rea Rd                          | Ballantyne Commons Pkwy Rea Rd, Charlotte, NC                          |                                                                                                 | -80.81236 | 35.05821 | ballantyne commons pkwy & rea rd, charlotte, nc 28277, usa                                         | 35.05821 | -80.81236 | ballantyne commons pkwy & rea rd, charlotte, nc 28277, usa                                         |
      | Intersection  | Billy Graham Pkwy S Tryon St Woodlawn Rd                | Billy Graham Pkwy S Tryon St Woodlawn Rd, Charlotte, NC                |                                                                                                 | -80.88929 | 35.18067 | s tryon st & billy graham pkwy, charlotte, nc 28217, usa                                           | 35.18067 | -80.88929 | s tryon st & billy graham pkwy, charlotte, nc 28217, usa                                           |
      | Intersection  | Billy Graham Pkwy West Bv                               | Billy Graham Pkwy West Bv, Charlotte, NC                               |                                                                                                 | -80.92205 | 35.20614 | billy graham pkwy & west blvd, charlotte, nc 28208, usa                                            | 35.20614 | -80.92205 | billy graham pkwy & west blvd, charlotte, nc 28208, usa                                            |
      | Intersection  | Brookshire Blvd Mt Holly Huntersville Rd                | Brookshire Blvd Mt Holly Huntersville Rd, Charlotte, NC                |                                                                                                 | -80.94522 | 35.32554 | brookshire blvd & mt holly-huntersville rd, charlotte, nc 28216, usa                               | 35.32554 | -80.94522 | brookshire blvd & mt holly-huntersville rd, charlotte, nc 28216, usa                               |
      | Intersection  | Carmel Rd Colony Rd                                     | Carmel Rd Colony Rd, Charlotte, NC                                     |                                                                                                 | -80.80911 | 35.13259 | colony rd & carmel rd, charlotte, nc 28226, usa                                                    | 35.13259 | -80.80911 | colony rd & carmel rd, charlotte, nc 28226, usa                                                    |
      | Intersection  | Charlottetowne Av I-277 OL Ramp Kenilworth Av           | Charlottetowne Av I-277 OL Ramp Kenilworth Av, Charlotte, NC           |                                                                                                 |        NA |       NA | NA                                                                                                 | 35.21393 | -80.83748 | Charlottetowne Av I-277 OL Ramp Kenilworth Av, Charlotte, NC                                       |
      | Intersection  | Colony Rd Fairview Rd                                   | Colony Rd Fairview Rd, Charlotte, NC                                   |                                                                                                 | -80.81929 | 35.14667 | fairview rd & colony rd, charlotte, nc 28226, usa                                                  | 35.14667 | -80.81929 | fairview rd & colony rd, charlotte, nc 28226, usa                                                  |
      | Intersection  | Colville Rd Laurel Av Randolph Rd                       | Colville Rd Laurel Av Randolph Rd, Charlotte, NC                       |                                                                                                 | -80.81838 | 35.19667 | colville rd, charlotte, nc 28207, usa                                                              | 35.19667 | -80.81838 | colville rd, charlotte, nc 28207, usa                                                              |
      | Intersection  | Fairview Rd Park Road Tyvola Rd                         | Fairview Rd Park Road Tyvola Rd, Charlotte, NC                         |                                                                                                 | -80.84779 | 35.15262 | fairview rd & park rd, charlotte, nc 28210, usa                                                    | 35.15262 | -80.84779 | fairview rd & park rd, charlotte, nc 28210, usa                                                    |
      | Intersection  | Fairview Rd Providence Rd Sardis Rd                     | Fairview Rd Providence Rd Sardis Rd, Charlotte, NC                     |                                                                                                 | -80.79561 | 35.15381 | fairview rd & providence rd, charlotte, nc 28211, usa                                              | 35.15381 | -80.79561 | fairview rd & providence rd, charlotte, nc 28211, usa                                              |
      | Intersection  | Fairview Rd Sharon Rd                                   | Fairview Rd Sharon Rd, Charlotte, NC                                   |                                                                                                 | -80.83079 | 35.14849 | fairview rd & sharon rd, charlotte, nc 28210, usa                                                  | 35.14849 | -80.83079 | fairview rd & sharon rd, charlotte, nc 28210, usa                                                  |
      | Intersection  | I-85 Ramps Brookshire Blvd                              | I-85 Ramps Brookshire Blvd, Charlotte, NC                              |                                                                                                 | -80.92187 | 35.30571 | brookshire blvd, north carolina, usa                                                               | 35.30571 | -80.92187 | brookshire blvd, north carolina, usa                                                               |
      | Intersection  | Independence Blvd Village Lake Dr                       | Independence Blvd Village Lake Dr, Charlotte, NC                       |                                                                                                 | -80.73939 | 35.16268 | e independence blvd & village lake dr, charlotte, nc 28227, usa                                    | 35.16268 | -80.73939 | e independence blvd & village lake dr, charlotte, nc 28227, usa                                    |
      | Intersection  | Kings Dr Morehead St                                    | Kings Dr Morehead St, Charlotte, NC                                    |                                                                                                 | -80.83608 | 35.20548 | kings dr & morehead st, charlotte, nc 28204, usa                                                   | 35.20548 | -80.83608 | kings dr & morehead st, charlotte, nc 28204, usa                                                   |
      | Intersection  | Park Rd Woodlawn Rd                                     | Park Rd Woodlawn Rd, Charlotte, NC                                     |                                                                                                 | -80.85109 | 35.17205 | park rd & woodlawn rd, charlotte, nc 28209, usa                                                    | 35.17205 | -80.85109 | park rd & woodlawn rd, charlotte, nc 28209, usa                                                    |
      | Intersection  | Pineville-Matthews Rd Providence Rd                     | Pineville-Matthews Rd Providence Rd, Charlotte, NC                     |                                                                                                 | -80.77880 | 35.09993 | providence rd & pineville-matthews rd, charlotte, nc 28277, usa                                    | 35.09993 | -80.77880 | providence rd & pineville-matthews rd, charlotte, nc 28277, usa                                    |
      | Intersection  | Providence Rd Queens Rd                                 | Providence Rd Queens Rd, Charlotte, NC                                 |                                                                                                 |        NA |       NA | NA                                                                                                 | 35.19589 | -80.82715 | Providence Rd Queens Rd, Charlotte, NC                                                             |
      | Intersection  | Providence Rd Sharon Amity Rd                           | Providence Rd Sharon Amity Rd, Charlotte, NC                           |                                                                                                 | -80.80826 | 35.17134 | providence rd & s sharon amity rd, charlotte, nc 28211, usa                                        | 35.17134 | -80.80826 | providence rd & s sharon amity rd, charlotte, nc 28211, usa                                        |
      | Intersection  | Providence Rd Wendover Rd                               | Providence Rd Wendover Rd, Charlotte, NC                               |                                                                                                 | -80.81747 | 35.17740 | providence rd & s wendover rd, charlotte, nc 28211, usa                                            | 35.17740 | -80.81747 | providence rd & s wendover rd, charlotte, nc 28211, usa                                            |
      | Intersection  | Randolph Rd Sharon Amity Rd                             | Randolph Rd Sharon Amity Rd, Charlotte, NC                             |                                                                                                 | -80.79823 | 35.17594 | randolph rd & s sharon amity rd, charlotte, nc 28211, usa                                          | 35.17594 | -80.79823 | randolph rd & s sharon amity rd, charlotte, nc 28211, usa                                          |
      | Intersection  | Randolph Rd Wendover Rd                                 | Randolph Rd Wendover Rd, Charlotte, NC                                 |                                                                                                 | -80.80757 | 35.18421 | n wendover rd & randolph rd, charlotte, nc 28211, usa                                              | 35.18421 | -80.80757 | n wendover rd & randolph rd, charlotte, nc 28211, usa                                              |
      | Intersection  | Runnymede Ln Selwyn Av Woodlawn Rd                      | Runnymede Ln Selwyn Av Woodlawn Rd, Charlotte, NC                      |                                                                                                 | -80.84076 | 35.17083 | runnymede ln & selwyn ave, charlotte, nc 28209, usa                                                | 35.17083 | -80.84076 | runnymede ln & selwyn ave, charlotte, nc 28209, usa                                                |
      | Intersection  | South Blvd Tyvola Rd                                    | South Blvd Tyvola Rd, Charlotte, NC                                    |                                                                                                 | -80.87604 | 35.16482 | tyvola rd & south blvd, charlotte, nc 28210, usa                                                   | 35.16482 | -80.87604 | tyvola rd & south blvd, charlotte, nc 28210, usa                                                   |
      | Intersection  | South Blvd Woodlawn Rd                                  | South Blvd Woodlawn Rd, Charlotte, NC                                  |                                                                                                 | -80.87582 | 35.17653 | e woodlawn rd & south blvd, charlotte, nc 28209, usa                                               | 35.17653 | -80.87582 | e woodlawn rd & south blvd, charlotte, nc 28209, usa                                               |

## Cleaning & Combining Data

### Installing Packages

``` r
# install.packages("tidyverse")
# install.packages("ggmap")
# install.packages("maptiles")
# install.packages("terra")
# install.packages("leaflet")
# install.packages("tidycensus)
# install.packages("RColorBrewer")
```

### Loading Libraries

``` r
library("tidyverse")
library("ggmap")
library("terra")
library("maptiles")
library("leaflet")
library("tidycensus")
library("RColorBrewer")
```

Gathered Data using Google API

We utilized the Google Maps API to obtain the coordinates (latitude and
longitude) and the exact addresses of all the stations mentioned in our
dataset. This process involved sending requests to the Google Maps API
with station names and receiving detailed geolocation data in response.

However, due to GitHub’s policies on not publicly sharing API keys, we
have not included the API key directly in our repository. Instead, we
have preprocessed the data and saved the geocoded results in a CSV file
named “new_station_coords_data.csv”

Cleaning Data

``` r
addrs.geo <- read.csv("new_station_coords_data.csv")
new_addr <- addrs.geo %>% 
  mutate(
    lat2 = ifelse(
      stations == "Bland Street station", 
      35.21622, 
      lat
    ), 
    lon2 = ifelse(
      stations == "Bland Street station", 
      -80.85446, 
      lon
    ),
    address2 = ifelse(
      stations == "Bland Street station", 
      "1511 Camden Road, charlotte, nc, usa", address
      
    )
  ) %>% 
  mutate(
    lat2 = ifelse(
      stations == "Carson light rail station (Charlotte)", 
      35.21944, 
      lat2
    ), 
    lon2 = ifelse(
      stations == "Carson light rail station (Charlotte)", 
      -80.84823, 
      lon2
    ),
    address2 = ifelse(
      stations == "Carson light rail station (Charlotte)", 
      "218 East Carson Boulevard, charlotte, nc, usa",
      address2
    )
  ) %>% 
  mutate(
    lat2 = ifelse(
      stations == "Charlotte Transportation Center", 
      35.21944, 
      lat2
    ), 
    lon2 = ifelse(
      stations == "Charlotte Transportation Center", 
      -80.84823, 
      lon2
    ),
    address2 = ifelse(
      stations == "Charlotte Transportation Center", 
      "310 East Trade Street, charlotte, nc, usa", address2 
    )
  ) %>% 
  
  
  mutate(
    lat2 = ifelse(
      stations == "JW Clay Blvd/UNC Charlotte station", 
      35.31155, 
      lat2
    ), 
    lon2 = ifelse(
      stations == "JW Clay Blvd/UNC Charlotte station", 
      -80.74547, 
      lon2
    ),
    address2 = ifelse(
      stations == "JW Clay Blvd/UNC Charlotte station", 
      "9048 North Tryon Street, charlotte, nc, usa", address2 
    )
  )
```

Storing Data into new CSV File

``` r
# First time users - do NOT over-wrrite CSV file
# write.csv(new_addr, "new_station_coords_data.csv", row.names = FALSE)
```

Storing Latitude and Longtitude

``` r
sample_latlon <- cbind(new_addr$lon2, new_addr$lat2)
```

Storing into Vector Data

``` r
pts <-  vect(sample_latlon)
crdref <- "+proj=longlat +datum=WGS84"
pts <- vect(sample_latlon, crs=crdref)
plot(pts)
```

![](README_files/figure-commonmark/unnamed-chunk-8-1.png)

### Finding PM2.5 Data

Due to the large size of the data files, the code execution was not
included in the README file. For detailed information on how PM2.5
levels were extracted, please refer to the file
“station_buffer_pm2.5.R”.

### Overlaying Stations with PM2.5

``` r
# Plot Stations
x <- vect(sample_latlon, crs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")

# Plot Factors
pm_sources <- vect("PM2.5 ShapeFiles/new_pm_coords_sources.shp")
plot(pm_sources)
```

![](README_files/figure-commonmark/unnamed-chunk-9-1.png)

``` r
# Plot Buffer around stations
# Target Buffer Radius =  800 meters
pts_buffer <- buffer(x, width = 800)

# Creating Buffer for Map
extent<-buffer(x, width = 200)

bg <- get_tiles(ext(extent), zoom = 11)

# Plots the background
plot(bg)

# pch=19 gives filled circles
points(x, col="blue", pch=19, cex=0.5)

# pch=17 gives filled triangles
points(pm_sources, col="purple", pch=17, cex=1)

# Plot the buffer around the stations
lines(pts_buffer, col="red")
```

![](README_files/figure-commonmark/unnamed-chunk-9-2.png)

Saving the Buffer’s into ShapeFile

``` r
# First time users - do NOT over-wrrite CSV file
# writeVector(pts_buffer, "new_buffer_light_rail.shp")
```

### Combining PM2.5 Daily Data

``` r
# List all CSV files in the directory
file_list <- list.files(path = "PM25_daily", pattern = "*.csv", full.names = TRUE)

# Read and combine all CSV files into one data frame
combined_df <- do.call(rbind, lapply(file_list, function(file) {
  df <- read.csv(file)
  # Assuming your date column is named 'date' and is in format '%Y%m%d'
  df$date <- as.Date(df$date, format = "%Y%m%d")
  df
}))

# Filter rows from 2003-11-24 to 2011-11-24
combined_df_filtered <- combined_df %>%
  filter(date >= as.Date("2003-11-24") & date <= as.Date("2011-11-24"))

# Write the filtered data frame to a new CSV file
write.csv(combined_df_filtered, "refined_PM25_daily_combined_data.csv", row.names = FALSE)

PM_25_with_date <- read.csv("refined_PM25_daily_combined_data.csv")

PM_25_with_date <- PM_25_with_date %>%
   mutate(formatted_date = paste(substr(date, 1, 4), substr(date, 6, 7), substr(date, 9, 10), sep = "-")) %>% mutate(station_ID = PM_25_with_date$city_num )

# First time users - do NOT over-wrrite CSV file
# write.csv(PM_25_with_date, "refined_date_PM25_daily_data.csv")
```

Creating Station ID

``` r
stations_coords <- read.csv("new_station_coords_data.csv")

stations_coords <- stations_coords %>% mutate(station_ID = row_number())

# First time users - do NOT over-wrrite CSV file
# write.csv(stations_coords, "station_coords_with_stationID_data.csv", row.names = F)
```

Creating Holiday Data

``` r
holidays_data <- read.csv("major_holidays_2000_2025.csv", header = TRUE, stringsAsFactors = FALSE)

holidays_data <- holidays_data %>% filter(date >= as.Date("2003-11-24") & date <= as.Date("2011-11-24")) %>% mutate(formatted_date = date)

# First time users - do NOT over-wrrite CSV file
# write.csv(holidays_data, "refined_holidays_data.csv", row.names = F)
```

Cumulative Data

This code chunk combines various data frames into a single data frame,
emphasizing code re usability and avoiding complexity. It integrates
data from below CSV files

1.  Stations Data
2.  PM2.5 measurements Data
3.  Meteorological Data
4.  Holidays Data

``` r
#Reading Stations Data
stationID_data <- read.csv("station_coords_with_stationID_data.csv", header = TRUE, stringsAsFactors = FALSE)[, c("stations", "station_ID", "address2")]

#Reading PM2.5 Daily Data
pm_25_data <- read.csv("refined_date_PM25_daily_data.csv", header = TRUE, stringsAsFactors = FALSE)[, c("station_ID", "formatted_date", "pm25")]

#Reading Meterological Data
met_data <- read.csv("met_data_charlotte/combinedMeteorologyDataCharlotte.csv", header = TRUE, stringsAsFactors = FALSE)[, c("Tair_f_tavg", "Wind_f_tavg", "Qair_f_tavg", "formatted_date")]

#Reading Holiday Data
holidays_data <- read.csv("refined_holidays_data.csv", header = TRUE, stringsAsFactors = FALSE)[, c("holiday", "formatted_date")]

station_pm_met_dataCombined <- merge(stationID_data,pm_25_data, by="station_ID", all = F )

station_pm_met_dataCombined <- merge(station_pm_met_dataCombined, met_data, by="formatted_date", all = F)

station_pm_met_holiday_dataCombined <- station_pm_met_dataCombined %>% left_join(holidays_data, by = "formatted_date", keep = FALSE, unmatched = "drop")
```

    Warning in left_join(., holidays_data, by = "formatted_date", keep = FALSE, : Detected an unexpected many-to-many relationship between `x` and `y`.
    ℹ Row 59125 of `x` matches multiple rows in `y`.
    ℹ Row 1 of `y` matches multiple rows in `x`.
    ℹ If a many-to-many relationship is expected, set `relationship =
      "many-to-many"` to silence this warning.

``` r
# Ordering the list by date followed by station ID
station_pm_met_holiday_dataCombined_order <- station_pm_met_holiday_dataCombined[order(station_pm_met_holiday_dataCombined$formatted_date, station_pm_met_holiday_dataCombined$station_ID), ]

# %B is used for abbrevation for Month 
station_pm_met_holiday_dataCombined_formatted <- station_pm_met_holiday_dataCombined_order %>%
  mutate(month = format(as.Date(station_pm_met_holiday_dataCombined_order$formatted_date, format = "%Y-%m-%d"), "%B")) %>% 
  mutate (day_of_week = weekdays(as.Date(station_pm_met_holiday_dataCombined_order$formatted_date, format = "%Y-%m-%d"))) %>% 
# NA = 0; Holiday = 1
  mutate(holiday_binary = ifelse(is.na(holiday), 0, 1))

# First time users - do NOT over-wrrite CSV file
# write_csv(station_pm_met_holiday_dataCombined_formatted, "station_pm_met_holiday_dataCombined_formatted.csv")
```

``` r
combinedData <- read.csv("station_pm_met_holiday_dataCombined_formatted.csv")

# No PM sources = 0; PM Source near Station = 1
binaryPMFactor <- combinedData %>% 
  mutate(control_variables = ifelse(
    station_ID %in% c(5, 6, 9, 10), 1, 0
  ))

# write.csv(binaryPMFactor, "station_pm_met_holiday_dataCombined_formatted.csv" )
```

Adding Binary Column for PM Factor’s The

- Total Observations = 76,000

- Total Variables = 25

- Variable Description

  - 1\. Station ID = Unique identifier for each light rail station
    (Range: 1-26)

  - 2\. formatted_date = The date when the measurement was recorded,
    formatted as YYYY-MM-DD.

  - 3\. stations = Name of the light rail station.

  - 4\. address2 = Full address of the light rail station.

  - 5\. pm25 = Measured particulate matter (PM2.5) concentration in the
    air.

  - 6\. Swnet_tavg = Net short wave radiation flux.

  - 7\. Lwnet_tavg = Net long-wave radiation flux.

  - 8\. Qle_tavg = Latent heat net flux.

  - 9\. Qh_tavg = Sensible heat net flux.

  - 10\. Snowf_tavg = Snow precipitation rate.

  - 11\. Rainf_tavg = Rain precipitation rate.

  - 12\. Qsm_tavg = Snow melt.

  - 13\. SnowT_tavg = Snow Surface temperature.

  - 14\. SWE_tavg = Snow depth water equivalent.

  - 15\. SnowDepth_tavg = Snow depth.

  - 16\. Tair_f_tavg = Temperature.

  - 17\. Rainf_f_tavg = Total precipitation rate.

  - 18\. Wind_f_tavg = Wind speed.

  - 19\. Qair_f_tavg = Specific humidity.

  - 20\. Psurf_f_tavg = Pressure.

  - 21\. Parking = Binary indicator for the presence of parking
    facilities at the station (1 for presence, 0 for absence).

  - 22\. holiday_binary = Binary indicator for whether the date is a
    holiday (1 for holiday, 0 for non-holiday).

  - 23\. month = Month of the year when the measurement was recorded.

  - 24\. day_of_week = Day of the week when the measurement was
    recorded.

  - 25\. PMFactor = Factor variable for PM2.5 levels, possibly
    indicating an adjusted or categorized value.

``` r
combinedData_table <- read.csv("station_pm_met_holiday_dataCombined_formatted.csv")
head(combinedData_table) %>%
  kable()
```

|   X | station_ID | formatted_date | stations                     | address2                                                |     pm25 | Swnet_tavg | Lwnet_tavg | Qle_tavg |  Qh_tavg | Snowf_tavg | Rainf_tavg | Qsm_tavg | SnowT_tavg | SWE_tavg | SnowDepth_tavg | Tair_f_tavg | Rainf_f_tavg | Wind_f_tavg | Qair_f_tavg | Psurf_f_tavg | Parking | holiday_binary | month    | day_of_week | PMFactor |
|----:|-----------:|:---------------|:-----------------------------|:--------------------------------------------------------|---------:|-----------:|-----------:|---------:|---------:|-----------:|-----------:|---------:|-----------:|---------:|---------------:|------------:|-------------:|------------:|------------:|-------------:|--------:|---------------:|:---------|:------------|---------:|
|   1 |          1 | 2003-11-24     | I-485/South Boulevard        | i-485/south boulevard station, charlotte, nc 28134, usa | 10.70957 |   73.23891 |  -47.87754 | 52.99106 | -29.7069 |          0 |   2.17e-05 |        0 |   288.4865 |        0 |              0 |    288.6281 |     2.17e-05 |    5.050052 |   0.0097345 |     98743.61 |       1 |              0 | November | Monday      |        0 |
|   2 |          2 | 2003-11-24     | Sharon Road West station     | sharon road west station, charlotte, nc 28134, usa      | 10.95833 |   73.23891 |  -47.87754 | 52.99106 | -29.7069 |          0 |   2.17e-05 |        0 |   288.4865 |        0 |              0 |    288.6281 |     2.17e-05 |    5.050052 |   0.0097345 |     98743.61 |       1 |              0 | November | Monday      |        0 |
|   3 |          3 | 2003-11-24     | Arrowood station             | arrowood, 7717 england st, charlotte, nc 28273, usa     | 10.23755 |   73.23891 |  -47.87754 | 52.99106 | -29.7069 |          0 |   2.17e-05 |        0 |   288.4865 |        0 |              0 |    288.6281 |     2.17e-05 |    5.050052 |   0.0097345 |     98743.61 |       1 |              0 | November | Monday      |        0 |
|   4 |          4 | 2003-11-24     | Archdale station             | archdale, charlotte, nc 28217, usa                      | 11.35159 |   73.23891 |  -47.87754 | 52.99106 | -29.7069 |          0 |   2.17e-05 |        0 |   288.4865 |        0 |              0 |    288.6281 |     2.17e-05 |    5.050052 |   0.0097345 |     98743.61 |       1 |              0 | November | Monday      |        0 |
|   5 |          5 | 2003-11-24     | Tyvola station               | tyvola, 5703 old pineville rd, charlotte, nc 28217, usa | 10.90818 |   73.23891 |  -47.87754 | 52.99106 | -29.7069 |          0 |   2.17e-05 |        0 |   288.4865 |        0 |              0 |    288.6281 |     2.17e-05 |    5.050052 |   0.0097345 |     98743.61 |       1 |              0 | November | Monday      |        1 |
|   6 |          6 | 2003-11-24     | Woodlawn station (Charlotte) | woodlawn station, charlotte, nc 28217, usa              | 10.76754 |   73.23891 |  -47.87754 | 52.99106 | -29.7069 |          0 |   2.17e-05 |        0 |   288.4865 |        0 |              0 |    288.6281 |     2.17e-05 |    5.050052 |   0.0097345 |     98743.61 |       1 |              0 | November | Monday      |        1 |

### Regression Model Calculation

``` r
df <-read.csv("station_pm_met_holiday_dataCombined_formatted.csv")

df2 <- df %>% mutate(date = as.Date(formatted_date,format = "%Y-%m-%d"))


startdate <- as.Date("2003-11-24",format = "%Y-%m-%d")

enddate <- as.Date("2011-11-24",format = "%Y-%m-%d")

opendate <- as.Date("2007-11-24",format = "%Y-%m-%d")

constructionstart <- as.Date("2005-02-26",format = "%Y-%m-%d")

CAIR <- as.Date("2005-03-10",format = "%Y-%m-%d")

metroOpen_df <- df2 %>% filter(date >= startdate & date<=enddate)%>%
  mutate(MetroOpen = ifelse(date>=opendate,1,0))%>%
  mutate(construction = ifelse(date>=constructionstart & date<opendate,1,0))%>%
  mutate(duringCAIR = ifelse(date>=CAIR & date<= enddate,1,0))%>%
  group_by(station_ID)%>%
  arrange(date, station_ID)%>%
  mutate(lTair_f_tavg = lag(Tair_f_tavg))%>%
  mutate(lQair_f_tavg = lag(Qair_f_tavg)) %>%
  mutate(lPsurf_f_tavg = lag(Psurf_f_tavg)) %>%
  mutate(lWind_f_tavg = lag(Wind_f_tavg)) %>%
  mutate(t=as.numeric(date-startdate))%>%
  mutate(t2 = t^2,t3=t^3,t4=t^4)

regression_stats <- summary(m1 <- lm(log(pm25)~MetroOpen+construction+duringCAIR+as.factor(day_of_week)+as.factor(month) + Tair_f_tavg + Swnet_tavg + Lwnet_tavg + Qle_tavg + Qh_tavg + Snowf_tavg + Rainf_tavg + Qsm_tavg + SnowT_tavg + SWE_tavg + SnowDepth_tavg + Tair_f_tavg + Rainf_f_tavg + Wind_f_tavg + Qair_f_tavg + Psurf_f_tavg + Parking + Parking:MetroOpen, data = metroOpen_df))

df2 <- df %>% 
  mutate(date = as.Date(formatted_date, format = "%Y-%m-%d"))

# Define dates
startdate <- as.Date("2003-11-24", format = "%Y-%m-%d")
enddate <- as.Date("2011-11-24", format = "%Y-%m-%d")
opendate <- as.Date("2007-11-24", format = "%Y-%m-%d")
constructionstart <- as.Date("2005-02-26", format = "%Y-%m-%d")
CAIR <- as.Date("2005-03-10", format = "%Y-%m-%d")

# Filter and mutate the data
metroOpen_df <- df2 %>% 
  filter(date >= startdate & date <= enddate) %>%
  mutate(
    MetroOpen = ifelse(date >= opendate, 1, 0),
    construction = ifelse(date >= constructionstart & date < opendate, 1, 0),
    duringCAIR = ifelse(date >= CAIR & date <= enddate, 1, 0)
  ) %>%
  group_by(station_ID) %>%
  arrange(date, station_ID) %>%
  mutate(
    lTair_f_tavg = lag(Tair_f_tavg),
    lQair_f_tavg = lag(Qair_f_tavg),
    lPsurf_f_tavg = lag(Psurf_f_tavg),
    lWind_f_tavg = lag(Wind_f_tavg),
    t = as.numeric(date - startdate),
    t2 = t^2,
    t3 = t^3,
    t4 = t^4
  )

# Perform regression
regression_stats <- summary(
  m1 <- lm(
    log(pm25) ~ MetroOpen + construction + duringCAIR + as.factor(day_of_week) + as.factor(month) +
    Tair_f_tavg + Swnet_tavg + Lwnet_tavg + Qle_tavg + Qh_tavg + Snowf_tavg + Rainf_tavg + 
    Qsm_tavg + SnowT_tavg + SWE_tavg + SnowDepth_tavg + Tair_f_tavg + Rainf_f_tavg + 
    Wind_f_tavg + Qair_f_tavg + Psurf_f_tavg + Parking + Parking:MetroOpen,
    data = metroOpen_df
  )
)

pal <- brewer.pal(n=4,name = "RdBu")
df3 <- df2 %>% 
  group_by(date) %>% summarize(mean_pm25 = mean(pm25)) %>%
mutate(before_after = ifelse(date < opendate, "Before", "After"))

ggplot(df3, aes(x = date, y = mean_pm25, color = before_after))+
  
  geom_rect(aes(xmin = constructionstart,xmax = opendate, ymin = -Inf, ymax = Inf), alpha = 1, fill = "gray") +scale_color_manual(values = pal[3:4])+
  
  
  geom_point() +
  geom_smooth( color = "blue")+
  # facet_wrap(~ station_ID, scales = "free_y") +  # Facet by station_ID
  labs(
    x = "Date",
    y = "Average PM2.5 levels across stations",
    color = "Metro Opening"
  ) +
  
  theme_minimal()+geom_vline(xintercept = opendate, linetype = "dashed")+geom_vline(xintercept = CAIR, linetype = "dashed")
```

    `geom_smooth()` using method = 'gam' and formula = 'y ~ s(x, bs = "cs")'

![](README_files/figure-commonmark/unnamed-chunk-17-1.png)

### Regression Testing

DB-OLS Regression Table

 

|                                  |             |
|----------------------------------|-------------|
|                                  | Log(PM2.5)  |
| Factors                          | \(1\)       |
| MetroOpen                        | -0.26\*\*\* |
| Construction Dummy               |             |
| Day of Week Fixed Effects        |             |
| Month Fixed Effects              |             |
| Temperature, Wind, Humidity      |             |
| Holiday Binary                   |             |
| All Other Weather Controls       |             |
| Clean Air Interstate Rule Binary |             |

### Calculating Station level pollution change

Station-level effect and the p-values

``` r
c<- coef(m1)
len_coef<-length(coef(m1))

#get coefficients of the station-level effect
coef<-coef(m1)[(len_coef-(26-1)): len_coef]

#get p values of the station-level effect (p<0.05 is statistically significant)
pval<-summary(m1)$coefficients[,4][(len_coef-3): len_coef]

kable(cbind(coef, pval), digits=2)
```

    Warning in cbind(coef, pval): number of rows of result is not a multiple of
    vector length (arg 2)

|                           |        coef | pval |
|:--------------------------|------------:|-----:|
| as.factor(month)February  |        0.16 | 0.00 |
| as.factor(month)January   |        0.12 | 0.00 |
| as.factor(month)July      |        0.14 | 0.59 |
| as.factor(month)June      |        0.08 | 0.00 |
| as.factor(month)March     |        0.05 | 0.00 |
| as.factor(month)May       |       -0.01 | 0.00 |
| as.factor(month)November  |        0.11 | 0.59 |
| as.factor(month)October   |       -0.04 | 0.00 |
| as.factor(month)September |       -0.01 | 0.00 |
| Tair_f_tavg               |        0.48 | 0.00 |
| Swnet_tavg                |        0.01 | 0.59 |
| Lwnet_tavg                |        0.01 | 0.00 |
| Qle_tavg                  |       -0.01 | 0.00 |
| Qh_tavg                   |        0.00 | 0.00 |
| Snowf_tavg                |  8046323.01 | 0.59 |
| Rainf_tavg                |  8045056.06 | 0.00 |
| Qsm_tavg                  |    -8356.70 | 0.00 |
| SnowT_tavg                |       -0.50 | 0.00 |
| SWE_tavg                  |       -0.04 | 0.59 |
| SnowDepth_tavg            |        0.93 | 0.00 |
| Rainf_f_tavg              | -8045444.34 | 0.00 |
| Wind_f_tavg               |       -0.16 | 0.00 |
| Qair_f_tavg               |       30.51 | 0.59 |
| Psurf_f_tavg              |        0.00 | 0.00 |
| Parking                   |        0.00 | 0.00 |
| MetroOpen:Parking         |        0.02 | 0.00 |

### Census Data

Using American Census Survey (ACS) Data

``` r
vars<-load_variables(year=2010, dataset="acs1", cache = TRUE)


write.csv(vars, "demographics_variable_acs.csv")
```

### Interest Variable - Income

We hypothesize that lower-income individuals live closer to metro rail
lines and high-density urban areas, leading to higher PM2.5 exposure.
Conversely, higher-income individuals likely reside in suburban areas,
using private transportation and experiencing lower PM2.5 exposure.

The variable “targetvars” stores all the different income brackets from
the demographics file that was retreieved.

``` r
#vars range from less than 10k to more than 200k

targetvars <- c("B19001_001", "B19001_002", "B19001_003", "B19001_004", "B19001_005", 
                "B19001_006", "B19001_007", "B19001_008", "B19001_009", "B19001_010", 
                "B19001_011", "B19001_012", "B19001_013", "B19001_014", "B19001_015", 
                "B19001_016", "B19001_017")

income<-get_acs(geography = "tract", variables=targetvars, state="NC", county="Mecklenburg", output="wide", year = 2010) %>% select(-ends_with("M"))
```

    Getting data from the 2006-2010 5-year ACS

``` r
#the variables that end in E are the estimates while the ones that end in M tell the margin of error.

income_name<-income %>%
  rename(total = B19001_001E, 
       less_than_10k = B19001_002E, 
       `10k_to_15k` = B19001_003E, 
       `15k_to_20k` = B19001_004E, 
       `20k_to_25k` = B19001_005E, 
       `25k_to_30k` = B19001_006E, 
       `30k_to_35k` = B19001_007E, 
       `35k_to_40k` = B19001_008E, 
       `40k_to_45k` = B19001_009E, 
       `45k_to_50k` = B19001_010E, 
       `50k_to_60k` = B19001_011E, 
       `60k_to_75k` = B19001_012E, 
       `75k_to_100k` = B19001_013E, 
       `100k_to_125k` = B19001_014E, 
       `125k_to_150k` = B19001_015E, 
       `150k_to_200k` = B19001_016E, 
       `200k_or_more` = B19001_017E)
```

### Reading Buffer Files

``` r
buff<-vect("Buffer Light Rail/new_buffer_light_rail.shp")
shape<-tigris::tracts(state="NC", county="Mecklenburg", class="sp", year=2010)
shapevect<-vect(shape)
shapedf<-as.data.frame(shape)
```

### Summary Statistics of Income

``` r
tract_income<-merge(shapevect, income_name, by.x="GEOID10", by.y="GEOID")

tract_income$tract_area<-expanse(tract_income, unit="m")

tract_income_df<-as.data.frame(tract_income)

summary(tract_income_df)
```

       GEOID10           STATEFP10          COUNTYFP10         TRACTCE10        
     Length:233         Length:233         Length:233         Length:233        
     Class :character   Class :character   Class :character   Class :character  
     Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                                
                                                                                
                                                                                
        NAME10           NAMELSAD10          MTFCC10           FUNCSTAT10       
     Length:233         Length:233         Length:233         Length:233        
     Class :character   Class :character   Class :character   Class :character  
     Mode  :character   Mode  :character   Mode  :character   Mode  :character  
                                                                                
                                                                                
                                                                                
        ALAND10            AWATER10         INTPTLAT10         INTPTLON10       
     Min.   :  479017   Min.   :       0   Length:233         Length:233        
     1st Qu.: 2609447   1st Qu.:    2373   Class :character   Class :character  
     Median : 4251828   Median :   20172   Mode  :character   Mode  :character  
     Mean   : 5822942   Mean   :  245293                                        
     3rd Qu.: 6281067   3rd Qu.:   53777                                        
     Max.   :36214554   Max.   :20442349                                        
       COUNTYFP           STATEFP              NAME               total     
     Length:233         Length:233         Length:233         Min.   :   0  
     Class :character   Class :character   Class :character   1st Qu.:1093  
     Mode  :character   Mode  :character   Mode  :character   Median :1451  
                                                              Mean   :1504  
                                                              3rd Qu.:1917  
                                                              Max.   :3247  
     less_than_10k      10k_to_15k       15k_to_20k       20k_to_25k    
     Min.   :  0.00   Min.   :  0.00   Min.   :  0.00   Min.   :  0.00  
     1st Qu.: 29.00   1st Qu.: 20.00   1st Qu.: 22.00   1st Qu.: 31.00  
     Median : 68.00   Median : 55.00   Median : 52.00   Median : 64.00  
     Mean   : 88.58   Mean   : 63.88   Mean   : 68.84   Mean   : 77.65  
     3rd Qu.:134.00   3rd Qu.: 97.00   3rd Qu.:105.00   3rd Qu.:107.00  
     Max.   :389.00   Max.   :302.00   Max.   :284.00   Max.   :348.00  
       25k_to_30k       30k_to_35k       35k_to_40k       40k_to_45k   
     Min.   :  0.00   Min.   :  0.00   Min.   :  0.00   Min.   :  0.0  
     1st Qu.: 33.00   1st Qu.: 30.00   1st Qu.: 33.00   1st Qu.: 34.0  
     Median : 64.00   Median : 67.00   Median : 58.00   Median : 64.0  
     Mean   : 74.13   Mean   : 81.09   Mean   : 71.26   Mean   : 77.7  
     3rd Qu.:109.00   3rd Qu.:108.00   3rd Qu.:102.00   3rd Qu.:108.0  
     Max.   :307.00   Max.   :367.00   Max.   :337.00   Max.   :327.0  
       45k_to_50k       50k_to_60k      60k_to_75k     75k_to_100k   100k_to_125k  
     Min.   :  0.00   Min.   :  0.0   Min.   :  0.0   Min.   :  0   Min.   :  0.0  
     1st Qu.: 30.00   1st Qu.: 71.0   1st Qu.: 84.0   1st Qu.: 86   1st Qu.: 41.0  
     Median : 65.00   Median :118.0   Median :148.0   Median :166   Median :112.0  
     Mean   : 72.35   Mean   :132.3   Mean   :163.7   Mean   :179   Mean   :123.2  
     3rd Qu.:107.00   3rd Qu.:181.0   3rd Qu.:231.0   3rd Qu.:249   3rd Qu.:184.0  
     Max.   :278.00   Max.   :516.0   Max.   :628.0   Max.   :623   Max.   :463.0  
      125k_to_150k     150k_to_200k     200k_or_more      tract_area      
     Min.   :  0.00   Min.   :  0.00   Min.   :  0.00   Min.   :  483120  
     1st Qu.: 15.00   1st Qu.:  0.00   1st Qu.:  0.00   1st Qu.: 2615314  
     Median : 57.00   Median : 48.00   Median : 22.00   Median : 4270231  
     Mean   : 70.95   Mean   : 73.91   Mean   : 85.34   Mean   : 6068235  
     3rd Qu.:111.00   3rd Qu.:111.00   3rd Qu.:117.00   3rd Qu.: 6378453  
     Max.   :289.00   Max.   :442.00   Max.   :777.00   Max.   :39492388  

Inserting blocks with buffer

This code chunk examines the demographic distribution and environmental
benefits of light rail stations in Charlotte, NC. The code processes
spatial data to:

1.  Calculate the fraction of each income bracket within buffer zones
    around light rail stations, scaling population data based on the
    area of overlap between census tracts and buffers.
2.  Compute changes in pollution levels due to light rail stations,
    estimating the total impact across all stations. The average
    pollution reduction for each income bracket is calculated,
    highlighting the benefits for different demographic groups.
3.  Present the results in a summary table, showing the average
    pollution reduction experienced by individuals in each income
    bracket.

``` r
buffdf <- as.data.frame(buff)

output <- c()

for(i in 0:25){
  print(i)

buff2 <- subset(buff,buff$FID ==i)

int<-crop(tract_income, buff2)

int$intarea<-expanse(int, unit="m")



intdf<-as.data.frame(int)%>%

  mutate(frac_area=intarea/tract_area) %>%
  mutate(total=total*frac_area, 
         
         
         
        `less_than_10k` = `less_than_10k` * frac_area,
`10k_to_15k` = `10k_to_15k` * frac_area,
`15k_to_20k` = `15k_to_20k` * frac_area,
`20k_to_25k` = `20k_to_25k` * frac_area,
`25k_to_30k` = `25k_to_30k` * frac_area,
`30k_to_35k` = `30k_to_35k` * frac_area,
`35k_to_40k` = `35k_to_40k` * frac_area,
`40k_to_45k` = `40k_to_45k` * frac_area,
`45k_to_50k` = `45k_to_50k` * frac_area,
`50k_to_60k` = `50k_to_60k` * frac_area,
`60k_to_75k` = `60k_to_75k` * frac_area,
`75k_to_100k` = `75k_to_100k` * frac_area,
`100k_to_125k` = `100k_to_125k` * frac_area,
`125k_to_150k` = `125k_to_150k` * frac_area,
`150k_to_200k` = `150k_to_200k` * frac_area,
`200k_or_more` = `200k_or_more` * frac_area
         
         ) %>%
  summarize(total=sum(total), 
            
            
            `less_than_10k` = sum(`less_than_10k`),
`10k_to_15k` = sum(`10k_to_15k`),
`15k_to_20k` = sum(`15k_to_20k`),
`20k_to_25k` = sum(`20k_to_25k`),
`25k_to_30k` = sum(`25k_to_30k`),
`30k_to_35k` = sum(`30k_to_35k`),
`35k_to_40k` = sum(`35k_to_40k`),
`40k_to_45k` = sum(`40k_to_45k`),
`45k_to_50k` = sum(`45k_to_50k`),
`50k_to_60k` = sum(`50k_to_60k`),
`60k_to_75k` = sum(`60k_to_75k`),
`75k_to_100k` = sum(`75k_to_100k`),
`100k_to_125k` = sum(`100k_to_125k`),
`125k_to_150k` = sum(`125k_to_150k`),
`150k_to_200k` = sum(`150k_to_200k`),
`200k_or_more` = sum(`200k_or_more`)
            
            
            
            ) %>%
  mutate(
    
    
   `pct_less_than_10k` = `less_than_10k` * 100 / `total`,
`pct_10k_to_15k` = `10k_to_15k` * 100 / `total`,
`pct_15k_to_20k` = `15k_to_20k` * 100 / `total`,
`pct_20k_to_25k` = `20k_to_25k` * 100 / `total`,
`pct_25k_to_30k` = `25k_to_30k` * 100 / `total`,
`pct_30k_to_35k` = `30k_to_35k` * 100 / `total`,
`pct_35k_to_40k` = `35k_to_40k` * 100 / `total`,
`pct_40k_to_45k` = `40k_to_45k` * 100 / `total`,
`pct_45k_to_50k` = `45k_to_50k` * 100 / `total`,
`pct_50k_to_60k` = `50k_to_60k` * 100 / `total`,
`pct_60k_to_75k` = `60k_to_75k` * 100 / `total`,
`pct_75k_to_100k` = `75k_to_100k` * 100 / `total`,
`pct_100k_to_125k` = `100k_to_125k` * 100 / `total`,
`pct_125k_to_150k` = `125k_to_150k` * 100 / `total`,
`pct_150k_to_200k` = `150k_to_200k` * 100 / `total`,
`pct_200k_or_more` = `200k_or_more` * 100 / `total`
    
    
    
    )%>% mutate(FID = i)
output <- rbind(output,intdf)
}
```

    [1] 0
    [1] 1
    [1] 2
    [1] 3
    [1] 4
    [1] 5
    [1] 6
    [1] 7
    [1] 8
    [1] 9
    [1] 10
    [1] 11
    [1] 12
    [1] 13
    [1] 14
    [1] 15
    [1] 16
    [1] 17
    [1] 18
    [1] 19
    [1] 20
    [1] 21
    [1] 22
    [1] 23
    [1] 24
    [1] 25

``` r
  output
```

           total less_than_10k 10k_to_15k 15k_to_20k 20k_to_25k 25k_to_30k
    1   608.3756      20.61255   74.41855   26.48033   55.75708   34.08914
    2  1222.1663     119.01860  113.38081   82.65478  115.97494  126.27232
    3   861.8736      70.71944   35.65671   82.76296   78.99323   81.46999
    4  1112.8419      77.91542   82.63364  119.52384   98.30088  117.49948
    5   855.6544      58.20633   56.43109   81.50407   60.71510   71.76108
    6   793.1870      48.16878   46.39846   55.36087   51.30524   53.22278
    7   856.6025      61.65379   58.11632   58.96017   52.50670   54.33722
    8  1082.9981     157.97969   70.18301   91.92072   63.36017   48.47695
    9  1144.8484     157.40609   57.08982   76.66767   32.05358   45.85368
    10 1298.1082     214.12916   71.09150   70.12355   37.03190   40.08044
    11 1371.4431     206.81606   85.36064   44.05519   43.73127   30.98301
    12 1118.4385     166.33326   86.32960   24.75373   45.57101   27.66984
    13 1507.0295     120.72342   85.50171   28.51319   56.12372   38.89808
    14 1371.4431     206.81606   85.36064   44.05519   43.73127   30.98301
    15 1793.0881     147.14080  114.63272   59.06561   89.89054   60.79406
    16 1697.1156     163.02619  119.57703   69.44602   95.84754   64.21680
    17  581.4102     101.50131   68.65970   51.84826   76.56622   49.50072
    18  650.8680      95.35403   65.46587   53.94641   84.17788   76.09564
    19  669.5744      60.88256   48.08272   42.58526   67.46435   48.01194
    20  791.3632      74.23235   50.10293   56.37777   67.09097   54.90454
    21  579.7377      65.79947   46.90307   28.56821   52.91231   47.98821
    22 1303.0691     106.50897   50.24964  123.69944  148.05571  156.06458
    23  530.9410      34.68554   25.97385   39.55929   62.82535   39.02252
    24  368.7763      52.36857   13.58311   32.98146   38.86866   15.26962
    25  403.3999      48.58841   25.58411   18.57909   28.40995   22.05008
    26  284.6497      78.34003   12.59799   37.85615   44.97878   18.98171
       30k_to_35k 35k_to_40k 40k_to_45k 45k_to_50k 50k_to_60k 60k_to_75k
    1    47.14051   32.25304   46.60883 122.243328   40.28864  42.245306
    2    95.16028   78.58948   81.57847  94.413678  108.03520 111.203802
    3    55.11168   49.60469   71.28622  37.650193   86.64107  35.339855
    4    40.11328   45.63616   44.88858  45.038682  100.87292  93.953602
    5    61.03152   41.97831   35.66665  43.831899   67.14698  71.798829
    6    72.29291   55.17393   29.88185  46.322700   77.11816  89.214938
    7    59.93706   67.87835   42.59285  32.888847   87.09547  97.118218
    8    64.21484   44.35188   58.70476  23.882555   69.38626 101.758799
    9    31.28533   42.03607   40.31414  31.821583   63.43882 119.572315
    10   41.45717   51.69258   42.73319  23.112369   57.19749 131.277989
    11   79.42249   57.00017   27.31176  22.323258   62.63318 139.229441
    12   82.98506   48.48090   11.81555  21.202630   55.64729 102.318609
    13  116.14109   69.56013   15.28671  26.645507   79.91882 169.038528
    14   79.42249   57.00017   27.31176  22.323258   62.63318 139.229441
    15  115.76184   80.19281   20.33218  32.007365  104.87375 206.680664
    16   99.89256   71.38639   20.59954  33.258482  108.25027 191.041199
    17   22.75402   17.64267   11.03102  19.460581   79.79926  43.614662
    18   22.34979   31.10211   18.92107  31.105145   78.81165  45.841312
    19   51.43221   19.61968   25.61451  30.247743   69.26589  55.187122
    20   73.80317   23.61229   44.02661  32.176752   71.02992  63.999568
    21   80.48440   23.21154   37.74390   3.053375   68.91760  33.778267
    22  125.97656  103.19217   74.20172  28.652550  126.51446 141.677155
    23   28.91298   35.08104   46.99872  14.641252   40.41132  72.734283
    24   19.88827   12.08450   31.59464  13.502885   28.38376  48.460585
    25   49.85510   31.69622   17.26556  18.637951   30.01973  35.053087
    26   11.96671   13.26922   18.03712   6.945358   15.45983   9.132942
       75k_to_100k 100k_to_125k 125k_to_150k 150k_to_200k 200k_or_more
    1    31.923257     2.965419  24.06961444   1.47768554 5.802290e+00
    2    49.651766    14.288824  15.10096480   0.69014520 1.615225e+01
    3    94.852014    44.186917  15.07137300   9.00378445 1.352345e+01
    4   124.659273    52.980646  29.02761043  29.69170027 1.010624e+01
    5    92.085655    65.503030  13.49046657  25.71162102 8.791763e+00
    6    80.591086    58.202601   8.87004743  13.34511440 7.717494e+00
    7    79.902326    43.920503  22.40593539  26.78678847 1.050198e+01
    8    72.786847    60.679023  53.37345019  69.89373911 3.204542e+01
    9    95.442276   100.933600  61.83529731  72.40636478 1.166917e+02
    10   89.402765   118.209715  62.44880059  99.03504118 1.490845e+02
    11  111.725737   130.393438  81.49096585  97.74939386 1.512171e+02
    12   98.338446    95.902398  61.32577573  73.64437855 1.161200e+02
    13  153.116570   157.368012 111.71964759 106.26819431 1.722062e+02
    14  111.725737   130.393438  81.49096585  97.74939386 1.512171e+02
    15  201.914364   158.300980 111.43454181 112.72098275 1.773449e+02
    16  194.735415   132.223957  90.34212437  95.51209110 1.477600e+02
    17   12.489160    26.325756   0.05901191   0.06491311 9.294377e-02
    18   20.980627    25.458190   0.62909188   0.62909188 8.194116e-05
    19   71.924060    58.325488  10.11942699  10.11942699 6.920561e-01
    20   88.810116    60.974132  13.45121851  11.80962526 4.961223e+00
    21   60.927166    11.205307   3.01288813   0.00000000 1.523198e+01
    22   88.407438    23.292842   2.49671182   0.27295439 3.806191e+00
    23   45.446404    27.781631   6.34345499   7.00805837 3.515284e+00
    24   31.640268    12.849870   7.49460713   9.04465810 7.607813e-01
    25   36.130615    24.275144  11.10388384   6.13430829 1.672208e-02
    26    5.593119     1.335708   6.53327796   3.62170461 0.000000e+00
       pct_less_than_10k pct_10k_to_15k pct_15k_to_20k pct_20k_to_25k
    1           3.388129      12.232338       4.352628       9.164911
    2           9.738331       9.277036       6.762973       9.489293
    3           8.205315       4.137116       9.602679       9.165292
    4           7.001481       7.425461      10.740415       8.833319
    5           6.802551       6.595079       9.525349       7.095751
    6           6.072816       5.849625       6.979549       6.468240
    7           7.197480       6.784514       6.883026       6.129645
    8          14.587254       6.480437       8.487616       5.850442
    9          13.749077       4.986671       6.696753       2.799810
    10         16.495479       5.476547       5.401981       2.852759
    11         15.080178       6.224148       3.212324       3.188705
    12         14.871918       7.718761       2.213240       4.074521
    13          8.010687       5.673526       1.892013       3.724129
    14         15.080178       6.224148       3.212324       3.188705
    15          8.205999       6.393033       3.294072       5.013169
    16          9.606075       7.045898       4.092003       5.647673
    17         17.457780      11.809167       8.917672      13.169053
    18         14.650288      10.058241       8.288380      12.933172
    19          9.092725       7.181086       6.360048      10.075706
    20          9.380314       6.331218       7.124133       8.477899
    21         11.349869       8.090395       4.927783       9.126940
    22          8.173701       3.856253       9.492931      11.362077
    23          6.532843       4.892041       7.450789      11.832831
    24         14.200635       3.683292       8.943488      10.539904
    25         12.044723       6.342120       4.605625       7.042626
    26         27.521562       4.425787      13.299208      15.801451
       pct_25k_to_30k pct_30k_to_35k pct_35k_to_40k pct_40k_to_45k pct_45k_to_50k
    1        5.603305       7.748587       5.301501       7.661193     20.0933990
    2       10.331844       7.786197       6.430342       6.674908      7.7251089
    3        9.452661       6.394404       5.755448       8.271076      4.3684126
    4       10.558505       3.604580       4.100866       4.033688      4.0471769
    5        8.386690       7.132730       4.905988       4.168348      5.1226173
    6        6.709992       9.114234       6.955980       3.767314      5.8400732
    7        6.343341       6.997068       7.924136       4.972300      3.8394526
    8        4.476181       5.929358       4.095287       5.420578      2.2052259
    9        4.005219       2.732705       3.671758       3.521352      2.7795456
    10       3.087604       3.193661       3.982148       3.291959      1.7804656
    11       2.259154       5.791162       4.156219       1.991462      1.6277203
    12       2.473970       7.419725       4.334695       1.056433      1.8957350
    13       2.581110       7.706623       4.615711       1.014360      1.7680813
    14       2.259154       5.791162       4.156219       1.991462      1.6277203
    15       3.390467       6.456004       4.472329       1.133920      1.7850414
    16       3.783879       5.886020       4.206336       1.213797      1.9597063
    17       8.513907       3.913592       3.034461       1.897286      3.3471344
    18      11.691409       3.433843       4.778558       2.907052      4.7790252
    19       7.170516       7.681328       2.930172       3.825491      4.5174579
    20       6.937970       9.326080       2.983749       5.563388      4.0659905
    21       8.277572      13.882900       4.003800       6.510513      0.5266822
    22      11.976692       9.667681       7.919164       5.694381      2.1988512
    23       7.349691       5.445611       6.607334       8.851967      2.7576044
    24       4.140618       5.393045       3.276920       8.567429      3.6615386
    25       5.466058      12.358727       7.857270       4.280010      4.6202164
    26       6.668448       4.204015       4.661597       6.336604      2.4399671
       pct_50k_to_60k pct_60k_to_75k pct_75k_to_100k pct_100k_to_125k
    1        6.622330       6.943952        5.247295        0.4874323
    2        8.839648       9.098909        4.062603        1.1691391
    3       10.052642       4.100353       11.005328        5.1268445
    4        9.064443       8.442673       11.201885        4.7608419
    5        7.847442       8.391102       10.762015        7.6553140
    6        9.722571      11.247656       10.160415        7.3378161
    7       10.167548      11.337606        9.327818        5.1272909
    8        6.406868       9.396027        6.720866        5.6028743
    9        5.541242      10.444380        8.336674        8.8163290
    10       4.406219      10.113024        6.887158        9.1063070
    11       4.566954      10.152039        8.146582        9.5077544
    12       4.975445       9.148345        8.792477        8.5746689
    13       5.303069      11.216670       10.160157       10.4422649
    14       4.566954      10.152039        8.146582        9.5077544
    15       5.848778      11.526520       11.260705        8.8283994
    16       6.378486      11.256817       11.474493        7.7910990
    17      13.725122       7.501530        2.148081        4.5279143
    18      12.108700       7.043104        3.223484        3.9114214
    19      10.344763       8.242119       10.741757        8.7108294
    20       8.975642       8.087256       11.222422        7.7049493
    21      11.887722       5.826474       10.509437        1.9328237
    22       9.708960      10.872574        6.784555        1.7875370
    23       7.611264      13.699127        8.559596        5.2325269
    24       7.696744      13.140918        8.579801        3.4844625
    25       7.441679       8.689413        8.956525        6.0176370
    26       5.431178       3.208485        1.964913        0.4692464
       pct_125k_to_150k pct_150k_to_200k pct_200k_or_more FID
    1        3.95637435       0.24289035     9.537349e-01   0
    2        1.23559001       0.05646901     1.321609e+00   1
    3        1.74867564       1.04467579     1.569076e+00   2
    4        2.60842167       2.66809679     9.081466e-01   3
    5        1.57662567       3.00490731     1.027490e+00   4
    6        1.11827952       1.68246768     9.729728e-01   5
    7        2.61567472       3.12709665     1.226003e+00   6
    8        4.92830501       6.45372677     2.958955e+00   7
    9        5.40117784       6.32453744     1.019277e+01   8
    10       4.81075477       7.62918250     1.148475e+01   9
    11       5.94198680       7.12748465     1.102613e+01  10
    12       5.48316030       6.58457113     1.038233e+01  11
    13       7.41323562       7.05150061     1.142686e+01  12
    14       5.94198680       7.12748465     1.102613e+01  13
    15       6.21467180       6.28641624     9.890474e+00  14
    16       5.32327461       5.62790717     8.706537e+00  15
    17       0.01014979       0.01116477     1.598592e-02  16
    18       0.09665430       0.09665430     1.258952e-05  17
    19       1.51132217       1.51132217     1.033576e-01  18
    20       1.69975289       1.49231422     6.269212e-01  19
    21       0.51969852       0.00000000     2.627391e+00  20
    22       0.19160241       0.02094704     2.920944e-01  21
    23       1.19475704       1.31993166     6.620855e-01  22
    24       2.03229116       2.45261404     2.062989e-01  23
    25       2.75257446       1.52065175     4.145285e-03  24
    26       2.29519962       1.27233758     0.000000e+00  25

``` r
sum_demog<-output %>%
  #combinging all the station's data together
  summarize(
    total = sum(total),
   `less_than_10k` = sum(`less_than_10k`),
`10k_to_15k` = sum(`10k_to_15k`),
`15k_to_20k` = sum(`15k_to_20k`),
`20k_to_25k` = sum(`20k_to_25k`),
`25k_to_30k` = sum(`25k_to_30k`),
`30k_to_35k` = sum(`30k_to_35k`),
`35k_to_40k` = sum(`35k_to_40k`),
`40k_to_45k` = sum(`40k_to_45k`),
`45k_to_50k` = sum(`45k_to_50k`),
`50k_to_60k` = sum(`50k_to_60k`),
`60k_to_75k` = sum(`60k_to_75k`),
`75k_to_100k` = sum(`75k_to_100k`),
`100k_to_125k` = sum(`100k_to_125k`),
`125k_to_150k` = sum(`125k_to_150k`),
`150k_to_200k` = sum(`150k_to_200k`),
`200k_or_more` = sum(`200k_or_more`)
            
            
            )%>%
  mutate(
    
      `pct_less_than_10k` = `less_than_10k` * 100 / `total`,
`pct_10k_to_15k` = `10k_to_15k` * 100 / `total`,
`pct_15k_to_20k` = `15k_to_20k` * 100 / `total`,
`pct_20k_to_25k` = `20k_to_25k` * 100 / `total`,
`pct_25k_to_30k` = `25k_to_30k` * 100 / `total`,
`pct_30k_to_35k` = `30k_to_35k` * 100 / `total`,
`pct_35k_to_40k` = `35k_to_40k` * 100 / `total`,
`pct_40k_to_45k` = `40k_to_45k` * 100 / `total`,
`pct_45k_to_50k` = `45k_to_50k` * 100 / `total`,
`pct_50k_to_60k` = `50k_to_60k` * 100 / `total`,
`pct_60k_to_75k` = `60k_to_75k` * 100 / `total`,
`pct_75k_to_100k` = `75k_to_100k` * 100 / `total`,
`pct_100k_to_125k` = `100k_to_125k` * 100 / `total`,
`pct_125k_to_150k` = `125k_to_150k` * 100 / `total`,
`pct_150k_to_200k` = `150k_to_200k` * 100 / `total`,
`pct_200k_or_more` = `200k_or_more` * 100 / `total`
    
    )

kable(sum_demog, digits=2)
```

| total | less_than_10k | 10k_to_15k | 15k_to_20k | 20k_to_25k | 25k_to_30k | 30k_to_35k | 35k_to_40k | 40k_to_45k | 45k_to_50k | 50k_to_60k | 60k_to_75k | 75k_to_100k | 100k_to_125k | 125k_to_150k | 150k_to_200k | 200k_or_more | pct_less_than_10k | pct_10k_to_15k | pct_15k_to_20k | pct_20k_to_25k | pct_25k_to_30k | pct_30k_to_35k | pct_35k_to_40k | pct_40k_to_45k | pct_45k_to_50k | pct_50k_to_60k | pct_60k_to_75k | pct_75k_to_100k | pct_100k_to_125k | pct_125k_to_150k | pct_150k_to_200k | pct_200k_or_more |
|------:|--------------:|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|-----------:|------------:|-------------:|-------------:|-------------:|-------------:|------------------:|---------------:|---------------:|---------------:|---------------:|---------------:|---------------:|---------------:|---------------:|---------------:|---------------:|----------------:|-----------------:|-----------------:|-----------------:|-----------------:|
| 24859 |       2714.93 |    1649.37 |    1501.85 |    1692.24 |     1454.5 |    1628.79 |    1203.33 |     942.35 |     857.39 |    1839.79 |     2390.5 |      2145.2 |      1638.28 |       904.74 |       980.39 |      1315.36 |             10.92 |           6.63 |           6.04 |           6.81 |           5.85 |           6.55 |           4.84 |           3.79 |           3.45 |            7.4 |           9.62 |            8.63 |             6.59 |             3.64 |             3.94 |             5.29 |

``` r
everything <- cbind(output,coef)

reduction_benefit <- everything%>%
  mutate(
    #multiplying number of people in demographic by change in pollution caused by light rail
    total_change = total*coef,
    `less_than_10k_change` = `less_than_10k` * `coef`,
`10k_to_15k_change` = `10k_to_15k` * `coef`,
`15k_to_20k_change` = `15k_to_20k` * `coef`,
`20k_to_25k_change` = `20k_to_25k` * `coef`,
`25k_to_30k_change` = `25k_to_30k` * `coef`,
`30k_to_35k_change` = `30k_to_35k` * `coef`,
`35k_to_40k_change` = `35k_to_40k` * `coef`,
`40k_to_45k_change` = `40k_to_45k` * `coef`,
`45k_to_50k_change` = `45k_to_50k` * `coef`,
`50k_to_60k_change` = `50k_to_60k` * `coef`,
`60k_to_75k_change` = `60k_to_75k` * `coef`,
`75k_to_100k_change` = `75k_to_100k` * `coef`,
`100k_to_125k_change` = `100k_to_125k` * `coef`,
`125k_to_150k_change` = `125k_to_150k` * `coef`,
`150k_to_200k_change` = `150k_to_200k` * `coef`,
`200k_or_more_change` = `200k_or_more` * `coef`
    
    )%>%
  #summing impact across all stations
  summarize(total_change_sum=sum(total_change),
            total_pop = sum(total),
            `less_than_10k_change_sum` = sum(`less_than_10k_change`),
`10k_to_15k_change_sum` = sum(`10k_to_15k_change`),
`15k_to_20k_change_sum` = sum(`15k_to_20k_change`),
`20k_to_25k_change_sum` = sum(`20k_to_25k_change`),
`25k_to_30k_change_sum` = sum(`25k_to_30k_change`),
`30k_to_35k_change_sum` = sum(`30k_to_35k_change`),
`35k_to_40k_change_sum` = sum(`35k_to_40k_change`),
`40k_to_45k_change_sum` = sum(`40k_to_45k_change`),
`45k_to_50k_change_sum` = sum(`45k_to_50k_change`),
`50k_to_60k_change_sum` = sum(`50k_to_60k_change`),
`60k_to_75k_change_sum` = sum(`60k_to_75k_change`),
`75k_to_100k_change_sum` = sum(`75k_to_100k_change`),
`100k_to_125k_change_sum` = sum(`100k_to_125k_change`),
`125k_to_150k_change_sum` = sum(`125k_to_150k_change`),
`150k_to_200k_change_sum` = sum(`150k_to_200k_change`),
`200k_or_more_change_sum` = sum(`200k_or_more_change`),

#sums together populations of different income brackets across the stations
`less_than_10k` = sum(`less_than_10k`),
`10k_to_15k` = sum(`10k_to_15k`),
`15k_to_20k` = sum(`15k_to_20k`),
`20k_to_25k` = sum(`20k_to_25k`),
`25k_to_30k` = sum(`25k_to_30k`),
`30k_to_35k` = sum(`30k_to_35k`),
`35k_to_40k` = sum(`35k_to_40k`),
`40k_to_45k` = sum(`40k_to_45k`),
`45k_to_50k` = sum(`45k_to_50k`),
`50k_to_60k` = sum(`50k_to_60k`),
`60k_to_75k` = sum(`60k_to_75k`),
`75k_to_100k` = sum(`75k_to_100k`),
`100k_to_125k` = sum(`100k_to_125k`),
`125k_to_150k` = sum(`125k_to_150k`),
`150k_to_200k` = sum(`150k_to_200k`),
`200k_or_more` = sum(`200k_or_more`)

            
            
            ) %>%
  #ave variables are the amount of change in pollution an individual of that demographic would recieve on average
    mutate(total_change_average=total_change_sum/total_pop,
           
      `less_than_10k_average` = `less_than_10k_change_sum` / `less_than_10k`,
`10k_to_15k_average` = `10k_to_15k_change_sum` / `10k_to_15k`,
`15k_to_20k_average` = `15k_to_20k_change_sum` / `15k_to_20k`,
`20k_to_25k_average` = `20k_to_25k_change_sum` / `20k_to_25k`,
`25k_to_30k_average` = `25k_to_30k_change_sum` / `25k_to_30k`,
`30k_to_35k_average` = `30k_to_35k_change_sum` / `30k_to_35k`,
`35k_to_40k_average` = `35k_to_40k_change_sum` / `35k_to_40k`,
`40k_to_45k_average` = `40k_to_45k_change_sum` / `40k_to_45k`,
`45k_to_50k_average` = `45k_to_50k_change_sum` / `45k_to_50k`,
`50k_to_60k_average` = `50k_to_60k_change_sum` / `50k_to_60k`,
`60k_to_75k_average` = `60k_to_75k_change_sum` / `60k_to_75k`,
`75k_to_100k_average` = `75k_to_100k_change_sum` / `75k_to_100k`,
`100k_to_125k_average` = `100k_to_125k_change_sum` / `100k_to_125k`,
`125k_to_150k_average` = `125k_to_150k_change_sum` / `125k_to_150k`,
`150k_to_200k_average` = `150k_to_200k_change_sum` / `150k_to_200k`,
`200k_or_more_average` = `200k_or_more_change_sum` / `200k_or_more`
)

final_result <- reduction_benefit %>%
  select(total_change_average,`less_than_10k_average`, `10k_to_15k_average`, `15k_to_20k_average`, `20k_to_25k_average`, `25k_to_30k_average`, `30k_to_35k_average`, `35k_to_40k_average`, `40k_to_45k_average`, `45k_to_50k_average`, `50k_to_60k_average`, `60k_to_75k_average`, `75k_to_100k_average`, `100k_to_125k_average`, `125k_to_150k_average`, `150k_to_200k_average`, `200k_or_more_average`
)


kable(final_result,digits = 2)
```

| total_change_average | less_than_10k_average | 10k_to_15k_average | 15k_to_20k_average | 20k_to_25k_average | 25k_to_30k_average | 30k_to_35k_average | 35k_to_40k_average | 40k_to_45k_average | 45k_to_50k_average | 50k_to_60k_average | 60k_to_75k_average | 75k_to_100k_average | 100k_to_125k_average | 125k_to_150k_average | 150k_to_200k_average | 200k_or_more_average |
|---------------------:|----------------------:|-------------------:|-------------------:|-------------------:|-------------------:|-------------------:|-------------------:|-------------------:|-------------------:|-------------------:|-------------------:|--------------------:|---------------------:|---------------------:|---------------------:|---------------------:|
|             941794.3 |              723873.7 |           913349.5 |           535128.4 |           631141.9 |           425781.1 |           667596.3 |           858180.4 |           27130.75 |           583608.5 |           630283.2 |            1224778 |             1259106 |              1371636 |              1767583 |              1708899 |              1895423 |

``` r
final_result <- reduction_benefit %>%
  select(`less_than_10k_average`, `10k_to_15k_average`, `15k_to_20k_average`, `20k_to_25k_average`, `25k_to_30k_average`, `30k_to_35k_average`, `35k_to_40k_average`, `40k_to_45k_average`, `45k_to_50k_average`, `50k_to_60k_average`, `60k_to_75k_average`, `75k_to_100k_average`, `100k_to_125k_average`, `125k_to_150k_average`, `150k_to_200k_average`, `200k_or_more_average`
)
income_groups <-  c(
  "<10k",
  "10k-15k",
  "15k-20k",
  "20k-25k",
  "25k-30k",
  "30k-35k",
  "35k-40k",
  "40k-45k",
  "45k-50k",
  "50k-60k",
  "60k-75k",
  "75k-100k",
  "100k-125k",
  "125k-150k",
  "150k-200k",
  ">200k"
)




plot_table <- t(final_result)
# colnames(plot_table) = "pollution reduction per person (as a result of metro opening )"

plot_table <- cbind(income_groups, t(final_result))

plot_table = as.data.frame(plot_table)

plot_table$V2 <- as.numeric(plot_table$V2)

# plot_table$income_groups <- as.factor(plot_table$income_groups)

plot_table$income_groups <- factor(plot_table$income_groups, levels = income_groups)

# png("average_income_change.png", width = 1000, height = 600, units = "px" )
plot <- ggplot(data = plot_table, aes(x = income_groups, y = V2)) + 
  geom_bar(stat = "identity", position = "dodge", fill = "#88a6ff", color = "#9e9e9e") +
  expand_limits(y = c(-0.3, 0)) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),  # Adjust x-axis text size
    axis.text.y = element_text(size = 10),  # Adjust y-axis text size
    axis.title.x = element_text(size = 12),  # Adjust x-axis title size
    axis.title.y = element_text(size = 12),  # Adjust y-axis title size
    plot.title = element_text(size = 14)  # Adjust plot title size
  )+
  labs(
    x = "Income Groups",
    y = "Average Pollution Change",  # Add y-axis label
  )

# Print the plot
print(plot)
```

![](README_files/figure-commonmark/unnamed-chunk-23-1.png)

``` r
# dev.off()

#all income groups seem to be getting a similar pollution reduction benefit on the individual level.
```

### **Reduction Benefit in PM2.5 with Factors**

``` r
regression_stats <- summary(m1 <- lm(log(pm25) ~ MetroOpen:as.factor(station_ID) + construction + as.factor(day_of_week) + as.factor(month) + duringCAIR + Tair_f_tavg + Swnet_tavg + Lwnet_tavg + Qle_tavg + Qh_tavg + Snowf_tavg + Rainf_tavg + Qsm_tavg + SnowT_tavg + SWE_tavg + SnowDepth_tavg + Tair_f_tavg + Rainf_f_tavg + Wind_f_tavg + Qair_f_tavg + Psurf_f_tavg, data = metroOpen_df))

c <- coef(m1)
len_coef <- length(coef(m1))

# Get coefficients of the station-level effect
station_coef <- coef(m1)[(len_coef-(26-1)):len_coef]

# Convert coefficients to percentage change
station_coef_perc <- station_coef * 100

# Get p-values of the station-level effect (p < 0.05 is statistically significant)
pval <- summary(m1)$coefficients[,4][(len_coef-(26-1)):len_coef]

# Combine coefficients and p-values into a dataframe
station_data <- data.frame(coef = station_coef_perc, pval = pval)

# Load station coordinates
x <- vect(sample_latlon, crs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
pm_sources <- vect("PM2.5 ShapeFiles/new_pm_coords_sources.shp")

# Add coefficients to the spatial data
x$coef <- station_coef_perc
x$pval <- pval

# Define the breaks for the coefficients

breaks_interval <- c(-32, -30, -28, -26, -24, -22, -20)

# Create color palette with different shades of green (adjust green range as desired)
color_palette <- colorRampPalette(c("#2166AC", "#D1E5F0"))
colors <- color_palette(length(breaks_interval) - 1)




# Creating Buffer around stations
# Used Buffer Radius is 800 meters
pts_buffer <- buffer(x, width = 800)

# Creating Buffer for Map
extent <- buffer(aggregate(pts_buffer), width = 3000)

bg <- get_tiles(ext(extent), zoom = 11, provider = "Esri.WorldStreetMap")

plot(bg)

plot(pts_buffer, 
     "coef",
     type = "interval",
     breaks = breaks_interval, 
     col = colors,
     cex.main = 2.125,
     plg = list( # parameters for drawing legend
       title = "Change in PM2.5 \n (in Percents)",
       title.cex = 1.5, # Legend title size
       cex = 1.5, # Legend text size
       inset = c(0.02, 0.02), # Legend inset (spacing from the plot)
       ncol = 1), # Number of columns in the legend
     add = TRUE)

# pch=19 gives filled circles
points(x, col = "black", pch = 19, cex = 2)

# pch=17 gives filled triangles
points(pm_sources, col = "#B2182B", pch = 17, cex = 2)
```

![](README_files/figure-commonmark/unnamed-chunk-24-1.png)

``` r
# Plot the buffer around the stations
# lines(pts_buffer, col = "red")

# dev.off() 
```

## Conclusions

1.  **Effect of Light Rails on PM2.5 Levels**: The introduction of light
    rails in Charlotte is associated with a 26.5% reduction in PM2.5
    levels. This confirms that the light rail system has a significant
    positive impact on air quality.

2.  **Effect Across Income Groups**: The reduction in PM2.5 levels
    benefits all income groups nearly equally, with minimal variation,
    indicating that the improvements in air quality are broadly
    distributed across different income brackets.

## Future Areas of Exploration

1.  Has the introduction of the light rail improved the quality of human
    health? 

2.  Does including other pollution control policies, like the Diesel
    Emission Reduction Act, affect our estimates?
