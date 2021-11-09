library(readxl)
library(sampling)
library(dplyr)
library(prob)
library(survey)

#Penentuan Sample Size (Flexible)
df <- read_excel("tinggibadan.xlsx") #read data
z<-qnorm(0.025,lower.tail = F) #Alfa
d<-10/100 #presisi
p<-1/35 #proporsi
nwr<-z^2*p*(1-p)/d^2 #jumlah sampel with replacement
nwor<-nwr/(1+nwr/length(df$tinggi)) #jumlah sampel without replacement
nwr<-round(nwr) #jumlah sampel with replacement
nwor<-round(nwor) #jumlah sampel without replacement
N<-nrow(df) #jumlah populasi

#With Replacement
samplewr<-sample_n(df,size = nwr,replace = T) #pengambilan sampel
designwr<-svydesign(ids = ~1, data = samplewr)
svymean(~tinggi, design = designwr) #estimasi rata-rata & standard error = sqrt(var)
confint(svymean(~tinggi, design = designwr)) #confidental interval

#Without Replacement
samplewor<-sample_n(df,size = nwor,replace = F) #pengambilan sampel
samplewor<-mutate(samplewor,fpc=N)
designwor<-svydesign(ids = ~1, data = samplewor,fpc=~fpc)
svymean(~tinggi, design = designwor) #estimasi rata-rata & standard error = sqrt(var)
confint(svymean(~tinggi, design = designwor)) #confidental interval

confint()
