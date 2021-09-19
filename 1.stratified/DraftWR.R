library(dplyr)
library(survey)
library(prob)

total<-c(164,162,164,165,166,167,167,167,
         167,167,168,168,170,170,171,173,
         174,175,175,178,151,154,155,156,
         157,157,157,159,159,160,161,161,
         163,163,170)
pria<-c(164,162,164,165,166,167,167,167,
        167,167,168,168,170,170,171,
        173,174,175,175,178)
wanita<-c(151,154,155,156,157,157,157,159,
          159,160,161,161,163,163,170)

#samplepria<-c(sample(pria,size = 6,replace=T))
#samplewanita<-c(sample(wanita,size = 4,replace=T))
#samplesimple<-c(sample(total,size = 10,replace=T))
#samplestrat<-c(samplepria,samplewanita)

#samplepria
#samplesimple
#samplestrat
samplesimple<-data.frame(simple= c(178,163,167,170,157,154,168,167,163,167))
#BuatFPC
designsimple<-svydesign(ids = ~1,fpc = NULL, data = samplesimple)
#Design
svymean(~simple, design = designsimple)
#EstimasiRata2&StandardError
confint(svymean(~simple, design = designsimple),level = 0.95)



samplestrat<-c(164,165,175,167,167,178
               ,154,159,157,155)

estimasipendugasimple<-mean(samplesimple)
estimasipendugastrat<-mean(samplestrat)

fpc<-(35-10)/35
varsimple<-var(samplesimple)
varstrat<-var(samplestrat)
varsampelsimple<-(fpc*varsimple/10)
varsampelstrat<-(fpc*varstrat/10)

modelsimple<-glm(samplesimple ~1)
modelstrat<-glm(samplestrat ~1)

confint(modelsimple, level = 0.95)
confint(modelstrat, level = 0.95)

rsesimple<-sqrt(varsimple)/mean(estimasipendugasimple)*100
rsestrat<-sqrt(varstrat)/mean(estimasipendugastrat)*100


