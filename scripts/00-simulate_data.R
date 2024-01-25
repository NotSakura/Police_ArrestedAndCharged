#### Preamble ####
# Purpose: Get data on police arrest and charged cases
# Author: Sakura Noskor
# Email: sakura.noskor@mail.utoronto.ca
# Date: 16 January 2024
# Prerequisites: -

#### Workspace setup ####
#install.packages("opendatatoronto")
#install.packages("janitor")
#install.packages("tidyverse")
#install.packages("knitr")
#install.packages("dplyr")
#install.packages("readr")

#### Simulate data ####
library(knitr)
library(janitor)
library(opendatatoronto)
library(tidyverse)
library(readr)
library(dplyr)

# Set seed for reproducibility as referenced in textbook
set.seed(853)

clean <- read_csv(
  "/cloud/project/inputs/data/rawdata_A&CToronto.csv",
  show_col_types = FALSE
)

clean <-
  clean_names(clean)

# Define parameters for simulation
num_records <- 1000
years <- 2014:2022
divisions <- clean$division
hoods <- clean$hood_158
neighbourhoods <- clean$neighbourhood_158
sexes <- c('Male', 'Female')
age_cohorts <- 1:100
age_groups <- c('Senior', 'Adult', 'Youth')
categories <- paste0("String", seq(1, 6)) # 6 different charges in data (didn't name cause stimulation) 
subtypes <- paste0("String", seq(1, 16)) # similarly 16 different charges

# Create a data frame to store the simulated data
simulated_data <- data.frame(
  year = sample(years, num_records, replace = TRUE),
  division = sample(divisions, num_records, replace = TRUE),
  hood = sample(hoods, num_records, replace = TRUE),
  neighbourhood = sample(neighbourhoods, num_records, replace = TRUE),
  sex = sample(sexes, num_records, replace = TRUE),
  age_cohort = sample(age_cohorts, num_records, replace = TRUE),
  age_group = sample(age_groups, num_records, replace = TRUE),
  category = sample(categories, num_records, replace = TRUE),
  subtype = sample(subtypes, num_records, replace = TRUE),
  count = rpois(num_records, lambda = 5)
)

# Display the first few rows of the simulated dataset
head(simulated_data)

