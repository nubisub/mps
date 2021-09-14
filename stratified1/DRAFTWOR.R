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

#ambilsample
#samplepria<-c(sample(pria,size = 4))
#samplewanita<-c(sample(wanita,size = 4))
#samplesimple<-c(sample(total,size = 8))
#samplestrat<-c(samplepria,samplewanita)

#samplepria
#samplesimple
#samplestrat
samplesimple<-c(170,166,171,167,
                157,151,155,170)

samplestrat<-c(163,170,157,155,
               166,165,175,171)



estimasipendugasimple<-mean(samplesimple)
estimasipendugastrat<-mean(samplestrat)

fpc<-(35-8)/35
varsimple<-var(samplesimple)
varstrat<-var(samplestrat)
varsampelsimple<-(fpc*varsimple/8)
varsampelstrat<-(fpc*varstrat/8)

modelsimple<-glm(samplesimple ~1)
modelstrat<-glm(samplestrat ~1)


confint(modelsimple, level = 0.95)
confint(modelstrat, level = 0.95)

rsesimple<-sqrt(varsimple)/mean(estimasipendugasimple)*100
rsestrat<-sqrt(varstrat)/mean(estimasipendugastrat)*100


