########### PRUEBAS DE HIPÓTESIS ################

##### ASIGNA LA SEMILLA 123 A LA SESION



##### CREA UN VECTOR ALEATORIO X CON MEDIA IGUAL A -1, SD IGUAL A 1
x <- 


##### T TEST PARA VER SI LA MEDIA ES DISTINTA DE CERO
t.test(x, mu = 0)


##### CREA UN VECTOR ALEATORIO Y CON MEDIA IGUAL A 1, SD IGUAL A #
y <- 



##### T TEST PARA LA DIFERENCIA DE MEDIAS ENTRE X y Y
t.test(x, y, alternative = "two.sided")


##### CAMBIEMOS LA HIPOTESIS ALTERNATIVA
t.test(x, y, alternative = "greater")

##### OTRO ARGUMENTO
t.test(x, y, alternative = "greater", mu = -2)
