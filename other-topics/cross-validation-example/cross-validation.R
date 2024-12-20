# * Akaike Information Criterion (AIC) that is used by frequentists. 
# * Intended to estimate the expected log predictive density (ELPD) for a new dataset. 
# * However, the AIC ignores priors and assumes that the posterior distribution is multivariate normal,
# * Functions from the loo package (LOOIC, WAIC) do not make this distributional assumption and integrate over uncertainty in the parameters. 
# * This only assumes that any one observation can be omitted without having a major effect on the
# posterior distribution, which can be judged using the diagnostic plot provided
# by the plot.loo method and the warnings provided by the print.loo method 

# https://arxiv.org/pdf/1507.04544

library(loo)

pois_cv <- cmdstan_model("other-topics/cross-validation-example/multiple_poisson_regression_cv.stan")
nb_cv <- cmdstan_model("other-topics/cross-validation-example/multiple_NB_regression_cv.stan")

# run them using the data list from our markdown file 
fit_pois_cv <- pois_cv$sample(data = standata_simple)
fit_nb_cv <- nb_cv$sample(data = standata_simple)

# model with highest ELPD (~ expected predictive performance) is negative binomial
loo_pois <- loo(fit_pois_cv$draws("log_lik"), cores = 8)
loo_nb <- loo(fit_nb_cv$draws("log_lik"), cores = 8)
loo_compare(list("Poisson" = loo_pois, "NB" = loo_nb))

# model weights
loo_model_weights(list("Poisson" = loo_pois, "NB" = loo_nb))

# or use WAIC 
waic_pois <- waic(fit_pois_cv$draws("log_lik"))
waic_nb <- waic(fit_nb_cv$draws("log_lik"))
loo_compare(waic_pois, waic_nb)


