########### SEASONAL ################
rm(list=ls(all=TRUE))
library(seasonal)
library(dplyr)
library(readxl)
library(dlm)
library(fanplot)

##### CAMBIA EL DIRECTORIO DE TRABAJO
setwd("C:/Users/K17095/Documents/Curso macro R")


##### CARGA LOS DATOS DE PIB_o_sa
PIB <- read_xlsx("Datos/PIB_o_sa.xlsx")

##### TRANSFORMA LOS DATOS A TASA ANUAL (y a ts)
var_anual <- function(x){
  ta <- (x-lag(x,4))/lag(x,4)*100
}

TASO <- var_anual(PIB$Original) %>% 
  na.exclude() %>% 
  ts(start = c(2006,1),end =c(2021,4),frequency = 4)

plot(TASO)


##### DLM POLINOMIAL ORDER 2
#Guardemos variable de tiempo
index_time <- time(TASO)

#Parametros del modelo (junto con prior)
model=dlmModPoly(order=2)

#Comprobemos los parametros default
FF(model)
GG(model)
V(model)
W(model)
m0(model) <- c(5,0)
C0(model) <- matrix(c(10,0,0,10), ncol = 2)

#Kalman Filter
results_filtered_dlm=dlmFilter(TASO,model)

#Kalman Smoother
results_smoothed_dlm=dlmSmooth(results_filtered_dlm)

plot(TASO, ylab = "level", 
     main = "PIB (variacion anual)",
     type='l', xlab="time")
points(index_time,results_filtered_dlm$m[-1,1],col='red',type = "l")
points(index_time,results_smoothed_dlm$s[-1,1],col='blue',type = "l")
legend("bottomleft", legend=c("filtered", "smoothed"),
       col=c("red", "blue"), lty=1, cex = 1)

#Pronosticos
fore <- dlmForecast(model, nAhead=8, sampleNew = 100)

sample <- unlist(fore$newObs) %>% matrix(nrow = 8, 100)
sample

dist_fore <- apply(sample, 1, quantile, 1:19/20)

plot(TASO, xlim = c(2006,2023),
     main = "Pronósticos para el PIB (8 trimestres adelante)")
rect(xleft = 2021.75, xright = 2023.6, ybottom = -17.7, ytop = 19.2, 
     border = "gray95", col = "gray95")

fan(data = dist_fore, start = c(2022),frequency = 4,
    probs = 1:19/20,
    fan.col = colorRampPalette(c("tomato", "gray95")),
    anchor = last(TASO),
    ln = NULL, rlab = NULL)



