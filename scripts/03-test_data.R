#### Preamble ####
# Purpose: Get data on police arrest and charged cases
# Author: Sakura Noskor
# Email: sakura.noskor@mail.utoronto.ca
# Date: 16 January 2024
# Prerequisites: Must have raw data already installed

#### Workspace setup ####
#install.packages("opendatatoronto")
#install.packages("janitor")
#install.packages("tidyverse")
#install.packages("knitr")
#install.packages("dplyr")
#install.packages("readr")

#### libraries ####
library(knitr)
library(janitor)
library(opendatatoronto)
library(tidyverse)
library(readr)
library(dplyr)

#### Test data ####
clean <- read_csv(
  "/cloud/project/inputs/data/rawdata_A&CToronto.csv",
  show_col_types = FALSE
)

clean <-
  clean_names(clean)


# checking if there is empty cells in data and if there is replacing it with 
any_empty <- any(is.na(clean) | clean == "")


# Check the neighborhood number is between 1-140

clean$neighbourhood_158 |> min() == 1
clean$neighbourhood_158 |> max() == 140

# check if the years are not in future
clean$arrest_year |> max() <= 2024

# check all values in arrest_count is numbers
clean$arrest_count |> class() == "numeric"
