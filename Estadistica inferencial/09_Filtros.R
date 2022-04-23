########### Filtros ################
rm(list=ls(all=TRUE))
library(readxl)
library(ggplot2)
library(mFilter)

##### DIRECTORIO DE TRABAJO
setwd("C:/Users/K17095/Documents/Curso macro R")


##### CARGA LOS DATOS DEL IMAI
datos <- read_excel("Datos/Actividad Industrial.xlsx","IMAI")


##### DECLARANDO OBJETO DE SERIES DE TIEMPO
IMAI_ts <- ts(datos$IMAI, start = c(1993,1),
                end = c(2021,11), frequency = 12)



##### ALGUNOS FILTROS
par(mfrow = c(2,2))

## HP Filter (freq es el lambda)
filtro_hp <- hpfilter(IMAI_ts, freq = 129600)

plot(filtro_hp)


## Christiano-Fitzgerald
filtro_cf <- cffilter(IMAI_ts, pl = 2, pu = 96, root = TRUE)

plot(filtro_cf)


### La paquetería mFilter tiene algunos otros filtros ##


### Filtro especial: Hamilton 
library(dplyr)

fit <- lm(lead(IMAI,24) ~ IMAI + lag(IMAI,1) + lag(IMAI,2) +
            lag(IMAI,3) + lag(IMAI,4) + lag(IMAI,5) + lag(IMAI,6) +
            lag(IMAI,7) + lag(IMAI,8) + lag(IMAI,9) + lag(IMAI,10) +
            lag(IMAI,11), data = datos)

hamilton <- data.frame(Fecha = datos$Fecha,
                       Original = datos$IMAI,
                       Tendencia = c(rep(NA,35),fit[["fitted.values"]]))

hamilton$cyclical <- ((hamilton$Original/hamilton$Tendencia)-1)*100


#Plot
par(mfrow = c(2,1))

attach(hamilton)

Fecha <- seq(as.Date("1993-01-01"), by = "1 month", length = length(Fecha))

plot(x=Fecha, y=Original, type = "l", col = "blue", 
     main = "Hamilton Filter for IMAI", xlab = "", ylab = "")
points(x=Fecha, y=Tendencia, type = "l", col = "red")


plot(x=Fecha, y=cyclical, type = "l", col = "blue", 
     main = "Cyclical component (deviations from trend", xlab = "", ylab = "")
points(x=Fecha, y = rep(0,length(Fecha)), type = "l", col = "black")

dettach(hamilton)
