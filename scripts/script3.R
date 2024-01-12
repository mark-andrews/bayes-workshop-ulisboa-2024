library(brms)

source("https://raw.githubusercontent.com/mark-andrews/bayes-workshop-ulisboa-2024/main/data/dl_data.R")

# linear model: outcome = weight; predictors = height and age and gender
M1_f <- lm(weight ~ height + age + gender, data = weight_df)
summary(M1_f)

M1_b <- brm(weight ~ height + age + gender,
            cores = 4,
            iter = 10000,
            warmup = 1000,
            data = weight_df)

prior_summary(M1_b)


M2_b <- brm(weight ~ height + age + gender,
            cores = 4,
            prior = set_prior('normal(0, 10)', class = 'b', coef = 'height'),
            data = weight_df)

new_prior <- c(
  # prior for height coef
  set_prior('normal(0, 10)', class = 'b', coef = 'height'),
  # prior for age coef
  set_prior('normal(0, 100)', class = 'b', coef = 'age'),
  # prior for gender
  set_prior('normal(0, 100)', class = 'b', coef = 'gendermale'),
  # prior for intercept
  set_prior('student_t(1, 50, 50)', class = 'Intercept'),
  # prior for sigma
  set_prior('normal(0, 1000)', class = 'sigma')
)

M3_b <- brm(weight ~ height + age + gender,
            cores = 4,
            prior = new_prior,
            data = weight_df)

# Anova -------------------------------------------------------------------

M4_f <- aov(score ~ gender * education_level, data = jobsatisfaction)
summary(M4_f)


M4_f_additive <- lm(score ~ gender + education_level, data = jobsatisfaction)
M4_f_full <- lm(score ~ gender + education_level + gender:education_level, 
                data = jobsatisfaction)

anova(M4_f_additive, M4_f_full)
summary(M4_f_additive)$r.sq
summary(M4_f_full)$r.sq

logLik(M4_f_additive)
logLik(M4_f_full)

AIC(M4_f_additive) - AIC(M4_f_full)


# Bayesian way :)
M4_b_additive <- brm(score ~ gender + education_level, 
                     # save more info from sampler,
                     # for use in loo and bayes_factor etc
                     save_pars = save_pars(all = TRUE),
                     data = jobsatisfaction)

M4_b_full <- brm(score ~ gender + education_level + gender:education_level, 
                 save_pars = save_pars(all = TRUE),
                 data = jobsatisfaction)

waic(M4_b_additive, M4_b_full)
loo(M4_b_additive, M4_b_full)
loo(M4_b_additive, M4_b_full, moment_match = TRUE)

# log bayes factor model comparison 
bayes_factor(M4_b_additive, M4_b_full, log = T)

# interlude: nonnormal linear regression
m_normal <- brm(dist ~ speed, data = cars)
m_nonnormal <- brm(dist ~ speed, 
                   family = student(), 
                   data = cars)
