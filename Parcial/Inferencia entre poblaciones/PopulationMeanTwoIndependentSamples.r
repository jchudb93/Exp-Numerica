#media poblacional entre 2 muestras independientes

#mtcars es un built in dataframe mpg es el gas milage de los autos en 1974
#mt$am es el tipo de transmisi??n de los autos

'''
Assuming that the data in mtcars follows the normal distribution, 
find the 95% confidence interval estimate of the difference between
the mean gas mileage of manual and automatic transmissions.
'''

#autos con transmision automatica
L = mtcars$am == 0
mpg.auto = mtcars[L,]$mpg

#autos con transmision manual

mpg.manual = mtcars[!L,]$mpg

t.test(mpg.auto,mpg.manual)


#otra forma

t.test(mpg ~ am, data=mtcars)
