  

midata <- read.csv("c:/datos_voltaje.csv")
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
tapply(midata$voltaje,midata$Temperatura, mean) - mean(midata$voltaje)
tapply(midata$voltaje,midata$material, mean) - mean(midata$voltaje)
