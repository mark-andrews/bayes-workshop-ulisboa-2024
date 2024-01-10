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
