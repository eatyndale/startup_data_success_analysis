# Startup Data Analysis

This project analyzes startup data to understand factors influencing startup success, profitability, and performance across different industries and regions.

## Project Structure

The analysis is organized into the following R scripts:

1. `main.R` - Main script that sources all other analysis scripts
2. `01_setup.R` - Package installation and data loading
3. `02_data_preparation.R` - Data cleaning and validation
4. `03_descriptive_stats.R` - Basic descriptive statistics
5. `04_exploratory_analysis.R` - Visualizations and correlation analysis
6. `05_feature_engineering.R` - Feature creation and success rate calculations
7. `06_statistical_tests.R` - Statistical tests (t-tests, ANOVA, chi-square)
8. `07_modeling.R` - Regression models

## Prerequisites

- R (version 4.0.0 or higher recommended)
- Required R packages (automatically installed by the setup script):
  - tidyverse
  - janitor
  - DataExplorer
  - GGally
  - car
  - skimr
  - corrplot

## Data

The analysis uses `startup_data.csv`, which should be placed in the project root directory. The dataset contains information about startups including:
- Revenue
- Valuation
- Funding information
- Industry
- Region
- Profitability status
- Exit status
- Other relevant metrics

## How to Run

1. Ensure you have R installed on your system
2. Place the `startup_data.csv` file in the project root directory
3. Open R or RStudio
4. Run the main script:
   ```R
   source("main.R")
   ```

This will execute all analysis scripts in sequence.

## Analysis Components

### Data Preparation
- Missing value analysis
- Duplicate detection
- Outlier detection using IQR method
- Categorical variable consistency checks

### Descriptive Statistics
- Summary statistics by region
- Summary statistics by industry
- Summary statistics by profitability status

### Exploratory Analysis
- Distribution plots for numeric variables
- Bar plots for categorical variables
- Correlation analysis with heatmaps

### Feature Engineering
- Success label creation
- Success rate calculations by industry and region

### Statistical Tests
- T-tests for revenue and funding rounds
- ANOVA for funding amounts
- Chi-square tests for categorical relationships

### Modeling
- Multiple linear regression for revenue prediction
- Logistic regression for profitability prediction
- Logistic regression for success prediction

## Output

The analysis generates:
- Statistical summaries
- Visualizations
- Statistical test results
- Regression model outputs

All outputs are printed to the console and plots are displayed in the R graphics device.

## Notes

- The analysis assumes the data is in CSV format
- Missing values are handled appropriately in each analysis step
- All plots are generated using ggplot2 for consistency and quality 