########### PCA ################
rm(list=ls(all=TRUE))


##### DIRECTORIO DE TRABAJO
setwd("C:/Users/K17095/Documents/Curso macro R")


##### CARGA LOS DATOS
datos <- read.csv("Datos/USArrests.csv")
head(datos)

## Usemos X como nombre de filas
rownames(datos) <- datos$X
datos$X <- NULL

head(datos)


##### RESUMEN DEL DATASET
summary(datos)
## Veamos la varianza
apply(datos,2,var)




##### PCA
acp <- prcomp(datos,
              center = TRUE, scale = TRUE)


#Veamos la matriz de rotaciones
print(acp)


#Veamos el plot
plot(acp, type = "l")


#Summary
summary(acp)

#Biplot
biplot(acp, scale = 0)


#CALCULEMOS LOS COMPONENTES
acp[["rotation"]][,1]

acp[["rotation"]][,1]*datos

#Queremos sumar lo anterior, por filas

pc1 <- apply(acp[["rotation"]][,1]*datos,1,sum)

pc1



#### GRAFICAS MAS ELEGANTES
library(factoextra)

#Porcentaje de varianza explicado
fviz_eig(acp)

#Grafica de cada observacion
fviz_pca_ind(acp)

fviz_pca_ind(acp,
             col.ind = "cos2", # Color por calidad de representacion
             repel = TRUE     # Text overlap
             )

#Grafica de las rotaciones de cada variable
fviz_pca_var(acp,
             col.var = "contrib", # Contribuciones al acp
             repel = TRUE     # Text overlap
)


