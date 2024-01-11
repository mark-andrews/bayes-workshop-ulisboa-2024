library(brms)

# load data
source("https://raw.githubusercontent.com/mark-andrews/bayes-workshop-ulisboa-2024/main/data/sim_data.R")

# freq model
M_lm <- lm(y ~ x_1 + x_2, data = data_df1)

# Bayes counterpart
M_bayes_lm <- brm(y ~ x_1 + x_2, data = data_df1)
