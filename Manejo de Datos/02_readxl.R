########### READ_EXCEL() ################

#Cambio de directorio de trabajo
setwd("C:/Users/K17095/Documents/Curso macro R/Datos")

### IMPORTAR LOS DATOS
library(readxl)
enc_inflacion <- read_excel("Inflacion_ee_mx.xlsx")


### IMPORTAR DATOS CON RANGO
enc_inflacion <- read_excel("Inflacion_ee_mx.xlsx", sheet = "Hoja1", 
                            range = "A18:I163")

enc_inflacion


### CHECK DE CLASE
class(enc_inflacion) #read_excel() guarda los datos en una estructura actualizada de los data frames


### SUMMARY
summary(enc_inflacion)


### DEFAULT NA's
enc_inflacion <- read_excel("Inflacion_ee_mx.xlsx", sheet = "Hoja1", 
                            range = "A18:I163", na = "N/E")

summary(enc_inflacion)


### Acceder a variables
enc_inflacion$SR14194
enc_inflacion[,2] #La manera usual de indicar columna no te da el vector de datos
enc_inflacion[[2]] #Esta va a ser la nueva manera de acceder al vector de datos


### Acceder a editor de data frames
fix(enc_inflacion)



### EJERCICIOS ###
#Cambia los nombres del dataframe enc_inflacion a:
#media, mediana, primer cuartil, tercer cuartil, min, max, sd, N


#Crea un nuevo data frame que contenga solo los datos del 2020