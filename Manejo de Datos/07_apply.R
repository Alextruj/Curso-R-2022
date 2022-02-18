########### APPLY ################
#Creemos un data frame aleatorio
rand_data <- data.frame(V0 = rnorm(100, mean = 0, sd = 1),
                        V1 = rnorm(100, mean = 1, sd = 1.2),
                        V2 = rnorm(100, mean = 3, sd = 0.8),
                        V3 = rnorm(100, mean = 0.5, sd = 0.2))


### OBTENGAMOS LA MEDIA DE CADA VARIABLE
summary(rand_data)


### TAMBIEN PODEMOS HACERLO CON UN LOOP
for(i in 1:4){
  print(mean(rand_data[,i]))
}


### PROGRAMACION FUNCIONAL: APPLY
apply(rand_data, 2, mean)



### EJERCICIOS ###
#Crea una funcion que calcule la tasa de variacion de los elementos de un vector
##tip: dplyr::lag(x, n = 1)



#Importa la base de datos "PIB por paises.xlsx", guarda un nuevo data frame
## que tenga las tasas de crecimiento anual de cada país

