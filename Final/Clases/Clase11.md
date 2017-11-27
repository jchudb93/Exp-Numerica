# Clase 11

## Diseño completamente randomizado o al azar (DCA)
- Es el más simple
- útil cuando las unidades experientales son homogéneas; cuando la variación entre ellas es pequeña que al agreuparlas en bloques, la ganancia e precisión es insignificante
- Los tratamientos se asigna aleatoriamente a las unidades experimentales sin imponer restricción

### Ventajas
- Flexible en cuanto al número de tratamiento y repeticiones
- El numero de repeticiones puede variar de un tratamiento a otro
- Análisis estadístico simple

### Desventajas
- Ineficiencia, debio a  que el error incluye toda la variación entre las unidades experimentales excepto a la debida a los tratamientos


### Ejemplo: Dietas

Con la finalidad de comparar los tiempos (en segundos) promedios de
coagulación de animales sometidos a 4 dietas diferentes: A, B, C y D, se
realizó un experimento con 24 animales de características similares. Las
dietas fueron asignados aleatoriamente entre los animales. Las muestras
fueron tomadas en orden aleatorios. Los datos obtenidos se muestran a
continuación.

Tratamientos:
``` R
A <- c(62,60,63,59)
B <- c(63,67,71,64,65,66)
C <- c(68,66,71,67,68,68)
D <- c(56,62,60,61,63,64,63,59)
```

Formar tablas de resultados
``` R
resultado <- c(A,B,C,D)


dietas <- c(rep("A",length(A)),
            rep("B",length(B)),
            rep("C",length(C)),
            rep("D",length(D)))

misdatos <- data.frame(dietas,resultado)
```

Generar boxplot
``` R
boxplot(resultado~dietas,misdatos, main="Tiempo de coagulación de la sangre segun dieta", ylab="Tiempo (segundos)")
```

Las medias de los grupos son iguales?
``` R
anova1 <- aov(resultado~dietas,misdatos)
summary(anova1)
```

Efectos de tratamientos en las dietas
``` R
mu.est <- mean(misdatos$resultado)
mu.est
#aplicar media por grupos
mean_treatment <-  aggregate(resultado~dietas,misdatos,mean)
mean_treatment
#diferencia media por gruposy media global
effect_treatment <-  aggregate(resultado~dietas,misdatos,function(x){mean(x)-mu.est})
mu.est
effect_treatment
```

Si la dieta A es la dieta por defecto, hallar el efecto de las dietas sobre A
```
round(coefficients(anova1),2)
```

Si ahora la dieta B es la dieta por defecto que se les da a los animales.
Hallar el efecto de las dietas con respecto a la dieta B
```
misdatos$dietas <- relevel(misdatos$dietas,ref="B")
misdatos$dietas
anova1 <- aov(resultado~dietas,misdatos)
summary(anova1)
round(coefficients(anova1),2)
```
