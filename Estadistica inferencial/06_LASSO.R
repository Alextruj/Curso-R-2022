########### LASSO ################
rm(list=ls(all=TRUE))
library(glmnet)
library(dplyr)
library(readxl)

##### CAMBIA EL DIRECTORIO DE TRABAJO
setwd("C:/Users/K17095/Documents/Curso macro R")


##### CARGA LOS DATOS DE Indicadores mx.xlsx
datos <- read_xlsx("Datos/Indicadores mx.xlsx")


##### TRANSFORMA LOS DATOS A TASA ANUAL
var_anual <- function(x){
  ta <- (x-lag(x,4))/lag(x,4)*100
}

tasa_anual <- apply(datos[,2:12],2,var_anual) %>% data.frame()


##### VEAMOS LA DOCUMENTACION DE LA FUNCION glmnet
?glmnet()


##### LASSO

## Necesitamos X y Y en matrices
X <- model.matrix(PIB~.-1,data=tasa_anual) 

Y <- tasa_anual$PIB[29:115]


## Corremos la funcion glmnet (alpha = 1:Lasso, =0:Ridge regression)
fit_lasso <- glmnet(X, Y, alpha = 1)

plot(fit_lasso,xvar="lambda",label=TRUE)


## Eligiremos lambda por medio de cross validation
set.seed(123)

fit_lasso_cv=cv.glmnet(X,Y,nfolds = 10)

plot(fit_lasso_cv)


coef(fit_lasso_cv, s = "lambda.min")

coef(fit_lasso_cv, s = "lambda.1se")


## Prediccion con lambda 1se
X <- rbind(X,tasa_anual[116,2:11]) %>% as.matrix()

predict(fit_lasso_cv, newx = X, s = "lambda.1se")
