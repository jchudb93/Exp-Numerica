'''
Suppose the food label on a cookie bag states that there is at most 2 grams of saturated fat in a single cookie. 
In a sample of 35 cookies, it is found that the mean amount of saturated fat per cookie is 2.1 grams.Assume that 
the population standard deviation is 0.25 grams. At .05 significance level, can we reject the
claim on food label?
'''

xbar=2.1
mu0=2
sigma = 0.25

n = 35

z = (xbar-mu0)/(sigma/sqrt(n))
z #2.2366

alpha = 0.05

z.alpha = qnorm(1-alpha)
z.alpha #1.644

#se rechaza la hipotesis

#pvalue
pvalue = pnorm(z,lower.tail = FALSE)
