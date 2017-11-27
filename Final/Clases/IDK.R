data <-read.csv(file.choose())

summary(data)

library("information")
install.packages('Information')


install.packages("conf.design")

library(conf.design)

conf.design(c(1,1,1,1),p=2,treatment.names = LETTERS[1:4])

conf.design(c(1,0,1,0),p=2,treatment.names = c("A","C"))


help(LETTERS)

typeof(LETTERS[1:3])

typeof(c("A","C"))

