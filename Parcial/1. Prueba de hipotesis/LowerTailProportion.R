#usamos z para proporciones

#Suppose 60% of citizens voted in last election. 85 out of 148 people 
#in a telephone survey said that they voted in current election.
#At 0.5 significance level, can we reject the null hypothesis 
#that the proportion of voters in the population is above 60% this year?

#probabilidad muestral
pbar = 85/148
#probabilidad hipotetica
p0 = .6
#tamaño de la muestra
n = 148

z = (pbar - p0)/(sqrt(p0*(1-p0))/n)

z #-0.637

alpha = .05

z.alpha = qnorm(1-alpha)

#aceptamos la hipotesis
-z.alpha #-1,644

pval = pnorm(z)

pval

#usamos prop.test para encontrar el pvalue con correccion de Yates
prop.test(85, 148, p=.6, alt="less", correct=FALSE) 
