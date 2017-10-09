#dos variables aleatorias independientes si la distribucion no se afectra entre ellas
#usamos de nuevo survey$Smoke de mass con la frecuencia de ejercicios

library(MASS)
tt =table(survey$Smoke,survey$Exer)
tt

'''
probar que los estudiantes con habitos de fumador es independiente
del nivel de ejercicios con un nivel de significancia de .05
'''
chisq.test(tt)

'''
Pearsons Chi-squared test

data:  tt
X-squared = 5.4885, df = 6, p-value = 0.4828

Warning message:
In chisq.test(tt) : Chi-squared approximation may be incorrect

El p-value es mayor al nivel de significancia, entonces aceptamos la hipotesis nula que son independientes
'''
#mejorando la solucion

#la advertencia de surge por los valores en la tabla de contingencia. Para evadirlo combinamos la segudna y tercera columna

ctbl = cbind(tt[,"Freq"],tt[,"None"]+tt[,"Some"])

chisq.test(ctbl)
'''

	Pearsons Chi-squared test

data:  ctbl
X-squared = 3.2328, df = 3, p-value = 0.3571
'''

