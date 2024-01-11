library(brms)

# load data
source("https://raw.githubusercontent.com/mark-andrews/bayes-workshop-ulisboa-2024/main/data/sim_data.R")

# freq model
M_lm <- lm(y ~ x_1 + x_2, data = data_df1)

# Bayes counterpart
M_bayes_lm <- brm(y ~ x_1 + x_2, data = data_df1)

plot(M_bayes_lm)

mcmc_plot(M_bayes_lm, type = 'hist')

mcmc_plot(M_bayes_lm, type = 'hist', variable = 'sigma')

mcmc_plot(M_bayes_lm, type = "areas")
mcmc_plot(M_bayes_lm, type = "areas_ridges")


# what are my priors!
prior_summary(M_bayes_lm)
