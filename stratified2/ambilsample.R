library(dplyr)
library(survey)
library(prob)

jawa<-c(174,160,162,164,163,156,155,157,165,161,151,
        170,170,154,157,167,163,168,178,170,167,164,167,159,168)
luarjawa<-c(166,175,175,173,167,161,157,159,171,167)

samplejawa<-c(sample(jawa,size = 11,replace=F))
sampleluarjawa<-c(sample(luarjawa,size = 3,replace=F))
#samplesimple<-c(sample(total,size = 10,replace=T))
samplestrat<-c(samplejawa,sampleluarjawa)
#samplestrat
#samplejawa
