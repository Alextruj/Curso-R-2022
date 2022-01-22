########### DATA FRAMES ################

### CREEMOS UN DATA FRAME
paises <- data.frame(Pais = c("Argentina", "Brasil", "Colombia", "Estados Unidos", "Guatemala", "Mexico"),
                     GDP_growth = c(-9.9, -4.1, -6.8, -3.4, NA, -8.2),
                     GDP = c(514.7, 1749.1, 299.8, 19247.1, 69.6, 1148.7),
                     Continent = c("SA", "SA", "SA", "NA", "CA", "NA"),
                     Inflation = c(36.1, 3.2, 1.6, 1.4, 4.8, 3.2),
                     Year = c(2020, 2020, 2020, 2020, 2020, 2020))

paises


### RESUMEN RAPIDO DEL DATA FRAME
summary(paises)


### NOMBRE DE LAS VARIABLES
colnames(paises)

colnames(paises) <- c("Pais", "Crecimiento_PIB", "PIB", "Continente", "Inflacion", "Año")
paises


### NOMBRE DE LAS OBSERVACIONES
rownames(paises)


### ACCEDER A LAS OBSERVACIONES
## A UNA VARIABLE
paises$Inflacion

paises[,4]

## A UNA FILA
paises[2,]

## A UNA OBSERVACION
paises[2,4]

## CON BASE EN UNA CARACTERISTICA
paises[paises$Continente == "NA",]


### AGREGAR VARIABLES
paises$Poblacion <- c(45.4, 212.6, 50.3, 329.5, 16.9, 128.9)

### ELIMINAR VARIABLES
paises$Crecimiento_PIB <- NULL



### EJERCICIOS ###
#Ejercicio: reemplaza el valor de crecimiento del PIB en Guatemala por -1.5


#Ejercicio: crea una nueva variable que indique el pib per capita de los paises


#Ejercicio: accede a observaciones de inflacion en paises con menos de 100m de habitantes

