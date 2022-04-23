########### REGRESION LINEAL ################
library(readxl)
library(dplyr)

##### CAMBIA EL DIRECTORIO DE TRABAJO
setwd("C:/Users/K17095/Documents/Curso macro R/Datos")

##### CARGA LOS DATOS DE Indicadores mx.xlsx
datos <- read_xlsx("Indicadores mx.xlsx")


##### TRANSFORMA LOS DATOS A TASA ANUAL
var_anual <- function(x){
  ta <- (x-lag(x,4))/lag(x,4)*100
}

tasa_anual <- 


##### CORRAMOS LA REGRESION VS USGDP

fit_pib_us <- lm(PIB ~ USGDP, data = tasa_anual)

summary(fit_pib_us)



##### CORRAMOS LA REGRESION VS TODAS LAS VARIABLES

fit_pib <- lm(PIB ~ . , data = tasa_anual)
summary(fit_pib)


##### INTERVALOS DE CONFIANZA DE LA REGRESION
confint(fit_pib)


##### VEAMOS LOS RESIDUALES
fit_pib[["residuals"]] %>% plot(type = "l")


##### PREDICCION
predict(fit_pib, newdata = tasa_anual[116,])


#### EXPORTAR 
library(stargazer)
stargazer(fit_pib,type="html",out="reg_pib.html")
stargazer(fit_pib,type="latex")


##### EJERCICIOS #####

#Ejercicio: El dato oficial del PIB en 2021-IV fue de 1.1%. Encuentra una 
## especificación que tenga mejor fit 


#Ejercicio: Estima la regresión hasta el primer trimestre de 2020


#Ejercicio: Corre una regresión del PIB contra sus cuatro primeros rezagos

