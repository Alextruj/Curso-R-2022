########### CORRELACIONES ################
library(readxl)
library(dplyr)

#### CAMBIAMOS DIRECTORIO DE TRABAJO
setwd("C:/Users/K17095/Documents/Curso macro R/Datos")
getwd()

#### CARGAMOS LOS DATOS DE IPI manufacturero

datos <- read_excel("IPI_manufacturero.xls", skip = 1)


#### QUITEMOS LAS TRES PRIMERAS COLUMNAS
datos <- 


#### EXCLUYAMOS LOS NA
datos <- na.exclude(datos)


#### QUITEMOS LA PRIMERA FILA
datos <- 


#### TRANSFORMEMOS TODAS LAS VARIABLES A NUMEROS
datos <- apply(datos, 2, as.numeric) %>% data.frame()


#### CAMBIA A TASA MENSUAL 
var_mens <- function(x){
  tmae <- ((x-lag(x,1))/lag(x,1))*100
}

tmae <- 


#### MATRIZ DE CORRELACION
correlaciones <- cor(tmae)


#### EJEMPLOS DE PRESENTACION
library(corrplot)

corrplot(correlaciones, type = "upper", 
         tl.col = "black", tl.srt = 90)


corrplot(correlaciones, type = "upper", 
         tl.col = "black", tl.srt = 90, method = "pie")


corrplot(correlaciones, type = "full", 
         tl.col = "black", tl.srt = 45, method = "color")

corrplot(correlaciones, type = "lower", 
         tl.col = "black", tl.srt = 45, method = "number")



#### PERFORMANCE ANALYTICS
library(PerformanceAnalytics)

chart.Correlation(correlaciones)
