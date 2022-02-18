########### FILTER / SUMMARISE /COUNT ################
library(dplyr)

data <- starwars


### FILTER

droids <- data[data$species == "Droid",] 

droids_filter <- data %>% filter(species == "Droid")


### SUMMARISE

height_mass <- data %>% summarise(mheight = mean(height, na.rm = TRUE),
                                  mmass = mean(mass, na.rm = TRUE),
                                  mhair = mode(hair_color))

### SUMMARISE BY

by_gender <- data %>%
              group_by(sex) %>%
              summarise(mheight = mean(height, na.rm = TRUE),
                        mmass = mean(mass, na.rm = TRUE))


### COUNT
hair_freq <- count(data, vars = hair_color)


### EJERCICIOS ###
#Crea una funcion que te de la moda de cualquier vector
#Tip: which.max()



#Utiliza tu funcion de moda para obtener la moda de hair_color



#Crea una nueva variable que tenga la moda de hair_color, por genero



