library(readxl)
library(sampling)
library(dplyr)
library(prob)
library(survey)
df <- read_excel("tinggibadan.xlsx") 

samplewor<-urnsamples(df$tinggi,size = 4,replace = F) #All Possible Sample WOR
samplewor<-mutate(samplewor,mean =rowMeans(select(samplewor,X1:X4))) #mean tiap gugus
mean(samplewor$mean)==mean(df$tinggi) #unbiased expected value
head(samplewor)

samplewr<-urnsamples(df$tinggi,size = 3,replace = T) #All Possible Sample WR
samplewr<-mutate(samplewr,mean =rowMeans(select(samplewr,X1:X3))) #mean tiap gugus
mean(samplewr$mean)==mean(df$tinggi) #unbiased expected value
head(samplewr)

#Metode Penarikan Sampel
#Metode Penarikan Contoh
