########### IMPORTAR ARCHIVOS ################

#PRIMERO VAMOS A POSICIONAR LA SESION EN LA CARPETA DE DATOS
setwd("C:/Users/K17095/Documents/Curso macro R/Datos")


#### DESDE CSV
datos_csv <- read.csv("Dummy.csv")


#### DESDE EXCEL
library(readxl)
datos_xlsx <- read_excel("Dummy.xlsx")


### DESDE LA FRED
library(fredr)
fredr_set_key("057328c8730779e86865db4c392ff4aa")

datos_fred <- fredr(series_id = "INDPRO")


### DESDE CUALQUIER PÁGINA DE INTERNET
library(httr)

url<-"https://si3.bcentral.cl/estadisticas/Principal1/Informes/AnuarioCCNN/listado2020/ACN001_2020.xls"

GET(url, write_disk(TF <- tempfile(fileext = ".xls")))
datos_internet <- read_excel(TF)



############ EXPORTAR DATOS A EXCEL ###################
library(writexl)

#La funcion write_xlsx exporta DATA FRAMES
write_xlsx(datos_fred, "IPUS_fred.xlsx")




### Ejercicios ###
#Descarga los datos de la produccion industrial de Estados Unidos,
#solo desde 1993 al 2021

