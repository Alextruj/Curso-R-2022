########### SEASONAL ################
rm(list=ls(all=TRUE))
library(seasonal)
library(dplyr)
library(readxl)
library(forecast)

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

#Transformemos a TS
TASO <- PIB$TAso %>% ts(start = c(2006,1), frequency = 4)

plot(TASO)


#### Auto arima
best <- auto.arima(TASO)

summary(best)

## Forecast
plot(forecast(best, 8), showgap = FALSE,
     shaded = TRUE)

#Guardemos los datos del forecast
for_PIB <- forecast(best, h=8, level = 1:9/10)
for_PIB

#Importante el orden
for_mat <- cbind(for_PIB[["lower"]][,9],
                 for_PIB[["lower"]][,8],
                 for_PIB[["lower"]][,7],
                 for_PIB[["lower"]][,6],
                 for_PIB[["lower"]][,5],
                 for_PIB[["lower"]][,4],
                 for_PIB[["lower"]][,3],
                 for_PIB[["lower"]][,2],
                 for_PIB[["lower"]][,1],
                 for_PIB[["upper"]])
for_mat <- t(for_mat)


## Fanplot
library(fanplot)

plot(TASO, xlim = c(2006,2024))

fan(data = for_mat, start = c(2022,1),frequency = 4,
    probs = 1:19/20,
    fan.col = colorRampPalette(c("tomato", "gray95")))


#Mas elementos
plot(TASO, xlim = c(2006,2023),
     main = "Pronósticos para el PIB (8 trimestres adelante)")
rect(xleft = 2021.75, xright = 2023.6, ybottom = -17.7, ytop = 19.2, 
     border = "gray95", col = "gray95")

fan(data = for_mat, start = c(2022),frequency = 4,
    probs = 1:19/20,
    fan.col = colorRampPalette(c("tomato", "gray95")),
    anchor = last(TASO),
    ln = NULL, rlab = NULL)

abline(v = 2022.74, lty = 2)
text(x = 2022.25,y = -15, "2022", cex=0.8)
text(x = 2023.25,y = -15, "2023", cex=0.8)
