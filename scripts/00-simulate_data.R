#### Preamble ####
# Purpose: Simulates intended type of data
# Author: Xiaoguang He
# Date: 26 September 2024
# Contact: xiaoguang.he@mail.utoronto.ca
# License: None
# Pre-requisites: installment of tidyverse and janitor
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(janitor)
# Load necessary libraries
# Set seed for reproducibility
set.seed(77)


# Simulating data
simulated_data <- data.frame(
  X_id = 4177 + 1:n,
  CIVIC_CENTRE = sample(c("ET", "OT", "NY"), n, replace = TRUE),
  STILLBIRTH_LICENSES = rpois(n, lambda = 20),  # Simulating using Poisson distribution
  TIME_PERIOD = seq(as.Date("2011/01/01"), by = "month", length.out = n) %>% format("%Y-%m")
)

simulated_data



