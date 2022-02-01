########### FUNCIONES PROPIAS ################

### EJEMPLO: FUNCION CELSIUS A FARENHEIT  

celsius_farenheit <- function(celsius){
  farenheit <- ((9/5)*celsius) + 32
  farenheit
}

#Vamos a probarla
x <- c(25, 26, 31, 26, 28, 25, 22)

celsius_farenheit(x)



### EJEMPLO: FUNCION DE REGRESION

regresion_lineal <- function(y,x){
  #Nos servirá saber cuántas observaciones tienen los datos
  n_datos <- length(y)
  #Creamos el vector de unos, nos ayuda tener n_datos
  constante <- rep(1,n_datos)
  #Creemos la nueva matriz. Notese que es suficiente con poner nrow
  X_c <- matrix(c(constante,x), nrow = n_datos)
  #Resolvemos la ecuacion
  coeficientes <- solve(t(X_c)%*%X_c) %*% (t(X_c)%*%y)
  #Valor (output):
  coeficientes
}

#Vamos a probarla
Y = c(39,85,56,2,27,27,90,13,55,83,23,35,38,73,66,44,3,34,59,68)

X1 = c(52,24,57,54,100,22,59,61,7,10,10,28,12,45,55,36,43,49,96,38)
X2 = c(62,41,82,21,24,8,1,23,95,84,63,18,45,9,63,12,30,51,9,75)

X <- matrix(c(X1,X2), ncol = 2, nrow = 20)

regresion_lineal(Y,X)

lm(Y~X1+X2)



### EJERCICIOS ###
# Crea una funcion que estandarice los datos
## i.e. tome un vector, le reste la media y lo divida por su desviacion estándar

