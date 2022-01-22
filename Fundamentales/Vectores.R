############ VECTORES ##############

## SE CREAN CON LA FUNCIÓN c()
x <- c(2.6, 1.7, 0.8, 0.1, 3.1, 1.5)


y <- c(1,2,3,4)


z <- c(y,x)
z


N <- c(NA,NA,NA,NA)


## TAMBIÉN SE PUEDEN CREAR COMO UNA SECUENCIA
xseq1 <- 1:10

xseq2 <- seq(from = 0, to = 9, by = 1)



## ACCEDEMOS A LOS ELEMENTOS ESPECIFICOS CON CORCHETES
#UN SOLO ELEMENTO
z[1]

z[1] <- 3

#VARIOS ELEMENTOS
s <- z[1:3]
s

m <- z[c(1,3,10)]
m

#EXCLUYENDO
z[-4]


## SON LA UNIDAD PRINCIPAL DE R. 
#CUALQUIER OPERACION SE PUEDE HACER SOBRE EL VECTOR Y SE HARÄ EN ORDEN

xlog <- xseq1 >= xseq2
xlog

xdiv <- xseq1 / xseq2 * 2
xdiv



### DOS PROPIEDADES
#Clase
class(xlog)

#Tamaño
length(xlog)



### EJERCICIOS ###

# Crea un vector de fechas de enero 2000 a febrero 2022
#Tip seq(by = "1 month")


# Calcula la varianza del vector x

