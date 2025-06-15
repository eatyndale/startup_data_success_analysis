# Feature Engineering Script

# Create success label for startups
startupdata <- startupdata %>%
  mutate(success = ifelse(exit_status %in% c("Acquired", "IPO"), 1, 0))

# Calculate success rates by industry
industry_success_rate <- startupdata %>%
  group_by(industry) %>%
  summarize(
    total_startups = n(),
    successful_startups = sum(success == "1", na.rm = TRUE),
    success_rate = round(100 * successful_startups / total_startups, 2)
  ) %>%
  arrange(desc(success_rate))

print("Success Rates by Industry:")
print(industry_success_rate)

# Calculate success rates by region
region_success_rate <- startupdata %>%
  group_by(region) %>%
  summarize(
    total_startups = n(),
    successful_startups = sum(success == "1", na.rm = TRUE),
    success_rate = round(100 * successful_startups / total_startups, 2)
  ) %>%
  arrange(desc(success_rate))

print("\nSuccess Rates by Region:")
print(region_success_rate) 