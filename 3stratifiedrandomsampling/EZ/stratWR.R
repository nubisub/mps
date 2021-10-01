library(dplyr)
library(survey)
library(prob)

#Buat Tabel dulu gan
stratified<-data.frame(stratified =c(167,160,168,157,168,161,157,
                                     162,151,161,167,166,157,157),
                       posisi=c(rep('jawa',11),rep('luarjawa',3)),
                       N =c(rep(11/25,11),rep(3/10,3)))
#design dulu
designstrat<-svydesign(ids = ~1,strata = ~posisi, data = stratified, probs = ~N) 
#mean sama standard error
svymean(~stratified, design = designstrat) 
#confidental interval
confint(svymean(~stratified, design = designstrat),level = 0.95)

#Metode Penarikan Sampel Stratified
#Metode Penarikan Contoh Stratified
