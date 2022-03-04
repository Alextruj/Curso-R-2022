################ GGPLOT ################

### INSTALAMOS LA PAQUETERÍA
install.packages("ggplot2")

### CARGAMOS GGPLOT
library(ggplot2)


### GRAFICA DE LINEAS
#Grafica la serie de tiempo del IPUS

### GRAFICA DE PUNTOS
#Grafica la tasa de crecimiento del IGAE vs EMAE

### BOXPLOT
#Grafica boxplots para cada mes de la inflacion del 2000 al 2021

### DISTRIBUCIONES
#Grafica las distribuciones de inflacion por mes


### Exportar
ggsave(,"grafica_ggplot.png")