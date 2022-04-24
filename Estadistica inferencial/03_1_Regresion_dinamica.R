########### REGRESION LINEAL ################
library(readxl)
library(dplyr)

##### CAMBIA EL DIRECTORIO DE TRABAJO
setwd("C:/Users/K17095/Documents/Curso macro R/Datos")

##### CARGA LOS DATOS DE Indicadores mx.xlsx
datos <- read_xlsx("Indicadores mx.xlsx")


##### TRANSFORMA LOS DATOS A TASA ANUAL
var_anual <- function(x){
  ta <- (x-lag(x,4))/lag(x,4)*100
}

tasa_anual <- apply(datos[,-1],2,var_anual) %>% data.frame()


##### POR COMODIDAD, VAMOS A PONER LA FECHA EN VARIABLE
tasa_anual$Fecha <- datos$Fecha

##### CORRAMOS UNA REGRESION MULTIPLE

fit_pib <- lm(PIB ~ Construccion+Ind_manufacturas,
                 data = tasa_anual)

summary(fit_pib)


###### AÑADAMOS EL CUARTO REZAGO DEL PIB
tasa_anual$lagPIB <- lag(tasa_anual$PIB,4)

fit_pib_1 <- lm(PIB ~ lagPIB+Construccion+Ind_manufacturas,
                data = tasa_anual)

summary(fit_pib_1)

predict(fit_pib_1, tasa_anual[tasa_anual$Fecha == "2021/04",])


##### REGRESION SOLO PARA 2010-2018
datos_subset <- filter(tasa_anual, Fecha >= "2010/01" & Fecha <= "2018/04")

fit_pib_2 <- lm(PIB ~ lPIB+Construccion+Ind_manufacturas,
                data = datos_subset)

summary(fit_pib_2)


##### ROLLING WINDOWS
#CORRAMOS UNA REGRESION CON VENTANA DE 8 AÑOS
#La primera ventana empieza indice 9 (1995/01) 
#Y termina en el indice 40 (2002/04)

for(i in 9:76){
  inicial <- i
  final <- i+31
  fit_rolling <- lm(PIB ~ lagPIB+Construccion+Ind_manufacturas,
                    data = tasa_anual[inicial:final,])
  print(fit_rolling[["coefficients"]][["lagPIB"]])
}




