library(dplyr)
library(survey)
library(prob)

#Buat Tabel dulu gan
stratified<-data.frame(tinggi =c(170,166,171,167,157,151,155,170),
                       sex=c(rep('pria',4),rep('wanita',4)),
                       N =c(rep(4/20,4),rep(4/15,4)))
#design dulu
designstrat<-svydesign(ids = ~1,strata = ~sex,fpc = ~N, data = stratified) 
#mean sama standard error
svymean(~tinggi, design = designstrat) 
#confidental interval
confint(svymean(~tinggi, design = designstrat),level = 0.95)

#Metode Penarikan Sampel
#Metode Penarikan Contoh