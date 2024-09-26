#### Preamble ####
# Purpose: Tests for parameter type, invalid values and NA outputs
# Author: Xiaoguang He
# Date: 26 September 2024
# Contact: xiaoguang.he@mail.utoronto.ca
# License: None
# Pre-requisites: Installment of package tidyverse
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Test data ####
stillbirth_cleaned_data <- read_csv("cleaned_data.csv")

stillbirth_cleaned_data$STILLBIRTH_LICENSES |> class() == "numeric"

stillbirth_cleaned_data$TIME_PERIOD |> class() == "character"

missing_values <- colSums(is.na(data))
missing_values

stillbirth_cleaned_data$TIME_PERIOD <- as.character(stillbirth_cleaned_data$TIME_PERIOD)
invalid_time_periods <- stillbirth_cleaned_data %>% filter(!grepl("^\\d{4}-\\d{2}$", TIME_PERIOD))
invalid_time_periods

stillbirth_cleaned_data$STILLBIRTH_LICENSES |> min() >= 0
