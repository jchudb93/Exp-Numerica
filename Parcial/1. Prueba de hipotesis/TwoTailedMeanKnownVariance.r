'''
Suppose the mean weight of King Penguins found in an Antarctic colony 
last year was 15.4 kg. In a sample of 35 penguins same time this year in the same colony, 
the mean penguin weight is 14.6 kg. Assume the population standard deviation is 2.5 kg. 
At .05 significance level, can we reject the null hypothesis that the mean penguin
weight does not differ from last year?
'''
#media muestral
xbar = 14.6

#valor de la hipotesis
mu0 = 15.4

#sd
sigma = 2.5

n = 35

z = (xbar-mu0)/(sigma/sqrt(n))

z #-1.89

alpha = .05

z.half.alpha = qnorm(1-alpha/2)

c(-z.half.alpha,z.half.alpha)

#-1.96 1.96

#aceptamos la hipotesis

pval = 2*pnorm(z)
pval #pvalue para 2 colas 0.058
