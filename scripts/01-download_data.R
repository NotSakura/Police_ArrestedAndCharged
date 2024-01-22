
#### Preamble ####
# Purpose: Get data on police arrest and charged cases
# Author: Sakura Noskor
# Email: sakura.noskor@mail.utoronto.ca
# Date: 16 January 2024
# Prerequisites: -

#### Workspace setup ####
#install.packages("opendatatoronto")
#install.packages("janitor")
#install.packages("lubridate")
#install.packages("tidyverse")
#install.packages("knitr")

#### Simulate data ####
library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)


resources <- list_package_resources("police-annual-statistical-report-arrested-and-charged-persons")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
raw_data <- filter(datastore_resources, row_number()==1) %>% get_resource()

write_csv(
  x = raw_data,
  file = "inputs/data/rawdata_A&CToronto.csv"
)
