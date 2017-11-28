#RESUMEN R

#CLASE 9
#EJEMPLO DISEÑO WEB

diseweb <- read.csv("C:/Users/Milagros/Desktop/exp numerica/datos_ejemplo_disenoweb.csv")
head(diseweb)
# ANOVA es para comparar igualdad de medias para 2 o mas grupos
# antes que nada  se realiza barlett para comparar  la igualdad de varianzas
# porque ANOVA necesita igualdad de varianzas
# Cuando las varianzas son distintas se utiliza Kruskal para comparar medianas
# Sin embargo como son  muestras relacionadas kruskal no nos da buenos resultados para poder
# concluir diferencia en las medianas, Kruskal sirve para muestras independientes.
kruskal.test(puntuacion~tipodiseno,diseweb)
# entonces utilizamos friedman 
friedman.test(puntuacion~tipodiseno|jurado,diseweb)



#EJERCICIO CAFE

f <- read.csv(choose.files())
f
head(f)
#hipotesis

# h0= las medianas de los distintos tipos de cafe son iguales
# h1= al menos una de las medianas es diferente
# quito la columna de expertos que solo es numeros
f<-f[,-1]
f  
#creo una columna de expertos con etiquetas mas entendibles
paste0("Experto_", rownames(f));
#transformo el set de datos  para que sea una matriz  que pueda recibir el test
f2 <-reshape(f,ids=rownames(f),times=(names(f)),timevar="tipocafe",varying=list(names(f)),direction="long")  
head(f2)
names(f2)<-c("tipocafe","puntuacion","experto")
#realizamos el test
friedman.test(puntuacion~tipocafe|experto,f2)
# conclusion:
# Como el p value es menor que el nivel de significancia (alpha)
# se rechaza la hipotesis nula
# podemos concluir que a un nivel de confianza de 0.95 se puede afirmar que al menos uno de los 
# tipos de cafe tiene una puntuacion mediana diferente


#CAPITULO 11

# ejercicio Relajacion muscular

# diseño experimental: completamente al azar (DCA)
# unidad Experimental: Un paciente
# variable respuesta: tiempo de la duracion de la relajacion muscular
# factor en estudio: las distintas drogas
# niveles del factor: sin droga, innovar, droperidol, fentayl
# tratamientos:sin droga, innovar, droperidol, fentayl
# Factores: de bloqueo
# Covariable: No existe

# EJERCICIO DIETAS ANIMALES coagulacion
A <- c(62,60,63,59)
B <- c(63,67,71,64,65,66)
C <- c(68,66,71,67,68,68)
D <- c(56,62,60,61,63,64,63,59)

resultado <- c(A,B,C,D)
dietas <- c(rep("A",length(A)),
            rep("B",length(B)),
            rep("C",length(C)),
            rep("D",length(D)))

misdatos <- data.frame(dietas,resultado)
# un pequeño grafico
boxplot(resultado~dietas,misdatos, main="Tiempo de coagulaciÃ³n de la sangre segun dieta", ylab="Tiempo (segundos)")

# ANOVA Siempre se usa 
anova1 <- aov(resultado~dietas,misdatos)
summary(anova1)
# se rechaza la hipotesis nula y acepto h1, entonces concluimos que almenos una tiene media diferente
# media general
mu.est <- mean(misdatos$resultado)
#aplicar media por grupos
mean_treatment <-  aggregate(resultado~dietas,misdatos,mean)
#diferencia media por grupos y media global
effect_treatment <-  aggregate(resultado~dietas,misdatos,function(x){mean(x)-mu.est})
mu.est
effect_treatment

# Treatment Effect with a reference Level
# mide los efectos respecto a un nivel, en este caso el nivel A
round(coefficients(anova1),2)

# Changing Reference Level
# en este caso el nivel B
misdatos$dietas <- relevel(misdatos$dietas,ref="B")
anova1 <- aov(resultado~dietas,misdatos)
summary(anova1)
round(coefficients(anova1),2)
# como se puede ver la media de tiempos del nivel a respecto al B es 5 minutos menos
# la media del nivel C es 2 minutos mas y la media del nivel D es 5 minutos menos

