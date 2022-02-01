########### LOOPS ################

### FOR LOOP
#Ejemplo 1:
for(i in 1:10){
  print(i)
}


#Ejemplo 2: imprimamos la inflacion de cada pais en 2020
paises <- data.frame(Pais = c("Argentina", "Brasil", "Colombia", "Estados Unidos", "Guatemala", "Mexico"),
                     GDP_growth = c(-9.9, -4.1, -6.8, -3.4, NA, -8.2),
                     GDP = c(514.7, 1749.1, 299.8, 19247.1, 69.6, 1148.7),
                     Continent = c("SA", "SA", "SA", "NA", "CA", "NA"),
                     Inflation = c(36.1, 3.2, 1.6, 1.4, 4.8, 3.2),
                     Year = c(2020, 2020, 2020, 2020, 2020, 2020))

for (i in 1:6){
  print(paste("La inflación en", paises[i,1], "en el año", paises[i,6],
              "fue de", paises[i,5]))
}



## WHILE LOOP
#Ejemplo 1:
i <- 1
while(i <= 10){
  print(i)
  i <- i+1
}


#Ejemplo 2: verifiquemos la covergencia de una serie telescópica
#algunos valores iniciales:
dif <- 1
n <- 1
serie <- 0

#Ahora el loop se detendrá cuando la diferencia entre 
#el valor de convergencia y el de la serie sea muy pequeño

while (dif > 0.0000001){
  serie <- serie + 1/(n*(n+1))
  n <- n+1
  
  #En teoría, la serie armónica converge a 1
  dif <- 1 - serie
}


### EJERCICIOS ###

# Ejercicio: replica la serie telescópica, ahora con un for loop

# Ejercicio: crea una funcion que convierta de celsuis a farenheit
# o de farenheit a celsius, dependiendo de un argumento is.celsius = TRUE/FALSE

celsius_farenheit <- function(x, is.celsius){
  
}

# Ejercicio: crea un vector con 100 medias de una distribución normal de tamaño
#{1,2,...,100}
