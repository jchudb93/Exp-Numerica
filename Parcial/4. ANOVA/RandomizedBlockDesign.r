'''
A fast food franchise is test marketing 3 new 
menu items. To find out if they have the same 
popularity, 6 franchisee restaurants are
randomly chosen for participation in the study.
In accordance with the randomized block design,
each restaurant will be test marketing all 
3 new menu items. Furthermore, a restaurant 
will test market only one menu item per week,
and it takes 3 weeks to test market all menu 
items. The testing order of the menu items 
for each restaurant is randomly assigned as
well.

Suppose each row in the following table represents 
the sales figures of the 3 new menu in a restaurant 
after a week of test marketing. At .05 level of significance, 
test whether the mean sales volume for the 3 new menu items
are all equal.
'''

library(readr)
dataset <- read_csv('fastfood-2.csv')
View(dataset)

#creamos un vector
r = c(t(as.matrix(df2)))

f = c("Item1", "Item2", "Item3") 

k = 3
n = 6

#treatment factors
tm = gl(k, 1, n*k, factor(f)) 

#blocking factors
blk = gl(n, k, k*n) 

av = aov(r ~ tm +blk)

summary(av)

'''
            Df Sum Sq Mean Sq F value Pr(>F) 
tm           2    539     269    4.96  0.032 * 
blk          5    560     112    2.06  0.155 
Residuals   10    543      54

Como el p-value 0.032 es menor a la significancia .05, rechazamos la hipotesis
'''

