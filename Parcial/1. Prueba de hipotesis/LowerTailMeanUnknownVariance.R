
#'''Suppose the manufacturer claims that the mean lifetime of a 
#light bulb is more than 10,000 hours. In a sample of 30 light bulbs, 
#it was found that they only last 9,900 hours on average. Assume the sample 
#standard deviation is 125 hours. At .05 significance level,
#can we reject the claim by the manufacturer?

xbar = 9900
mu0 = 10000

s = 125

n = 30

t = (xbar-mu0)/(s/(sqrt(n)))

t #-4.3818

alpha = 0.05

#Valores criticos
t.alpha = qt(1-alpha,df = n-1)

#rechazamos la hipotesis
-t.alpha #-1.6991



pval = pt (t,df=n-1)
pval

