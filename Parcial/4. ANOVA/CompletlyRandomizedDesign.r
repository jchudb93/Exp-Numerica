#Random design

'''
A fast food franchise is test marketing 3 new menu items. 
To find out if they the same popularity, 18 franchisee 
restaurants are randomly chosen for participation in t
he study. In accordance with the completely randomized design, 
6 of the restaurants are randomly chosen to test market the
first new menu item, another 6 for the second menu item, and
the remaining 6 for the last menu item.
'''

'''
Suppose the following table represents the sales figures of 
the 3 new menu items in the 18 restaurants after a week of 
test marketing. At .05 level of significance, test whether 
the mean sales volume for the 3 new menu items are all equal.

'''

#Cargar el archivo fastfood-1.txt

library(readr)
df1 <- read_csv('fastfood-1.csv')
View(dataset)

#Concatenar las filas
r = c(t(as.matrix(df1)))

f = c("Item1","Item2","Item3") #niveles de tratamiento
k = 3 #nro de niveles de tratamiento
n = 6# #obesrvaciones por tratamiento

#crear un vector de factores que corresponde a cada elemento de r en3 pasos

tm = gl(k, 1, n*k, factor(f)) 

#aplicamos aov
av = aov(formula formula = r ~ tm)

summary(av)

'''
            Df Sum Sq Mean Sq F value Pr(>F)
tm           2  745.4   372.7   2.541  0.112
Residuals   15 2200.2   146.7 

Como pvalue = 0.112>.05 niveles de significancia, aceptamos la hipotesis
'''