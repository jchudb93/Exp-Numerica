#############################################
#                                           #
#   EJERCICIOS PARCIAL                      #
#                                           #
#############################################

# PREGUNTA 1

# a) Hipotesis:
 # H0: mu=12
 # H1: mu <12


automoviles <- c(12.2,13.1,13.5,11.5,10.5,10.4,11.0,10.5,12.2,12.5,11,12.4,12.2,11,10,11.4,9,10.1)
summary(automoviles)

t.test(automoviles,mu=12,alternative = "less", conf.level = 0.95)
# como el p-value es menor que el nivel de significancia de 0.05 entonces sse rechaza
# la hipotesis nula y se  prueba que la media afirmada por el fabricante si es exagerada
qt(.05, df=17)
# O como el t value es menor al t critico de una cola  se rechaza la hipotesis nula

#b)
# H0: sigma =1
# H1: sigma <>1

# Histograma
auxhist <- hist(automoviles ,xlab="rendimiento (km)", main= "Histograma del rendimiento") #   Al crear el histograma se guardan la cantidad de clases.
cortes_histo <- auxhist$breaks
probAcum_DistNormal <- pnorm(cortes_histo, mean = mean(automoviles), sd = sd(automoviles))
intervalos <- data.frame(probAcum_DistNormal[-6],probAcum_DistNormal[-1])
prop.esperada <- intervalos[,2]-intervalos[,1]
freq.observada <- auxhist$counts
qchisq(p=0.9,df=17)
output <- chisq.test(freq.observada, p=prop.esperada, rescale.p=TRUE, simulate.p.value = T)
output
# como el p value es mayor a el alpha(nivel de significancia) se acepta la hipotesis nula:
# Entonces se afirma que la desviacion estandar si es 1 km

# o como el chisq value es menor al chisq con alpha 0.1 se acepta la hipotesis nula.
# Entonces se afirma que la desviacion estandar si es 1 km


#Pregunta 2

tiempo <- c(1960/28,2184/32,1625/25,2840/40,4245/55)
votosblancos <- c(2/28,3/32,1/25,0,4/55)
# para tiempo de votacion
# h0: mu=140
# h1: mu <140

# para porcentaje de  votos blanco
# h0: mu=0.08
# h0: mu<0.08

# haciendo uso de T-student
qt(0.05,df=4)
t.test(tiempo,mu=140,alternative = "less",conf.level=0.95)
# como el t value es menor que el t critico  entonces se rechaza la hipotesis nula y se afirma que
# la media de tiempos es menos a 140
# * O como el pvalue es menor que el alpha se rechaza la hipotesis nula

qt(0.05,df=4)
t.test(votosblancos,mu=0.08,alternative = "less",conf.level=0.95)
# como el p value e smayor al alpha y el tvalue es mayor al t critico se acepta la hipotesis nula
# y se afirma que la implementacion del voto electronico no reduce el porcentaje de votos en blanco

# PREGUNTA 3

#prop.test(x=400,n=??,p=0.285)

#PREGUNTA 4
  # nrodamiento<- 50
  # Chi0 <- (nrodamiento-1)*(0.025^2)/0.0272
  # p.value <- pchisq(Chi0,df=nrodamiento-1)
# :(
# NOTA FALTA COMPROBAR DATOS EXTRAÑOS probar qchisq en vez de chisq
n <- 50
Chi0 <- (n-1)*(0.0272)/(0.025**2) 
dfchi <- n-1 
pval <- 2*min(pchisq(Chi0, df=dfchi, lower.tail = FALSE), pchisq(Chi0, df=dfchi, lower.tail = TRUE))

qchisq(0.95,df=49)
#PREGUNTA 5
tiemposprodA<-c(32,37,35,28,41,44,35,31,34)
tiemposprodB<-c(35,31,29,25,34,40,27,32)

# h0: muA -muB=0
# h1: muA -muB>0
t.test(tiemposprodA,tiemposprodB, var.equal = TRUE, alternative="greater",conf.level=0.95)
qt(0.95,df=15)

