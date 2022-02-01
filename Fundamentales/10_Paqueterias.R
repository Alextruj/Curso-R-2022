############ PAQUETERIAS ##############
#Usaremos de ejemplo las paqueterías MASS y dplyr

## INSTALAR UNA PAQUETERÍA
install.packages("MASS")
install.packages("dplyr")


## CARGAR LA PAQUETERÍA A LA SESIÓN
library(MASS)
library(dplyr)


## LLAMAR A ALGUNA FUNCION
x <- sample(x = 1:100, size = 10)

x.l1 <- lag(x, n = 1)

x_l1 <- dplyr::lag(x, n = 1)


## ALGUNAS PAQUETERIAS TRAEN BASES DE DATOS PARA HACER PRUEBAS
data("forbes")
forbes
