# Data Preparation Script

# 1. Check for Missing Values
missing_values <- startupdata %>%
  summarise_all(~ sum(is.na(.)))

cat("Missing Values per Column:\n")
print(missing_values)

# 2. Check for Duplicates
duplicate_rows <- startupdata %>%
  duplicated()

cat("\nNumber of Duplicate Rows:", sum(duplicate_rows), "\n")

# View duplicate rows if any
if(sum(duplicate_rows) > 0) {
  print(startupdata[duplicate_rows, ])
}

# 3. Detect outliers using the IQR rule
detect_outliers <- function(x) {
  if(is.numeric(x)) {
    Q1 <- quantile(x, 0.25, na.rm = TRUE)
    Q3 <- quantile(x, 0.75, na.rm = TRUE)
    IQR_value <- Q3 - Q1
    return(sum(x < (Q1 - 1.5 * IQR_value) | x > (Q3 + 1.5 * IQR_value), na.rm = TRUE))
  } else {
    return(NA)
  }
}

outliers <- startupdata %>%
  summarise_all(detect_outliers)

cat("\nOutliers per Numeric Column:\n")
print(outliers)

# 4. Check for Other Inconsistencies
cat("\nUnique Values in Categorical Columns:\n")
categorical_vars <- c("industry", "region", "profitability", "exit_status")

for (var in categorical_vars) {
  cat("\n", var, ":\n", sep = "")
  print(unique(startupdata[[var]]))
} 