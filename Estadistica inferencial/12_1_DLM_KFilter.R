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
data <- read_xlsx("Datos/Actividad Industrial.xlsx", sheet = "IMAI")

##### TRANSFORMA LOS DATOS A TS
YT <- data$IMAI %>%
      na.exclude() %>% 
      ts(start = c(1993,1),end =c(2021,11),frequency = 12)

plot(YT)


##### DLM POLINOMIAL ORDER 1
#Guardemos variable de tiempo
index_time <- time(YT)

#Parametros del modelo (junto con prior)
model=dlmModPoly(order=1,dV=100,dW=.1,m0=70,C0=10)

#Kalman Filter
results_filtered_dlm=dlmFilter(YT,model)

#Kalman Smoother
results_smoothed_dlm=dlmSmooth(results_filtered_dlm)

plot(YT, ylab = "level", 
     main = "IMAI a.e.",
     type='l', xlab="time")
points(index_time,results_filtered_dlm$m[-1],col='red',type = "l")
points(index_time,results_smoothed_dlm$s[-1],col='blue',type = "l")
legend("topleft", legend=c("filtered", "smoothed"),
       col=c("red", "blue"), lty=1, cex = 1)

