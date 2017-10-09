
#Suppose the food label on a cookie bag states that there is at most 2 grams
#of saturated fat in a single cookie. In a sample of 35 cookies, it is
#found that the mean amount of saturated fat per cookie is 2.1 grams. 
#Assume that the sample standard deviation is 0.3 gram. At .05 significance
#level, can we reject the claim on food label?


xbar = 2.1
mu0 = 2

s = 0.3

n = 35

t = (xbar-mu0)/(s/(sqrt(n)))

t #1.9720

alpha = 0.05

#Valores criticos
t.alpha = qt(1-alpha,df = n-1)

#rechazamos la hipotesis
t.alpha #1.6991


pval = pt(t,df=n-1,lower.tail = FALSE)