# Modeling Script

# Multiple Linear Regression
linear_model <- lm(revenue_m_usd ~ valuation_m_usd + funding_amount_m_usd + market_share + employees, 
                  data = startupdata)

print("Multiple Linear Regression Results:")
print(summary(linear_model))

# Logistic Regression for Profitability
logistic_model_profitable <- glm(profitable ~ valuation_m_usd + funding_amount_m_usd + 
                                revenue_m_usd + funding_rounds + year_founded + 
                                market_share + employees,
                                data = startupdata, 
                                family = "binomial")

print("\nLogistic Regression Results (Profitability):")
print(summary(logistic_model_profitable))

# Logistic Regression for Success
logistic_model_success <- glm(success ~ valuation_m_usd + funding_amount_m_usd + 
                             revenue_m_usd + funding_rounds + year_founded + 
                             market_share + employees,
                             data = startupdata, 
                             family = "binomial")

print("\nLogistic Regression Results (Success):")
print(summary(logistic_model_success)) 