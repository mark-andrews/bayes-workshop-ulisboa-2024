library(priorexposure)
 
n <- 250 # number of coin flips
m <- 139 # number of heads

# the bernoulli likelihood function
bernoulli_likelihood(n, m)


# different priors over parameter space
# each one is a beta distribution
beta_plot(alpha = 2, beta = 3)
beta_plot(alpha = 5, beta = 2)
beta_plot(alpha = 1, beta = 1)
beta_plot(alpha = 0.5,beta = 0.5)

# posterior distribution when using beta(2, 3) prior
beta_plot(m +2, n - m + 3)
bernoulli_posterior_plot(n, m, 2, 3)

# reduce data by factor of 10 approximately
n_prime <- 25
m_prime <- 14

bernoulli_likelihood(n_prime, m_prime)

# posterior distribution with beta(2, 3) prior
bernoulli_posterior_plot(n_prime, m_prime, 2, 3)
# with beta(5, 2) prior
bernoulli_posterior_plot(n_prime, m_prime, 5, 2)

# posterior distribution using original data
# and beta(2, 3) or beta(5, 2)
bernoulli_posterior_plot(n, m, 2, 3)
bernoulli_posterior_plot(n, m, 5, 2)

bernoulli_posterior_summary(n, m, 2, 3)
bernoulli_posterior_summary(n, m, 5, 2)

get_beta_hpd(m + 5, n - m + 2) # high posterior density interval 


# samples from normal dist with mean 50 and sd 10
x <- rnorm(10000, mean = 50, sd = 10)

# what proportion are below 75
mean(x <= 75)
