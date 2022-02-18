########### WIDE V LONG ################
library(tidyr)

### CARGUEMOS EL DATA FRAME DE AUTOS
data <- mtcars


### CREEMOS UNA VARIABLE QUE SEÑALE EL AUTO
row.names(data)

data$car <- row.names(data)


### WIDE A LONG
data_long <- pivot_longer(data = data, 
                          cols = 1:11, 
                          names_to = "Spec", 
                          values_to = "Value")


### LONG A WIDE
data_wide <- data_long %>% pivot_wider(names_from = "Spec", 
                                       values_from = "Value")


### POR QUE CONVIENE TENER EL DATA FRAME EN LONG?
boxplot(data_long$Value ~ data_long$Spec)


### Ejercicios ####
#Descarga los datos del dolar y dolar blue (uno por data frame),
## realiza los ajustes necesarios para terminar con un data frame
## con tres variables: fecha, variable, valor

