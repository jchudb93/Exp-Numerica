
#Suppose the mean weight of King Penguins found in an Antarctic colony 
#last year was 15.4 kg. In a sample of 35 penguins same time this year in 
#the same colony, the mean penguin weight is 14.6 kg. Assume the sample 
#standard deviation is 2.5 kg. At .05 significance level, can we reject 
#the null hypothesis that the mean penguin weight does not differ from last 
#year?


xbar = 14.6

mu0 =15.4

s = 2.5

n = 35

t = (xbar-mu0)/(s/(sqrt(n)))

t #-1.89

#valores criticos
alpha = .05
t.half.aplha = qt(1-alpha,df = n-1)

#se rechaza la hipotesis
c(-t.half.aplha,t.half.aplha)

#pvalue

pval = 2*pt(t,df=n-1)

pval #0.0668
