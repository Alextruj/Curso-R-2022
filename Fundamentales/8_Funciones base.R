########### FUNCIONES BASE ################

### DIRECTORIO DE TRABAJO
## CONSULTAR
getwd()
## ESTABLECER
setwd("C:/Users/K17095/Documents/Curso macro R/Fundamentales")

### BORRAR ENVIRONMENT
rm(list=ls(all=TRUE))


### AYUDA DE FUNCIONES
help(mean)
?mean


### FUNCIONES MUY UTILES:
## IMPRIMIR
print("Hola mundo")

## CONCATENAR
x <- paste("Hola", 2, sep = " ")

## REPETIR
rep("Hola", 4)

## WHICH TRUE
x <- c(0,3,2,9,7)

which(x == 2)
which.min(x)
which.max(x)
