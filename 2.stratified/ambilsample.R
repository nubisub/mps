library(dplyr)
library(survey)
library(prob)

jawa<-c(174,160,162,164,163,156,155,157,165,161,151,170,170,154,157,167,163,168,178,170,167,164,167,159,168)
luarjawa<-c(166,175,175,173,167,161,157,159,171,167)

#samplejawa<-c(sample(jawa,size = 11,replace=T))
#sampleluarjawa<-c(sample(luarjawa,size = 3,replace=T))
#samplesimple<-c(sample(total,size = 10,replace=T))
#samplestrat<-c(samplejawa,sampleluarjawa)
#samplestrat
#samplejawa

#Buat Tabel dulu gan
stratified<-data.frame(tinggi =c(167,160,168,157,168,161,157,162,151,161,167,166,157,157),
                       sex=c(rep('jawa',11),rep('luarjawa',3)),
                       N =c(rep(25,11),rep(10,3)))
#design dulu
designstrat<-svydesign(ids = ~1,fpc = ~N,strata = ~sex, data = stratified) 
#mean sama standard error
svymean(~tinggi, design = designstrat) 
#confidental interval
confint(svymean(~tinggi, design = designstrat),level = 0.95)

