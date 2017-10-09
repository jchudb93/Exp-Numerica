#Suppose a coin toss turns up 12 heads out of 20 trials. 
#At .05 significance level, can one reject the null hypothesis
#that the coin toss is fair?

pbar = 12/20
p0 = 0.5

n = 20

z = (pbar-p0) / sqrt(p0*(1-p0)/n)

z # 0.89

alpha = .05

z.half.alpha = qnorm(1-alpha/2)

#aceptamos
c(-z.half.alpha,z.half.alpha)


pval = 2* pnorm(z,lower.tail = FALSE)
pval

prop.test(12,20,p=0.5,correct = FALSE)