############ MATRICES ##############

## SE CREAN CON LA FUNCION matrix()
X <- c(.45, .05, .01, .48, .70, .50, .07, .25, .49)

P <- matrix(X, nrow=3, ncol=3)
P


## DE NUEVO USAMOS LOS CORCHETES PARA ACCEDER A ELEMENTOS

#P[renglon, columna]
P[1,]

P[,2]

P[3,2]


## PODEMOS HACER OPERACIONES

#TRANSPONER
P
t(P)

#INVERSA
solve(P)

#SUMAR
P + P

#MULTIPLICAR
P2 <- matrix(c(55, 33, 19,
               93, 26, 44,
               76, 68, 46,
               88, 12, 65), nrow = 4, ncol = 3)

P%*%P2

P%*%t(P2)


### EJERCICIO ###
#Supón que tienes una variable dependiente Y = c(39,85,56,2,27,27,90,13,55,83,
#                                                23,35,38,73,66,44,3,34,59,68)
#Con dos variables explicativas X1 = c(52,24,57,54,100,22,59,61,7,10,
#                                      10,28,12,45,55,36,43,49,96,38)
#                               X2 = c(62,41,82,21,24,8,1,23,95,84,
#                                      63,18,45,9,63,12,30,51,9,75)

#Encuentra el valor de los coeficientes B1 y B2 de la regresion Y ~ c + X1 + X2
#TIP: B = (X'X)^-1 X'Y
#Ojo: No olvidar vector de intercepto 



#Para hacer el check:
lm(Y ~ X1 + X2)

