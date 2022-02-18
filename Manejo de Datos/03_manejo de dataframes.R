########### MANEJO DE DATA FRAMES ################
library(readxl)
library(dplyr)

#Cambio de directorio de trabajo
setwd("C:/Users/K17095/Documents/Curso macro R/Datos")


### IMPORTAR LOS DATOS
ipus <- read_excel("Actividad Industrial.xlsx", sheet = 1)
imai <- read_excel("Actividad Industrial.xlsx", sheet = 2)
ipim <- read_excel("Actividad Industrial.xlsx", sheet = 3)


#El objetivo de este script será graficar las series de actividad industrial
#de Estados Unidos, Mexico, y Argentina


### ELIMINAR VARIABLES
imai$Fecha <- NULL

### SUBSET DE VARIABLES
ipus <- select(ipus, date, value)

### AGREGAR VARIABLES
imai$date <- seq(from = as.Date("1993-01-01"),
                 to = as.Date("2021-11-01"),
                 by = "1 month")

### AGREGAR VARIABLES (CON BASE EN OTRA)
ipim <- ipim %>% mutate(IPIM_100 = IPIM-34)

### AGREGAR FILAS
#Para graficar a diciembre hay que agregar NA's al ipim e imai
dic_ipim <- data.frame(IPIM = NA, IPIM_100 = NA, Mes = as.Date("2021-12-01"))

ipim <- rbind(ipim, dic_ipim)


### JOINS
#full_join
dataset <- full_join(ipus, imai, by = "date")

#Left (o right) join
dataset1 <- left_join(dataset, ipim, by = c("date" = "Mes"))

#Antijoin (no nos sirve para este caso pero es util en otros)
data_antijoin <- anti_join(dataset, ipim, by = c("date" = "Mes"))



### PLOT
dataset1
colnames(dataset1) <- c("date", "IPUS", "IMAI", "IPIM", "IPIM_100")

plot(x = dataset1$date, y = dataset1$IPUS, type = "l",
     col = "red", ylim = c(60, 140), main = "Indice de Produccion Industrial")
points(x = dataset1$date, y = dataset1$IMAI, type = "l", col = "darkgreen")
points(x = dataset1$date, y = dataset1$IPIM_100, type = "l", col = "blue")

legend("topleft", legend = c("Argentina", "Estados Unidos", "Mexico"),
       col = c("blue", "red", "darkgreen"), pch=1)



#### EJERCICIOS ###
#Arregla la serie de IPIM para que sea comparable en la grafica

#Pregunta: ¿qué país tuvo una mayor tasa mensual a.e. negativa en abril 2020?
