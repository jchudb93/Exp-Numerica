
CNuevo<-c(16.85, 16.40, 13.21, 16.35, 16.52, 17.04, 16.96, 17.15,
          16.59, 16.57) 
CAntiguo <- c(17.50, 17.63, 18.25, 18.00, 17.86, 17.75, 18.22,
              17.90, 17.96, 18.15)

var.test(CNuevo,CAntiguo)

t.test(CNuevo,CAntiguo,paired = F, var.equal = F)
iter<-2000
n1 <- length(CNuevo)
n2 <- length(CAntiguo)
d<- NULL
for(i in 1:iter){
  xtemp <- sample(CNuevo,n1,replace = T)
  ytemp<- sample(CAntiguo,n2,replace = T)
  d[i] <- mean(xtemp) - mean(ytemp)
}
dbar <- mean(d)
dbar
se <- sqrt(var(d))
z <- dbar/se
pvalor <- 2*(1-pnorm(abs(z)))
cbind(dbar,se,z,pvalor)

Punta1<- c(7,3,3,4,8,3,2,9,5,4) 
Punta2<- c(6,3,5,3,8,2,4,9,4,5)
t.test(Punta1,Punta2,paired = F)
