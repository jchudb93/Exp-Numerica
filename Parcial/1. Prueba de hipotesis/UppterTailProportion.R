#Suppose that 12% of apples harvested in an orchard last year was rotten. 
#30 out of 214 apples in a harvest sample this year turns out to be rotten. 
#At .05 significance level, can we reject the null hypothesis that the 
#proportion of rotten apples in harvest stays below 12% this year?

#probabilidad muestral
pbar = 30/214

#hipotesis
p0 = .12

n = 214

z = (pbar - p0)/sqrt(p0 * (1 -p0)/n) 

z #0.908

alpha = 0.05
z.alpha = qnorm(1-alpha)

z.alpha #1.6449

pval = pnorm(z,lower.tail = FALSE)

pval

prop.test(30, 214, p=.12, alt="greater", correct=FALSE) 