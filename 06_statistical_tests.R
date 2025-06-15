# Statistical Tests Script

# T-test: Revenue by Profitability
t_test_result <- t.test(revenue_m_usd ~ profitable, data = startupdata)
print("T-test: Revenue by Profitability")
print(t_test_result)

# T-test: Funding Round by Profitability
t_test_result_funding_round <- t.test(funding_rounds ~ profitable, data = startupdata)
print("\nT-test: Funding Round by Profitability")
print(t_test_result_funding_round)

# One-way ANOVA: Funding Amount by Industry
anova_result_industry <- aov(funding_amount_m_usd ~ industry, data = startupdata)
print("\nANOVA: Funding Amount by Industry")
print(summary(anova_result_industry))

# One-way ANOVA: Funding Amount by region
anova_result_region <- aov(funding_amount_m_usd ~ region, data = startupdata)
print("\nANOVA: Funding Amount by Region")
print(summary(anova_result_region))

# Chi-Square Tests
# Profitable by Industry
chisq_industry <- table(startupdata$industry, startupdata$profitable)
print("\nChi-Square: Profitable by Industry")
print(chisq.test(chisq_industry))

# Profitable by Region
chisq_region <- table(startupdata$region, startupdata$profitable)
print("\nChi-Square: Profitable by Region")
print(chisq.test(chisq_region))

# Success by Industry
chisq_industry_exit <- table(startupdata$industry, startupdata$success)
print("\nChi-Square: Success by Industry")
print(chisq.test(chisq_industry_exit))

# Success by Region
chisq_region_exit <- table(startupdata$region, startupdata$success)
print("\nChi-Square: Success by Region")
print(chisq.test(chisq_region_exit))

# Profitable Vs Success
chisq_profit_success <- table(startupdata$profitable, startupdata$success)
print("\nChi-Square: Profitable vs Success")
print(chisq.test(chisq_profit_success)) 