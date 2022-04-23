########### SUBSET SELECTION ################
rm(list=ls(all=TRUE))
library(leaps)
library(dplyr)
library(readxl)

##### CAMBIA EL DIRECTORIO DE TRABAJO
setwd("C:/Users/K17095/Documents/Curso macro R")

##### CARGA LOS DATOS DE Indicadores mx.xlsx
source("Estadística Inferencial/03_Regresion_lineal.R", encoding = "utf-8")


##### CORRAMOS EL MODELO CON TODAS LAS VARIABLES

fit <- lm(PIB~.,data = tasa_anual)

summary(fit)


##### ENCONTREMOS EL MEJOR MODELO DE 10 VARIABLES
best_fit <- regsubsets(PIB ~ . -PIB,
                       data = tasa_anual,
                       nvmax = 10)

summary(best_fit)

##### PLOT 
plot(best_fit)

#Veamos los coeficientes del modelo de 4 variables
coef(best_fit, id = 4)


##### UN PLOT QUE ME GUSTA MAS
best_fit_sum <- summary(best_fit)

plot(best_fit_sum[["bic"]],
     ylab = "BIC", xlab = "N of variables",
     main = "Information Criterion of best models")

which.min(best_fit_sum[["bic"]])

#Rellenemos con un punto el minimo (5)
points(x = 5, y = best_fit_sum[["bic"]][5],
       pch=20,col="red")


##### PREDICT DEL MEJOR MODELO
fit <- 
