#### Preamble ####
# Purpose: Cleans the raw plane data recorded to extract column and improve the data
# Author: Xiaoguang He
# Date: 26 September 2024
# Contact: xiaoguang.he@mail.utoronto.ca
# License: None
# Pre-requisites: installment of tidyverse
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(dplyr)

# Load the data
data <- read.csv("raw_data.csv")
cleaned_data <- data %>%
  select(-CIVIC_CENTRE) %>%
  mutate(TIME_PERIOD = format(as.Date(paste0(TIME_PERIOD, "-01"), format = "%Y-%m-%d"), "%Y-%m")) %>%
  filter(!is.na(STILLBIRTH_LICENSES) & STILLBIRTH_LICENSES > 0 & !is.na(TIME_PERIOD)) %>%
  distinct(X_id, .keep_all = TRUE)



#### Save data ####
write_csv(cleaned_data, "cleaned_data.csv")