# como el pvalue es mayor a el nivel de significancia y el t value es menor al t critico de una
# prueba a una cola superior Se acepta la hipotesis nula y se afirma que los tiempos de produccion de la
# tecnica B no es mejor que la tecnica A

#PREGUNTA 6


#PREGUNTA 7
# H0: sigma = 18
# H1: sigma > 18

n <- 10
Chi0 <- (n-1)*(4.8**2)/18 
dfchi <- n-1 
pval <- pchisq(Chi0,df=dfchi, lower.tail = FALSE) 
qchisq(0.95,df=9)

#Rechazo H0, porque el valor de chi0 es menor que el valor de chi de tabla y por tanto no 
#esta en la zona de rechazo. No existe evidencia para decir que la variabilidad aumento

#Pregunta 8
#H0: Que la media sea igual a 1
#H1: Que la media sea distinta a 1
mediaPonderada <- (39*0+4*1+5*2+2*3)/(39+4+5+2) 
mediaPonderada
x <- c(rep(0,39),rep(1,4),rep(2,5),rep(3,2))

t.test(x,mu=1,alternative = "less")
qt(0.05,df=49)
#Se rechaza la hipotesis nula, porque el t critico (t=-1.676551) es mayor 
#que el t = -5.0932.

#PREGUNTA 9

GRUPO1<- c(52,72,73,64,48,52,57,46,66,61,46,65,62,47,51,53,49,47,73,61,53,60,62,43,46,75,64,68)
GRUPO2<- c(42,58,35,51,51,47,35,61,31,32,47,60,29,35,28,14,64,37,65,60,48,37,43,45,58,18,39,41)
#h0: mu1=mu2
#h1 mu1<>mu2

t.test(GRUPO1,GRUPO2,var.equal = TRUE)
qt(0.975,df=54)
# a)se rechaza la hipotesis nula y se afirma que las medias de ambos grupos son distintas

#b)
#h0: mu1=mu2
#h1 mu1>mu2
t.test(GRUPO1,GRUPO2,alternative = "greater",var.equal = TRUE)
qt(0.95,df=54)
# se rechaza la hipotesis nula y se afirma que la media del grupo 1 es mayor que la media del grupo 2

#PREGUNTA 13
control <- c(4.6,2,6.8,4.2,1.6)
bajo <- c(2,7.4,1.8,3.2,4)
apalancamientoMedio <- c(7,4.5,11.6,6,6.8)
alto <- c(7.9,6.8,5.8,9.2,11)

tasas<- c(4.6,2,6.8,4.2,1.6,2,7.4,1.8,3.2,4,7,4.5,11.6,6,6.8,7.9,6.8,5.8,9.2,11)
apalancamiento<-c(rep("control",5),rep("bajo",5),rep("apalancamientoMedio",5),rep("alto",5))

#Pregunta a)
#Asumiendo distribución normal
# h0: muc=mub=mumed=mualt
# h1: muc<>mub<>mumed<>mualt
# se realiza el test de barlett para probar que las varianzas  son iguales  y poder usar anova
bartlett.test(tasas ~ as.factor(apalancamiento)) 
# como el pvalue es mayor al nivel de significancia no se rechaza la hipotesis nula y
# se asumen varianza iguales
#  por esto aplicamos anova

anova(lm(tasas~as.factor(apalancamiento)))
al<-aov(tasas~as.factor(apalancamiento))
summary(al)

qf(0.95,df1=4,df2 = 16)

# dado que el f value es mayor al f critico o a que el pvalue es menor al alpha se rechaza la hipotesis
# nula y se afirma que  al menos una media de las tasas de apalancamiento es distinta.
al<-aov(tasas~apalancamiento)
summary(al)
posthoc <- TukeyHSD(x=al, 'apalancamiento', conf.level=0.95)
posthoc
#install.packages("multcomp") 
apalancamiento <- factor(apalancamiento)
al<-aov(tasas~apalancamiento)
summary(al)
library(multcomp)
posthoc2 <- glht(al, linfct = mcp(apalancamiento = "Tukey"))
summary(posthoc2)
