library(dplyr)
library(survey)
library(prob)

#Buat Tabel dulu gan
stratified<-data.frame(stratified =c(155, 157, 168, 163, 151, 167, 159,
                                     156, 170, 163, 174, 167, 161, 173),
                       posisi=c(rep('jawa',11),rep('luarjawa',3)),
                       N =c(rep(25,11),rep(10,3)))
#design dulu
designstrat<-svydesign(ids = ~1,fpc = ~N,strata = ~posisi, data = stratified) 
#mean sama standard error
svymean(~stratified, design = designstrat) 
#confidental interval
confint(svymean(~stratified, design = designstrat),level = 0.95)
