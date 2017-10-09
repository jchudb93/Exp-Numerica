#Bondad de ajuste multinomial

#Una poblacion multinomial es data categorica que pertence a una coleccion discreta de ckases
#La hipotesis nula de la bondad de ajuste es que la frecuencia 'f' es igual cuenta 'e'
#en cada categoria. Es rechazada si el p-value es menor al nivel de significancia dada la pureba chi-cuadrado



library(MASS)

#El dataset survey, la columna smoke contiene las respuestas 
#funadores habituales. Tiene diferentes categorias
levels(survey$Smoke)

#podemos hallar las frecuencias de la tabla

smoke.freq = table(survey$Smoke)
smoke.freq


'''se proponen las siguientes estadisticas con un nivel de significancia de 0.05

 Heavy   Never   Occas   Regul 
 4.5%   79.5%    8.5%    7.5%

'''

smoke.prob = c(.045,.795,.085,.075)

chisq.test(smoke.freq,p=smoke.prob)
'''

	Chi-squared test for given probabilities

data:  smoke.freq
X-squared = 0.10744, df = 3, p-value = 0.9909

el p-value es mayor que el nivel de significancia, entonces aceptamos la hipotesis nula
'''


