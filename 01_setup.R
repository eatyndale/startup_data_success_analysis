# Load necessary libraries
required_packages <- c(
  "tidyverse",    # Comprehensive data manipulation and visualization tools
  "janitor",      # Streamlines data cleaning (e.g., clean column names)
  "DataExplorer", # Automated exploratory data analysis reports
  "GGally",       # Extension of ggplot2 for correlation and pairwise plots
  "car",          # Companion to Applied Regression (e.g., VIF, ANOVA)
  "skimr",        # Quick summary of data with nice formatting
  "corrplot"
)

# Install only packages that are not already installed
install.packages(setdiff(required_packages, rownames(installed.packages())), dependencies = TRUE)

# Load all required packages into the session
lapply(required_packages, library, character.only = TRUE)

# Load and View the Dataset
startupdata <- read.csv("startup_data.csv") %>%
  clean_names()

# Display initial data overview
head(startupdata)
skim(startupdata) 