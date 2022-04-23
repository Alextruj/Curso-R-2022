########### SEASONAL ################
rm(list=ls(all=TRUE))
library(seasonal)
library(readxl)

##### CAMBIA EL DIRECTORIO DE TRABAJO
setwd("C:/Users/K17095/Documents/Curso macro R")


##### CARGA LOS DATOS DE PIB_o_sa
PIB <- read_xlsx("Datos/PIB_o_sa.xlsx")


##### DECLARA TS LAS DOS SERIES
PIB$Original <- ts(PIB$Original, start=c(2005,1), frequency=4)
PIB$AE <- ts(PIB$AE, start=c(2005,1), frequency=4)

plot(PIB$Original, type = "l")
points(PIB$AE, type = "l", col = "red")



##### DESESTACIONALIZACION DEFAULT DE SEASONAL
deses_default <- seas(PIB$Original)

points(deses_default[["series"]][["s11"]], type = "l", col = "blue")  
  

##### VISOR DE LA DESESTACIONALIZACION
view(deses_default)



#### REPLIQUEMOS LA SERIE DEL DANE
deses_oficial <- seas(PIB$Original,
                      transform.function = "log",
                      regression.variables = c("Lpyear",
                                               "ao2020.2","ao2020.3","ao2021.2",
                                               "ao2021.4"),
                      arima.model = "(0 1 0)(0 1 1)",
                      x11.seasonalma = "s3x5",
                      x11.sigmalim = NULL,
                      regression.aictest = NULL,
                      automdl = NULL,`x11.\tappendfcst` = "yes", 
                      outlier = NULL)


plot(PIB$Original, type = "l")
points(PIB$AE, type = "l", col = "red")
points(deses_oficial[["series"]][["d11"]], type = "l", col = "blue") 


#Creemos un data frame
o_sa_d16 <- data.frame(Original = c(PIB$Original,NA,NA,NA,NA),
                      SA = c(deses_oficial[["series"]][["d11"]],NA,NA,NA,NA),
                      Factores = deses_oficial[["series"]][["d16"]])


#### OUT
out(deses_oficial)
