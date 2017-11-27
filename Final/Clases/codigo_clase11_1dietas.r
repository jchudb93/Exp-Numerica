

#Tratamientos
A <- c(62,60,63,59)
B <- c(63,67,71,64,65,66)
C <- c(68,66,71,67,68,68)
D <- c(56,62,60,61,63,64,63,59)

#Tabla de resultados
resultado <- c(A,B,C,D)


dietas <- c(rep("A",length(A)),
            rep("B",length(B)),
            rep("C",length(C)),
            rep("D",length(D)))

misdatos <- data.frame(dietas,resultado)

boxplot(resultado~dietas,misdatos, main="Tiempo de coagulación de la sangre segun dieta", ylab="Tiempo (segundos)")

# ANOVA
anova1 <- aov(resultado~dietas,misdatos)
summary(anova1)

# global Effect and Treatment Effect
mu.est <- mean(misdatos$resultado)
mu.est
#aplicar media por grupos
mean_treatment <-  aggregate(resultado~dietas,misdatos,mean)
mean_treatment
#diferencia media por gruposy media global
effect_treatment <-  aggregate(resultado~dietas,misdatos,function(x){mean(x)-mu.est})
mu.est
effect_treatment

# Treatment Effect with a reference Level
round(coefficients(anova1),2)

# Changing Reference Level
misdatos$dietas <- relevel(misdatos$dietas,ref="B")
misdatos$dietas
anova1 <- aov(resultado~dietas,misdatos)
summary(anova1)
round(coefficients(anova1),2)

#================================================
# DBCA
#================================================
 res <- c(13,16,5,22,24,4,18,17,1,39,44,22)
 factor <- c(1,2,3,1,2,3,1,2,3,1,2,3)
 bloque <- c(1,1,1,2,2,2,3,3,3,4,4,4)
 
 midata <- data.frame(factor,bloque,res)

 length(res)
 length(factor)
 length(bloque)

 boxplot(res~factor,midata, main="Retardo en el crecimiento de bacterias",
         ylab="Tiempo (segundos)",
         xlab="Factor: Soluciones de lavado")
 boxplot(res~bloque,midata, main="Retardo en el crecimiento de bacterias",
         ylab="Tiempo (segundos)",
         xlab="Bloques: Días")

 # Interacciones
 interaction.plot(midata$factor,midata$bloque,midata$res,
                  xlab="Factor: Soluciones de lavado",
                  ylab="Tiempo (segundos)",
                  leg.legend="Bloque")

 #Opt1
 anova1 <- aov(res~as.factor(factor)+as.factor(bloque),midata)
 summary(anova1)

 #Opt2
 midata <- data.frame(factor=as.factor(factor),bloque=as.factor(bloque),res)
 anova1 <- aov(res~factor+bloque,midata)
 summary(anova1)

 # global Effect and Treatment Effect
 mu.est <- mean(midata$res)
 mean_treatment <-  aggregate(res~factor,midata,mean)
 effect_treatment <-  aggregate(res~factor,midata,function(x){mean(x)-mu.est})
 effect_block <-  aggregate(res~bloque,midata,function(x){mean(x)-mu.est})
 mu.est
 effect_treatment
 effect_block

 #Effects with control treatment
 round(coefficients(anova1),4)
