library(dplyr)
library(survey)
library(prob)

#Buat Tabel dulu gan
stratified<-data.frame(tinggi =c(164,165,175,167,167,178
                                 ,154,159,157,155),
                       sex=c(rep('pria',6),rep('wanita',4)),
                       N =c(rep(20,6),rep(15,4)))
#design dulu
designstrat<-svydesign(ids = ~1,fpc = ~N,strata = ~sex, data = stratified) 
#mean sama standard error
svymean(~tinggi, design = designstrat) 
#confidental interval
confint(svymean(~tinggi, design = designstrat),level = 0.95)

