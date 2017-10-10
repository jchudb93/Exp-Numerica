#Mann-Whitney-Wilcoxon
#Si dos muestras son independientes, entonces
#provenen de poblaciones distintas y no se afectan entre si

#Usando Mann-White-Wilcoxon, podemos decidir si las 
#distribuciones poblacionales son identicas sin asumir una distribucion
#normal

#Without assuming the data to have normal distribution, decide at .05 significance level if the gas mileage data of manual and automatic transmissions in mtcars have identical data distribution.

wilcox.test(mpg ~ am,data=mtcars)

'''
	Wilcoxon rank sum test with continuity
	correction

data:  mpg by am
W = 42, p-value = 0.001871
alternative hypothesis: true location shift is not equal to 0
'''