########### PRUEBAS DE DIAGNOSTICO ################
rm(list=ls(all=TRUE))
library(olsrr)
library(car)


##### CORRAMOS EL CÓDIGO DE REGRESION LINEAL
source("03_Regresion_lineal.R", encoding = "utf-8")


##### PLOT DE LA REGRESION

## 4 slots en ventana de plot
par(mfrow = c(2,2))

## Gráfica de un objeto lm
plot(fit_pib)
dev.off()


##### TESTS DE SUPUESTOS
## Residuos normales
hist(fit_pib[["residuals"]])
shapiro.test(fit_pib[["residuals"]])

## Heteroscedasticidad
ols_test_breusch_pagan(fit_pib)

## Multicolinearidad
ols_coll_diag(fit_pib)

## Autocorrelacion
#Ljung-Box
Box.test(fit_pib[["residuals"]], lag = 1, type = "Ljung-Box", fitdf = 0)
#Durbin Watson
durbinWatsonTest(fit_pib, 4)

DW_function <- function(fit,lag){
  resid <- fit_pib[["residuals"]]
  DW <- sum((resid - lag(resid,lag))^2,na.rm=TRUE)/sum(resid^2,na.rm=TRUE)
  DW
}

DW_function(fit_pib,4)

##### MAS GRAFICAS
ols_plot_diagnostics(fit_pib)
