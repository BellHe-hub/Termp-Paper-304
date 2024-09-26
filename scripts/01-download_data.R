#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Xiaoguang He
# Date: 26 September 2024
# Contact: xiaoguang.he@mail.utoronto.ca
# License: None
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
install.packages('tidyverse')
install.packages('opendatatoronto')


#### Download data ####
#| echo: false
#| warning: false
# Install necessary packages (if not installed)
library(opendatatoronto)
library(tidyverse)

# Retrieve a list of all available data packages from the OpenDataToronto portal
packages <- list_packages(120)
# Display the list of available packages
packages

#| echo: false
#| warning: false

stillbirth_packages <- search_packages("Stillbirth Registration Statistics")
stillbirth_resources <- stillbirth_packages %>%
  list_package_resources()
stillbirth_statistics <- stillbirth_resources[2,] %>%
  get_resource()

stillbirth_statistics




#### Save data ####
write_csv(stillbirth_statistics, "raw_data.csv")

         
