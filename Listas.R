########### LISTAS ################

### CREAMOS UNA LISTA
my_list <- list("apple", "banana", "cherry")


### ACCEDEMOS A LOS ELEMENTOS DE LA LISTA
my_list[[2]]


### LAS LISTAS SIRVEN PARA AGREGARLE DIMENSION A LOS DATA FRAMES
paises_2020 <- data.frame(Pais = c("Argentina", "Brasil", "Colombia", "Estados Unidos", "Guatemala", "Mexico"),
                          GDP_growth = c(-9.9, -4.1, -6.8, -3.6, -1.5, -8.2))

paises_2019 <- data.frame(Pais = c("Argentina", "Brasil", "Colombia", "Estados Unidos", "Guatemala", "Mexico"),
                          GDP_growth = c(-2.0, 1.4, 3.3, 2.2, 3.9, -0.2))


lista_paises <- list("2020" = paises_2020,
                     "2019" = paises_2019)



### SIRVEN PARA GUARDAR INFORMACION CON DISTINTAS LONGITUDES
## Ejemplo: specs de un modelo de desestacionalizacion

modelos <- list("pib.total" = list("rounds" = c(3,12),
                                   "tr" = "log",
                                   "reg.var" = c("lpyear", "easter[3]","ao2020.2", "ls1995.1", "ls1995.2", "ls2009.1","ls2020.2", "tc2009.2"),
                                   "arima" = "(0 1 0)(0 1 1)",
                                   "filt" = c("s3x3","s3x3","s3x5","s3x3"),
                                   "sigmalim" = NULL,
                                   "reg.aic" = NULL),
                  
                "pib.pri" = list("rounds" = c(3,12),
                                 "tr" = "log",
                                 "reg.var" = NULL,
                                 "arima" = "([2] 0 0)(0 1 1)",
                                 "filt" = "s3x5",
                                 "sigmalim" = NULL,
                                 "reg.aic" = NULL),
                  
                "pib.sec" = list("rounds" = c(3,12),
                                 "tr" = "log",
                                 "reg.var" = c("lpyear", "easter[3]","ao2020.2", "ls1995.1", "ls1995.2", "ls1996.1", "ls2009.1"),
                                 "arima" = "(0 1 [2])(0 1 1)",
                                 "filt" = "s3x3",
                                 "reg.aic" = NULL),
                
                "pib.ter" = list("rounds" = c(3,12),
                                 "tr" = "log",
                                 "reg.var" = c("lpyear", "easter[3]","ao2020.2", "ls1995.1", "ls1995.2", "ls2009.1", "tc2009.2"),
                                 "arima" = "(0 1 0)(0 1 1)",
                                 "filt" = "s3x3",
                                 "sigmalim" = NULL,
                                 "reg.aic" = NULL))

## ACCEDER A ELEMENTOS EN LISTAS ANIDADAS
modelos[["pib.total"]][["reg.var"]]



## AGREGAR ELEMENTOS A LA LISTA
modelos[["igae.total"]] <- list("rounds" = c(3,12),
                                "tr" = "log",
                                "reg.var" = c("tdnolpyear", "lpyear", "easter[4]",
                                              "ao1995.Oct","ao2020.Apr","ao2020.May","ao2020.Jun","ao2020.Jul",
                                              "ls1995.Feb", "ls2009.Jan","ls2020.Apr"),
                                "arima" = "(0 1 [1 4 7])(0 1 1)",
                                "filt" = c("s3x3", "s3x3", "s3x5", "s3x3", "s3x5", "s3x5", "s3x5", "s3x5", "s3x3", "s3x5", "s3x3", "s3x3"),
                                "sigmalim" = NULL,
                                "reg.aic" = NULL)

