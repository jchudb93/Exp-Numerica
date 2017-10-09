#la media entre 2 muestras de la misma poblacion
#immer es un dataframe don y1 y y2 del rendimiento de cebada entre los a??os 1931 y 1932

#Assuming that the data in immer follows the normal distribution, find the 
#95% confidence interval estimate of the difference between the mean barley 
#yields between years 1931 and 1932.

#usamos t.test para obtener el intervalo estimado entra la diferencia de medias poblacionales

library(MASS)
head(immer)

t.test(immer$Y1,immer$Y2,paired = TRUE)	

#Paired t-test

#data:  immer$Y1 and immer$Y2
#t = 3.324, df = 29, p-value = 0.002413
#alternative hypothesis: true difference in means is not equal to 0
#95 percent confidence interval:
#  6.121954 25.704713
#sample estimates:
#  mean of the differences 
#15.91333 
