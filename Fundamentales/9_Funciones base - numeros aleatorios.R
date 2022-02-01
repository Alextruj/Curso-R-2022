########### FUNCIONES BASE: NUMEROS ALEATORIOS ################

## SEMILLA PARA REPLICAR
set.seed(1234)

## NUMEROS ALEATORIOS
sample(x = 1:100, size = 10, replace = TRUE)


## DISTRIBUCIONES
###Uniforme
xuniforme <- runif(n = 10, min = 0, max = 1)
xuniforme


###Normal
xnormal <- rnorm(n = 1000, mean = 0, sd = 1)
xnormal


## ESTADISTICOS
#Media
mean(xnormal)

#Desviacion estándar
sd(xnormal)

#Maximo
max(xnormal)

#Minimo
min(xnormal)

#Cuantiles
quantile(xnormal, probs = c(0.25, 0.5, 0.5))


### EJERCICIOS ###
#Crea un vector que contenga las medias para una muestra normal 
#de tamaños: 1,10,100,1000, y 10000, grafica ese vector
#Tip: plot(vector, type = "l")
