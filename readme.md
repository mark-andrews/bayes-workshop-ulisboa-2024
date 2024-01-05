# Introduction to Bayesian Data Analysis with R

Bayesian methods are now increasingly widely in data analysis across most
scientific research fields.  Given that Bayesian methods differ conceptually
and theoretically from their classical statistical counterparts that are
traditionally taught in statistics courses, many researchers do not have
opportunities to learn the fundamentals of Bayesian methods, which makes using
Bayesian data analysis in practice more challenging.  The aim of this course is
to provide a solid introduction to Bayesian methods, both theoretically and
practically.  We will begin by teaching the fundamental concepts of Bayesian
inference and Bayesian modelling, including how Bayesian methods differ from
their classical statistics counterparts, and show how to do Bayesian data
analysis in practice in R.  We then provide a solid introduction to Bayesian
approaches to these topics using R and the `brms` package.  We begin by
covering Bayesian approaches to linear regression.  We will then proceed to
Bayesian approaches to generalized linear models, including binary logistic
regression, ordinal logistic regression, Poisson regression, zero-inflated
models, etc.  Finally, we will cover Bayesian approaches to multilevel and
mixed effects models.  Throughout this course, we will be using, via the brms
package, Stan based Markov Chain Monte Carlo (MCMC) methods.

## Software

Instructions on how to install the necessary software are [here](software.md).


# Course programme

## Day 1

* Topic 1: We will begin with a overview of what Bayesian data analysis is in essence and how it fits into statistics as it practiced generally. Our main point here will be that Bayesian data analysis is effectively an alternative school of statistics to the traditional approach, which is referred to variously as the *classical*, or *sampling theory based*, or *frequentist* based approach, rather than being a specialized or advanced statistics topic. However, there is no real necessity to see these two general approaches as being mutually exclusive and in direct competition, and a pragmatic blend of both approaches is entirely possible.

* Topic 2: Introducing Bayes' rule. Bayes' rule can be described as a means to calculate the probability of causes from some known effects. As such, it can be used as a means for performing statistical inference. In this section of the course, we will work through some simple and intuitive calculations using Bayes' rule. Ultimately, all of Bayesian data analysis is based on an application of these methods to more complex statistical models, and so understanding these simple cases of the application of Bayes' rule can help provide a foundation for the more complex cases.

* Topic 3: Bayesian inference in a simple statistical model. In this section, we will work through a classic statistical inference problem, namely inferring the bias on a coin after observing the a certain number of heads and tails from flips of that coin, or equivalent problems. This problem is easy to analyse completely with just the use of R, but yet allows us to delve into all the key concepts of all Bayesian statistics including the likelihood function, prior distributions, posterior distributions, maximum a posteriori estimation, high posterior density intervals, posterior predictive intervals, marginal likelihoods, Bayes factors, model evaluation of out-of-sample generalization.


## Day 2


* Topic 4: The previous sections provide a so-called analytical approach to Bayesian models. This is where we can calculate desired quantities and distributions by way of simple formulae. However, analytical approaches to Bayesian analyses are only possible in a relatively restricted set of cases. On the other hand, numerical methods, specifically Markov Chain Monte Carlo (MCMC) methods can be applied to virtually any Bayesian model. In this section, we will re-perform the analysis presented in the previous section but using MCMC methods. For this, we will use the *brms* package in R that provides an exceptionally easy to use interface to Stan.

* Topic 5: Bayesian linear models. We begin by covering Bayesian linear regression. For this, we will use the `brm` command from the `brms` package, and we will compare and contrast the results with the standard `lm` command.
By comparing and contrasting `brm` with `lm` we will see all the major similarities and differences between the Bayesian and classical approach to linear regression.
We will, for example, see how Bayesian inference and model comparison works in practice and how it differs conceptually and practically from inference and model comparison in classical regression.
As part of this coverage of linear models, we will also use categorical predictor variables and explore varying intercept and varying slope linear models.

## Day 3

* Topic 6: Extending Bayesian linear models. Classical normal linear models are based on strong assumptions that do not always hold in practice.
For example, they assume a normal distribution of the residuals, and assume homogeneity of variance of this distribution across all values of the predictors.
In Bayesian models, these assumptions are easily relaxed.
For example, we will see how we can easily replace the normal distribution of the residuals with a t-distribution, which will allow for a regression model that is robust to outliers.
Likewise, we can model the variance of the residuals as being dependent on values of predictor variables.

* Topic 7: Bayesian generalized linear models. Generalized linear models include models such as logistic regression, including multinomial and ordinal logistic regression, Poisson regression, negative binomial regression, zero-inflated models, and other models. Again, for these analyses we will use the `brms` package and explore this wide range of models using real world data-sets. In our coverage of this topic, we will see how powerful Bayesian methods are, allowing us to easily extend our models in different ways in order to handle a variety of problems and to use assumptions that are most appropriate for the data being modelled.

* Topic 10: Multilevel and mixed models. In this section, we will cover the multilevel and mixed effects variants of the regression models, i.e. linear, logistic, Poisson etc, that we have covered so far. In general, multilevel and mixed effects models arise whenever data are correlated due to membership of a group (or group of groups, and so on).
For this, we use a wide range of real-world data-sets and problems, and move between linear, logistic, etc., models are we explore these analyses. We will pay particular attention to considering when and how to use varying slope and varying intercept models, and how to choose between maximal and minimal models. We will also see how Bayesian approaches to multilevel and mixed effects models can overcome some of the technical problems (e.g. lack of model convergence) that beset classical approaches.
