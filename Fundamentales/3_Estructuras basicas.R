############ ESTRUCTURA BÁSICA DE DATOS ##############

##VECTORES
xvecn <- c(3,5,10,1)

xvecc <- c("Maria", "Juan", "Jesus", "Victoria")


##MATRICES
xmat <- matrix(data = c(1,2,3,4, 11,12,13,14), nrow = 2, ncol = 4)

xmat


##DATA FRAMES
xdata <- data.frame("Nombre" = xvecc,
                    "Edad" = xvecn)



##LISTA
xlist <- list(xvecn, xvecc, xmat, xdata)


### EJERCICIOS ###

#Verifica que la clase de los vectores "xvecn" y "xvecc" sean numeric y character

#Crea un vector que combine elementos de clase numeric, character y logical, verifica la clase



