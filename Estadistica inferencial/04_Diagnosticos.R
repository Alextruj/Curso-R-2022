########### PRUEBAS DE DIAGNOSTICO ################
rm(list=ls(all=TRUE))

setwd("C:/Users/K17095/Documents/Curso macro R/Estadística inferencial")
library(olsrr)
library(car)


##### CORRAMOS EL CÓDIGO DE REGRESION LINEAL
source("03_1_Regresion_dinamica.R", encoding = "utf-8")


##### PLOT DE LA REGRESION
summary(fit_pib_1)

## 4 slots en ventana de plot
par(mfrow = c(2,2))

## Gráfica de un objeto lm
plot(fit_pib_1)
dev.off()


##### TESTS DE SUPUESTOS
## Residuos normales
hist(fit_pib[["residuals"]])
shapiro.test(fit_pib_1[["residuals"]])

## Heteroscedasticidad
ols_test_breusch_pagan(fit_pib_1)

## Multicolinearidad
ols_coll_diag(fit_pib_1)

## Autocorrelacion
#Ljung-Box
Box.test(fit_pib_1[["residuals"]], lag = 1, type = "Ljung-Box", fitdf = 0)
#Durbin Watson
durbinWatsonTest(fit_pib_1, 4)


##Podemos programar nuestra propia funcion
DW_function <- function(fit,lag){
  resid <- fit_pib_1[["residuals"]]
  DW <- sum((resid - lag(resid,lag))^2,na.rm=TRUE)/sum(resid^2,na.rm=TRUE)
  DW
}

DW_function(fit_pib_1,1)
DW_function(fit_pib_1,2)
DW_function(fit_pib_1,3)
DW_function(fit_pib_1,4)


##### MAS GRAFICAS
ols_plot_diagnostics(fit_pib_1)
