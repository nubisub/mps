library(readxl)
library(sampling)
library(dplyr)
library(prob)
library(survey)
library(splitstackshape)

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
  
#pengambilan sample stratified WR
samplewr<-stratified(df, "sex", nwr/2, select = list(sex = c("L", "P")),replace = T)
#fraksi sampling/probs
pria<-sum(samplewr$sex == 'L')/sum(df$sex == 'L')
wanita<-sum(samplewr$sex == 'P')/sum(df$sex == 'P')
samplewr<-mutate(samplewr,N=if_else(samplewr$sex=='L',pria,wanita))
#Estimasi Rata-rata dan selang rucika
designstrat<-svydesign(ids = ~1,strata = ~sex, data = samplewr,probs = ~N) 
svymean(~tinggi, design = designstrat) #mean & standarderror = sqrt(var)
confint(svymean(~tinggi, design = designstrat),level = 0.95) #selang rucika

  
#Pengambilan Sample Stratified WOR
samplewor<-stratified(df, "sex", nwor/2, select = list(sex = c("L", "P")),replace = T)
#fraksi sampling/probs
pria<-sum(samplewor$sex == 'L')/sum(df$sex == 'L')
wanita<-sum(samplewor$sex == 'P')/sum(df$sex == 'P')
samplewor<-mutate(samplewor,N=if_else(samplewor$sex=='L',pria,wanita))
#Estimasi Rata-rata dan selang rucika
designstrat<-svydesign(ids = ~1,strata = ~sex, data = samplewor,fpc = ~N) 
print(svymean(~tinggi, design = designstrat)) #mean & standarderror = sqrt(var)
print(confint(svymean(~tinggi, design = designstrat),level = 0.95)) #selang rucika




