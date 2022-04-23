########### SEASONAL ################
rm(list=ls(all=TRUE))
library(seasonal)
library(dplyr)
library(readxl)

##### CAMBIA EL DIRECTORIO DE TRABAJO
setwd("C:/Users/K17095/Documents/Curso macro R")


##### CARGA LOS DATOS DE PIB_o_sa
PIB <- read_xlsx("Datos/PIB_o_sa.xlsx")

##### TASA ANUAL
var_pct <- function(x,n){
  ta <- ((x/lag(x,n))-1)*100
  ta
}

PIB$TAso <- var_pct(PIB$Original,4)

#Quitemos los NA
PIB <- PIB %>% na.exclude()

##### ACF / PACF
par(mfrow = c(2,1))

acf(PIB$TAso, lag.max = 12)
pacf(PIB$TAso, lag.max = 12)



##### AR
plot(PIB$Original, type = "l", main = "PIB Original")
plot(PIB$TAso, type = "l", main = "Variacion anual % PIB")

## Naive
ar_naive <- lm(TAso ~ lag(TAso,1) + lag(TAso,2) +
               lag(TAso,3) + lag(TAso,4) + lag(TAso,5), data = PIB)

summary(ar_naive)

acf(ar_naive$residuals)
pacf(ar_naive$residuals)

## AR Funcion (Encuentra el mejor modelo)
ar_func <- ar(PIB$TAso, aic = TRUE, order.max = 10,
              method = "ols")

ar_func



#### Arima
library(forecast)
arima <- Arima(y = PIB$TAso, order = c(5,0,0), include.mean = T, method="CSS")

summary(arima)

## Replicando Arima de Eviews
arima <- Arima(y = PIB$TAso, order = c(5,0,0), include.mean = T, 
               method="CSS-ML")
arima

##Plot de residuales
checkresiduals(arima)

##forecast
dev.off()
plot(forecast(arima))


#### Auto arima
best <- auto.arima(PIB$TAso)

summary(best)

## Diagnosticos
autoplot(best)

checkresiduals(best)

fitted <- fitted(best)

plot(PIB$TAso, type = "l", col = "black", ylim =c(-40,40))
points(fitted, type = "l", col = "red")


## Forecast
plot(forecast(best, 8), showgap = FALSE,
     shaded = FALSE, pi.col = "red")
