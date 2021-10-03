library(readxl)
library(sampling)
library(dplyr)
library(prob)
library(survey)

simple <- function(data, a, p, d) {
  data <- data.frame(data)
  z<-qnorm(a/2,lower.tail = F) #Alfa
  nwr<-z^2*p*(1-p)/d^2 #jumlah sampel with replacement
  nwor<-nwr/(1+nwr/nrow(data)) #jumlah sampel without replacement
  nwr<-round(nwr) #jumlah sampel with replacement
  nwor<-round(nwor) #jumlah sampel without replacement
  N<-nrow(data) #jumlah populasi
  
  #With Replacement
  samplewr<-sample_n(data,size = nwr,replace = T) #pengambilan sampel
  designwr<-svydesign(ids = ~1, data = samplewr,fpc = NULL,probs = NULL)
  print(samplewr)
  print(svymean(~data, design = designwr)) #estimasi rata-rata & standard error = sqrt(var)
  print(confint(svymean(~data, design = designwr))) #confidental interval
  
  #Without Replacement
  samplewor<-sample_n(data,size = nwor,replace = F) #pengambilan sampel
  samplewor<-mutate(samplewor,fpc=N)
  designwor<-svydesign(ids = ~1, data = samplewor,fpc=~fpc)
  print(samplewor)
  print(svymean(~data, design = designwor)) #estimasi rata-rata & standard error = sqrt(var)
  print(confint(svymean(~data, design = designwor))) #confidental interval
}

df <- read_excel("tinggibadan.xlsx") #read data

d<-10/100 #presisi 10%
p<-1/35 #proporsi
a<-5/100 #alfa 5%

simple(df$tinggi,a,p,d)

#Metode Penarikan Sampel
#Estimasi Penduga Rata-rata

