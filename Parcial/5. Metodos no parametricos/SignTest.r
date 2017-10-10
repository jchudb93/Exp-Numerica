#Sign test se usa para decidir si una
#distribucion binomial tiene la misma posibilidad
#de exito de gallo

'''
A soft drink company has invented a new drink,
and would like to find out if it will be as
popular as the existing favorite drink. 
For this purpose, its research department 
arranges 18 participants for taste testing. 
Each participant tries both drinks in random 
order before giving his or her opinion.

It turns out that 5 of the participants like the
new drink better, and the rest prefer 
the old one. At .05 significance level,
can we reject the notion that the two drinks are equally popular?
'''

binom.test(5,18)

'''
	Exact binomial test

data:  5 and 18
number of successes = 5, number of trials =
18, p-value = 0.09625
alternative hypothesis: true probability of success is not equal to 0.5
95 percent confidence interval:
 0.09694921 0.53480197
sample estimates:
probability of success 
             0.2777778 

Debido a que p-value es mayor a la significancia
aceptamos la hipotesis nula
'''