#EJERCICIO BACTERIA
res <- c(13,16,5,22,24,4,18,17,1,39,44,22)
factor <- c(1,2,3,1,2,3,1,2,3,1,2,3)
bloque <- c(1,1,1,2,2,2,3,3,3,4,4,4)

midata <- data.frame(factor,bloque,res)

#graficos
boxplot(res~factor,midata, main="Retardo en el crecimiento de bacterias",
        ylab="Tiempo (segundos)",
        xlab="Factor: Soluciones de lavado")
boxplot(res~bloque,midata, main="Retardo en el crecimiento de bacterias",
        ylab="Tiempo (segundos)",
        xlab="Bloques: Dias")

#graficos
interaction.plot(midata$factor,midata$bloque,midata$res,
                 xlab="Factor: Soluciones de lavado",
                 ylab="Tiempo (segundos)",
                 leg.legend="Bloque")

#Annova
anova3 <- aov(res~as.factor(factor)+as.factor(bloque),midata)
summary(anova3)

#reformulo la data con dos factores
midata <- data.frame(factor=as.factor(factor),bloque=as.factor(bloque),res)
anova1 <- aov(res~factor+bloque,midata)
summary(anova1)

# global Effect and Treatment Effect
#Ver diferencia de medias entre cada factor
mu.est <- mean(midata$res)
mean_treatment <-  aggregate(res~factor,midata,mean)
effect_treatment <-  aggregate(res~factor,midata,function(x){mean(x)-mu.est})
effect_block <-  aggregate(res~bloque,midata,function(x){mean(x)-mu.est})
mu.est
effect_treatment
effect_block

#Effects with control treatment
#Ver diferencias de medias respecto un nivel
round(coefficients(anova1),4)


#EJERCICIO GASOLINA
# h0 : T1=t2=T3=t4=t5=0
# h1 : al menos un Ti <>0
 
data5 <- read.csv(choose.files())
data5

anova4 <- aov(res~as.factor(factor)+as.factor(bloque),data5)
summary(anova4)

#Con un nivel de confianza del 95% se puede concluir que al menos
#un tipo de gasolina tienen un efecto distinto en el rendimiento del carro


#CAPITULO 12

#Ejercicio Voltaje

midata <- read.csv("C:/Users/Milagros/Desktop/exp numerica/datos_voltaje.csv")
midata$Temperatura <- as.factor(midata$Temperatura)
midata$material <- as.factor(midata$material)
anova <- aov(voltaje~Temperatura+material+Temperatura*material,midata)
summary(anova)

interaction.plot(midata$Temperatura,midata$material,midata$voltaje,
                 xlab="Factor: Temperatura",
                 ylab="Voltaje",
                 leg.legend="Material")


# Medias
tapply(midata$voltaje,midata$Temperatura, mean)
tapply(midata$voltaje,midata$material, mean)

#Estimacion
mean(midata$voltaje)
tapply(midata$voltaje,midata$Temperatura, mean) - mean(midata$voltaje)
tapply(midata$voltaje,midata$material, mean) - mean(midata$voltaje)

#combino medias--> las medias de la combinacion material temperatura
combinacion<-aggregate(voltaje~Temperatura+material,midata,mean)


unique(midata$Temperatura)
unique(midata$material)

dataframe <-data.frame()
for(i in unique(midata$Temperatura)){
  for(j in unique(midata$material)){  
    media_ij <- mean(midata$voltaje[midata$Temperatura%in%c(i) & midata$material%in%c(j)])
    media_i <- mean(midata$voltaje[midata$Temperatura%in%c(i)])
    media_j <- mean(midata$voltaje[midata$material%in%c(j)])
    media_global <- mean(midata$voltaje)
    
    eff_ij <- media_ij - media_i - media_j + media_global
    
    dataframe <- rbind(dataframe,data.frame(i,j,eff_ij))
    
  }
}
