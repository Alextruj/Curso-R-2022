########### PLOTS BASE ################

### CARGUEMOS UN DATAFRAME DEFAULT
data <- mtcars

### PRIMERAS OBSERVACIONES
head(data, n = 10)


### SCATTERPLOT
plot(x = data$wt, y = data$mpg,
     pch = 16, col = "firebrick",
     xlab = "wt", ylab = "mpg")


### LINEAS
library(readxl)
datats <- read_excel("C:/Users/K17095/Documents/Curso macro R/Datos/IPUS_fred.xlsx")
plot(x = datats$date, y = datats$value,
     type = "l", col = "firebrick",
     xlab = "Fecha", ylab = "Indice",
     main = "Indice de Produccion Industrial (US)")


### LEYENDA
legend("topleft", legend = c("Argentina", "Estados Unidos", "Mexico"),
       col = c("blue", "red", "darkgreen"), pch=1)


### HISTOGRAMA
hist(x = data$cyl)



### BOXPLOTS
boxplot(x = data$mpg)

boxplot(data$mpg ~ data$cyl,
        xlab = "Cilindros", ylab = "Millas por galón")


### MODIFICAR EL LAYOUT DE LA VENTANA DE PLOT
par(mfrow = c(2,2))


### Exportar
# 1. Abrir el archivo
png("rplot.png") 
# 2. Crear grafico
boxplot(data$mpg ~ data$cyl,
        xlab = "Cilindros", ylab = "Millas por galón")
# 3. Cerrar
dev.off()
