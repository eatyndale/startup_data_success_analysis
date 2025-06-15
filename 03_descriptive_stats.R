# Descriptive Statistics Script

# Startup Information By Region
startupdata_region <- startupdata %>%
  group_by(region) %>%
  summarize(Count = n(),
            Average_Revenue = round(mean(revenue_m_usd)),
            Median_Revenue = round(median(revenue_m_usd)),
            Min_Revenue = min(revenue_m_usd),
            Max_Price = max(revenue_m_usd)) %>%
  arrange(desc(Count))
print(startupdata_region)

# Startup Information By Industry
startupdata_industry <- startupdata %>%
  group_by(industry) %>%
  summarize(Count = n(),
            Average_Revenue = round(mean(revenue_m_usd)),
            Median_Revenue = round(median(revenue_m_usd)),
            Min_Revenue = min(revenue_m_usd),
            Max_Price = max(revenue_m_usd),
            Std_Dev_Revenue = round(sd(revenue_m_usd, na.rm = TRUE), 2),
            IQR_Revenue = round(IQR(revenue_m_usd, na.rm = TRUE), 2)) %>%
  arrange(desc(Count))
print(startupdata_industry)

# Startup Information By Profitability
startupdata_profitability <- startupdata %>%
  group_by(profitable) %>%
  summarize(Count = n(),
            Average_Revenue = round(mean(revenue_m_usd)),
            Median_Revenue = round(median(revenue_m_usd)),
            Min_Revenue = min(revenue_m_usd),
            Max_Price = max(revenue_m_usd)) %>%
  arrange(desc(Count))
print(startupdata_profitability) 