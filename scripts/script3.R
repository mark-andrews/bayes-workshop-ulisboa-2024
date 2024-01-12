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
