########### Time Series ################
rm(list=ls(all=TRUE))
library(readxl)


##### DIRECTORIO DE TRABAJO
setwd("C:/Users/K17095/Documents/Curso macro R")


##### CARGA LOS DATOS DEL IMAI
datos <- read_excel("Datos/Actividad Industrial.xlsx","IMAI")


##### DECLARANDO OBJETO DE SERIES DE TIEMPO
datos$IMAI <- ts(datos$IMAI, start = c(1993,1),
                end = c(2021,11), frequency = 12)

class(datos$IMAI)


##### COMO SE VE
datos$IMAI

##### PLOT
plot(datos$IMAI)


##### UNA VENTANA
ip_2020 <- window(datos$IMAI, start = c(2020,1), end = c(2020, 12))

plot(ip_2020)


##### AGREGANDO 

ip_qty <- aggregate(datos$IMAI, nfrequency = 4, FUN = mean)

ip_qty

##### UN FILTRO SENCILLO (medias moviles)
filtered <- decompose(datos$IMAI)

plot(filtered)

