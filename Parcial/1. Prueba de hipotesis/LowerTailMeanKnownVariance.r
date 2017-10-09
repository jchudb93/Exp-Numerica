'''
Suppose the manufacturer claims that the mean lifetime of a light bulb is more than 10,000 hours. 
In a sample of 30 light bulbs, it was found that they only last 9,900 hours on average. Assume 
the population standard deviation is 120 hours. At .05 significance level, can we reject the claim by the manufacturer?
'''

#xbar > mu0

#promedio de la muestra
xbar = 9900

#valor de la hipotesis
mu0 = 10000

#sd
sigma = 120

#tamaño de la muestra
n=30

#estadistico de prueba
z = (xbar-mu0)/(sigma/sqrt(n))

z #-4.5644

#valores criticos

alpha = 0.5
z.alpha = qnorm(1-alpha)

-z #-1.6449

#se rechaza la hipotesis nula
pval = pnorm(z)
pval #2.505166e-06
