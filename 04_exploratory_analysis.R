# Exploratory Data Analysis Script

# Distribution plots for numeric variables
numeric_startupdata <- startupdata %>%
  select(where(is.numeric)) %>%
  names()

for (col in numeric_startupdata) {
  p <- ggplot(startupdata, aes(x = .data[[col]])) +
    geom_histogram(bins = 50, fill = "blue", color = "white", alpha = 0.7) +
    theme_minimal() +
    labs(title = paste("Distribution of", col), x = col, y = "Count")
  
  print(p)
}

# Bar plots for categorical variables
categorical_cols <- startupdata %>%
  select(where(is.character)) %>%
  select(-startup_name) %>%
  names()

for (col in categorical_cols) {
  q <- startupdata %>%
    count(.data[[col]]) %>%
    ggplot(aes(x = reorder(.data[[col]], n), y = n)) +
    geom_bar(stat = "identity", fill = "skyblue", color = "black") +
    coord_flip() +
    theme_minimal() +
    labs(title = paste("Count of", col), x = col, y = "Frequency")
  
  print(q)
}

# Correlation analysis
numeric_startupdata <- startupdata %>%
  select(where(is.numeric))

# Compute correlation matrix
cor_matrix <- cor(numeric_startupdata, use = "complete.obs")
print(cor_matrix)

# Plot correlation heatmap using corrplot
corrplot(cor_matrix, 
         method = "color",
         type = "upper",
         order = "hclust",
         tl.col = "black",
         tl.srt = 45,
         addCoef.col = "black",
         diag = FALSE,
         title = "Correlation Heatmap of Startup Dataset Variables",
         mar = c(0, 0, 1, 0))

# Alternative correlation heatmap using ggplot2
cor_data <- as.data.frame(cor_matrix) %>%
  rownames_to_column(var = "Var1") %>%
  pivot_longer(cols = -Var1, names_to = "Var2", values_to = "Correlation")

ggplot(cor_data, aes(x = Var1, y = Var2, fill = Correlation)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white",
                       midpoint = 0, limit = c(-1,1), space = "Lab",
                       name = "Correlation") +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) +
  coord_fixed() +
  labs(title = "Correlation Heatmap of Startup Dataset Variables",
       x = "", y = "") 