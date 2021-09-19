library(dplyr)
library(survey)
library(prob)

#Buat Tabel dulu gan
stratified<-data.frame(tinggi =c(167,160,168,157,168,161,157,162,151,161,167,166,157,157),
                       posisi=c(rep('jawa',11),rep('luarjawa',3)),
                       N =c(rep(25,11),rep(10,3)))
#design dulu
designstrat<-svydesign(ids = ~1,fpc = ~N,strata = ~posisi, data = stratified) 
#mean sama standard error
svymean(~tinggi, design = designstrat) 
#confidental interval
confint(svymean(~tinggi, design = designstrat),level = 0.95)
