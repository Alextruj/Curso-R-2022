########## DYNAMIC FACTOR MODEL ###############

##### USAREMOS LA PAQUETERIA BDFM (Bayesian Dynamic Factor Models)
#install.packages("remotes")
#remotes::install_github("srlanalytics/BDFM")
library(bdfm)


##### CARGUEMOS LOS DATOS
source("C:/Users/K17095/Documents/Curso macro R/Estadística inferencial/Chile Nowcast Imacec.R")

### KEEP
library(gdata)
keep(datos_sa_mm, datos_sa, datos_pca,var_mm, sure = TRUE)

datos_sa_mm <- apply(datos_sa, 2, var_mm) %>% 
  na.exclude() %>%
  ts(start = c(2009,1), frequency = 12)

############## 4 FORMAS DE RESOLVER EL DFM


############## BAYESIANO - PRIORS NO INFORMATIVOS
set.seed(123)
dfm_bay_noprior <- bdfm::dfm(datos_sa_mm)

dfm_bay_noprior

## Factores
factors(dfm_bay_noprior)
plot(factors(dfm_bay_noprior))
#Comparacion con IMACEC
points(datos_sa_mm[,1]*100, type = "l", col = "red")

## Cuanto aporta cada variable al factor
summary(dfm_bay_noprior)



############## BAYESIANO - PRIORS INFORMATIVOS
set.seed(123)
dfm_bay_prior <- bdfm::dfm(datos_sa_mm, obs_df = c("imce_industria_sa" = 2))

## Cuanto aporta cada variable al factor
summary(dfm_bay_prior)



############## MAXIMUM LIKELIHOOD
dfm_ml <- bdfm::dfm(datos_sa_mm, method = "ml")

summary(dfm_ml)


############# 2 STEP ESTIMATION
dfm_2s <- bdfm::dfm(datos_sa_mm, method = "pc")

summary(dfm_2s)





#### COMPAREMOS EL FACTOR
par(mfrow = c(4,1))
plot(factors(dfm_bay_noprior), main = "Bayesian - Prior no informativo")
plot(factors(dfm_bay_prior), main = "Bayesian - Prior informativo")
plot(factors(dfm_ml), main = "Bayesian - Maximum Likelihood")
plot(factors(dfm_2s), main = "Bayesian - 2 Steps")


methods_imacec <- data.frame(IMACEC = datos_sa_mm[,1],
                             BAY_NOPRIOR = factors(dfm_bay_noprior),
                             BAY_PRIOR = factors(dfm_bay_prior),
                             ML = factors(dfm_ml),
                             TwoSteps = factors(dfm_2s))


chart.Correlation(methods_imacec)
