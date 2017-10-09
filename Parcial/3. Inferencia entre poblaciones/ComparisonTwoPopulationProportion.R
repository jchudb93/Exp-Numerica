#Una encuesta entre  poblaciones producir?? diferentes resultados
#Se utiliza para comparar proporciones entre 2 poblaciones


library(MASS)

#quine dataset de ni??os autralianos clasificados por etnicicidad, sexo, edad, educacion y faltas al colegio


head(quine)

#eth -> A= Aborigen N= No
#sex -> M= Masculino F= Femenino

#la tabla eth x sex
tt=table(quine$Eth,quine$Sex)
'''
     F  M
  A 38 31
  N 42 35

'''
'''
Assuming that the data in quine follows the normal distribution, 
find the 95% confidence interval estimate of the difference between
the female proportion of Aboriginal students and the female proportion
of Non-Aboriginal students, each within their own ethnic group.
'''

prop.test(tt,correct = FALSE)

'''
	2-sample test for equality of proportions without continuity
	correction

data:  tt
X-squared = 0.0040803, df = 1, p-value = 0.9491
alternative hypothesis: two.sided
95 percent confidence interval:
 -0.1564218  0.1669620
sample estimates:
   prop 1    prop 2 
0.5507246 0.5454545 
'''

#la diferencia proporcional est?? entre muejeres aborigenes y no aborigenes
#esta entre 0.55 y 0.54

