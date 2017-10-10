#wilcoxon signed-rank test

#Con Wilcoxon podemos decidir si las poblaciones
#son identicas sin tener que asumir su distribucion normal

library(MASS)
head(immer)

'''
Without assuming the data to have normal
distribution, test at .05 significance 
level if the barley yields of 1931 and 1932 
in data set immer have identical 
data distributions.
'''
wilcox.test(immer$Y1,immer$Y2,paired = TRUE)

'''
Wilcoxon signed rank test with continuity
correction

data:  immer$Y1 and immer$Y2
V = 368.5, p-value = 0.005318
alternative hypothesis: true location shift is not equal to 0

El nivel de significancia es 0.005 y menor al nivel de significancia
rechazamos la hipotesis
'''
