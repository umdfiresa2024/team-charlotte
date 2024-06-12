# Team Charlotte Weekly Report
Adi & David

## Research Question

What is the impact of particulate matter (PM2.5) and other environmental
factors on human health for individuals living in proximity to the Blue
Line light rail in Charlotte, North Carolina.

## Hypothesis

We hypothesize that:

1.  The concentration of PM2.5 is higher near the Blue Line light rail
    stations compared to areas further away.
2.  Proximity to major traffic intersections, industrial areas, power
    plants, and airports exacerbates the level of PM

## Context

- Area of study: Blue Lynx Light Rail, Charlotte, North Caroline

  - Table with corresponding above stations

- Time Frame: November 2003 - November 2011

- Factors associated with PM2.5

  - Airport

  - Power Plant(s)

  - Factories

  - Major Intersection

    - Table with corresponding above factors

      ``` r
      library("knitr")


      factors_table <- read.csv("pm_geocoded_data.csv")
      kable(factors_table)
      ```

      | Type          | sources                                                 | Address                                                                | Reason.s.                                                                                       |       lon |      lat | address                                                                                            |
      |:--------------|:--------------------------------------------------------|:-----------------------------------------------------------------------|:------------------------------------------------------------------------------------------------|----------:|---------:|:---------------------------------------------------------------------------------------------------|
      | Power Plant   | GG Allen steam station                                  | 253 Plant Allen Rd, Belmont, NC 28012                                  | Coal-fired power plant.                                                                         | -81.00855 | 35.18982 | 253 plant allen rd, belmont, nc 28012, usa                                                         |
      | Neighbourhood | South End                                               | South End, Charlotte, NC 28203                                         | Once heavily industrial, still contains some light industrial facilities despite redevelopment. | -80.85878 | 35.21256 | south end, charlotte, nc 28203, usa                                                                |
      | Airport       | Charlotte Douglas International Airport                 | 5501 Josh Birmingham Pkwy, Charlotte, NC 28208                         |                                                                                                 | -80.95395 | 35.21630 | charlotte douglas international airport (clt), 5501 josh birmingham pkwy, charlotte, nc 28208, usa |
      | Intersection  | Ardrey Kell Rd Rea Rd                                   | Ardrey Kell Rd Rea Rd, Charlotte, NC                                   |                                                                                                 | -80.80554 | 35.03361 | ardrey kell rd & rea rd, charlotte, nc 28277, usa                                                  |
      | Intersection  | Ardrey Kell Rd Tom Short Rd                             | Ardrey Kell Rd Tom Short Rd, Charlotte, NC                             |                                                                                                 | -80.79392 | 35.04063 | ardrey kell rd & tom short rd, providence crossing, nc 28277, usa                                  |
      | Intersection  | Back Creek Church Rd Pavilion Blvd University City Blvd | Back Creek Church Rd Pavilion Blvd University City Blvd, Charlotte, NC |                                                                                                 | -80.71236 | 35.31127 | pavilion blvd & university city blvd, charlotte, nc 28262, usa                                     |
      | Intersection  | Ballantyne Commons Pkwy Johnston Rd                     | Ballantyne Commons Pkwy Johnston Rd, Charlotte, NC                     |                                                                                                 | -80.85015 | 35.05458 | ballantyne commons pkwy & johnston rd, charlotte, nc 28277, usa                                    |
      | Intersection  | Ballantyne Commons Pkwy Rea Rd                          | Ballantyne Commons Pkwy Rea Rd, Charlotte, NC                          |                                                                                                 | -80.81236 | 35.05821 | ballantyne commons pkwy & rea rd, charlotte, nc 28277, usa                                         |
      | Intersection  | Billy Graham Pkwy S Tryon St Woodlawn Rd                | Billy Graham Pkwy S Tryon St Woodlawn Rd, Charlotte, NC                |                                                                                                 | -80.88929 | 35.18067 | s tryon st & billy graham pkwy, charlotte, nc 28217, usa                                           |
      | Intersection  | Billy Graham Pkwy West Bv                               | Billy Graham Pkwy West Bv, Charlotte, NC                               |                                                                                                 | -80.92205 | 35.20614 | billy graham pkwy & west blvd, charlotte, nc 28208, usa                                            |
      | Intersection  | Brookshire Blvd Mt Holly Huntersville Rd                | Brookshire Blvd Mt Holly Huntersville Rd, Charlotte, NC                |                                                                                                 | -80.94522 | 35.32554 | brookshire blvd & mt holly-huntersville rd, charlotte, nc 28216, usa                               |
      | Intersection  | Carmel Rd Colony Rd                                     | Carmel Rd Colony Rd, Charlotte, NC                                     |                                                                                                 | -80.80911 | 35.13259 | colony rd & carmel rd, charlotte, nc 28226, usa                                                    |
      | Intersection  | Charlottetowne Av I-277 OL Ramp Kenilworth Av           | Charlottetowne Av I-277 OL Ramp Kenilworth Av, Charlotte, NC           |                                                                                                 |        NA |       NA | NA                                                                                                 |
      | Intersection  | Colony Rd Fairview Rd                                   | Colony Rd Fairview Rd, Charlotte, NC                                   |                                                                                                 | -80.82097 | 35.14655 | fairview rd, charlotte, nc, usa                                                                    |
      | Intersection  | Colville Rd Laurel Av Randolph Rd                       | Colville Rd Laurel Av Randolph Rd, Charlotte, NC                       |                                                                                                 | -80.81838 | 35.19667 | colville rd, charlotte, nc 28207, usa                                                              |
      | Intersection  | Fairview Rd Park Road Tyvola Rd                         | Fairview Rd Park Road Tyvola Rd, Charlotte, NC                         |                                                                                                 | -80.84779 | 35.15262 | fairview rd & park rd, charlotte, nc 28210, usa                                                    |
      | Intersection  | Fairview Rd Providence Rd Sardis Rd                     | Fairview Rd Providence Rd Sardis Rd, Charlotte, NC                     |                                                                                                 | -80.79561 | 35.15381 | fairview rd & providence rd, charlotte, nc 28211, usa                                              |
      | Intersection  | Fairview Rd Sharon Rd                                   | Fairview Rd Sharon Rd, Charlotte, NC                                   |                                                                                                 | -80.83079 | 35.14849 | fairview rd & sharon rd, charlotte, nc 28210, usa                                                  |
      | Intersection  | I-85 Ramps Brookshire Blvd                              | I-85 Ramps Brookshire Blvd, Charlotte, NC                              |                                                                                                 | -80.92187 | 35.30571 | brookshire blvd, north carolina, usa                                                               |
      | Intersection  | Independence Blvd Village Lake Dr                       | Independence Blvd Village Lake Dr, Charlotte, NC                       |                                                                                                 | -80.73939 | 35.16268 | e independence blvd & village lake dr, charlotte, nc 28227, usa                                    |
      | Intersection  | Kings Dr Morehead St                                    | Kings Dr Morehead St, Charlotte, NC                                    |                                                                                                 | -80.83608 | 35.20548 | kings dr & morehead st, charlotte, nc 28204, usa                                                   |
      | Intersection  | Park Rd Woodlawn Rd                                     | Park Rd Woodlawn Rd, Charlotte, NC                                     |                                                                                                 | -80.85109 | 35.17205 | park rd & woodlawn rd, charlotte, nc 28209, usa                                                    |
      | Intersection  | Pineville-Matthews Rd Providence Rd                     | Pineville-Matthews Rd Providence Rd, Charlotte, NC                     |                                                                                                 | -80.77880 | 35.09993 | providence rd & pineville-matthews rd, charlotte, nc 28277, usa                                    |
      | Intersection  | Providence Rd Queens Rd                                 | Providence Rd Queens Rd, Charlotte, NC                                 |                                                                                                 |        NA |       NA | NA                                                                                                 |
      | Intersection  | Providence Rd Sharon Amity Rd                           | Providence Rd Sharon Amity Rd, Charlotte, NC                           |                                                                                                 | -80.80826 | 35.17134 | providence rd & s sharon amity rd, charlotte, nc 28211, usa                                        |
      | Intersection  | Providence Rd Wendover Rd                               | Providence Rd Wendover Rd, Charlotte, NC                               |                                                                                                 | -80.81747 | 35.17740 | providence rd & s wendover rd, charlotte, nc 28211, usa                                            |
      | Intersection  | Randolph Rd Sharon Amity Rd                             | Randolph Rd Sharon Amity Rd, Charlotte, NC                             |                                                                                                 | -80.79823 | 35.17594 | randolph rd & s sharon amity rd, charlotte, nc 28211, usa                                          |
      | Intersection  | Randolph Rd Wendover Rd                                 | Randolph Rd Wendover Rd, Charlotte, NC                                 |                                                                                                 | -80.80757 | 35.18421 | n wendover rd & randolph rd, charlotte, nc 28211, usa                                              |
      | Intersection  | Runnymede Ln Selwyn Av Woodlawn Rd                      | Runnymede Ln Selwyn Av Woodlawn Rd, Charlotte, NC                      |                                                                                                 | -80.84076 | 35.17083 | runnymede ln & selwyn ave, charlotte, nc 28209, usa                                                |
      | Intersection  | South Blvd Tyvola Rd                                    | South Blvd Tyvola Rd, Charlotte, NC                                    |                                                                                                 | -80.87604 | 35.16482 | tyvola rd & south blvd, charlotte, nc 28210, usa                                                   |
      | Intersection  | South Blvd Woodlawn Rd                                  | South Blvd Woodlawn Rd, Charlotte, NC                                  |                                                                                                 | -80.87582 | 35.17653 | e woodlawn rd & south blvd, charlotte, nc 28209, usa                                               |

### Team Tasks

- Chose a City for the Research

  - Charlotte, North Carolina

- Created a
  [spreadsheet](https://docs.google.com/spreadsheets/d/1ZFwtPYZDcX4K_ywbQWh51AtqWkiJgJTiqacHCCI4Mdc/edit#gid=0)
  that tracks the following:

  1.  Station Name

  2.  Address

  3.  Built Date

  4.  Coordinates

  5.  Location

  6.  Parking Availability

- Completed GeoCoding to find coordinates of all the stations in Lynx
  Blue Line, Charlotte, NC

- Created an account, project and use the Google GeoCoding API

- Converted coordinates into spatial objects and plot them

- Created buffers around stations and calculate daily PM2.5

- Found sources around stations that contribute towards the PM2.5 levels

- Created an Interactive Map with buffer zones around stations
  \[optional\]

### Individual Tasks

- Complete Tidyverse DataCamp: David Guan

- Complete Spatial Training: Adityaraj Padmanabhan

## 
