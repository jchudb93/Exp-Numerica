#Kruskal-Wallis Test

#Decimos que 2 muestras son independientes 
#si provienen de poblaciones no relacionadas
#

#Con Kruskal podemoss decidir si las poblaciones son
#identicas sin asumir la normalidad de las distribuciones

'''
In the built-in data set named airquality, 
the daily air quality measurements in New York,
May to September 1973, are recorded. The 
ozone density are presented in the data frame 
column Ozone.'''

head(airquality)


'''
The null hypothesis is that the monthly ozone
density are identical populations. To test 
the hypothesis, we apply the kruskal.test 
function to compare the independent monthly
data. The p-value turns out to be nearly 
zero (6.901e-06). Hence we reject the
null hypothesis.
'''

kruskal.test(Ozone ~ Month, data = airquality)

'''
Kruskal-Wallis rank sum test

data:  Ozone by Month
Kruskal-Wallis chi-squared = 29.267, df =
4, p-value = 6.901e-06

Como el p-value es menor a la significancia, podemos decir que 
rechazamos la hipotesis y decidir que que son no identicas
'''
