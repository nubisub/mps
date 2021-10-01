library(dplyr)
library(survey)
library(prob)
library(ccss)
total<-c(164,162,164,165,166,167,167,167,
         167,167,168,168,170,170,171,173,
         174,175,175,178,151,154,155,156,
         157,157,157,159,159,160,161,161,
         163,163,170)
N=35
n=8
tinggi<-data.frame(tinggi = sort(total))
sampel<-c(ccss(tinggi$tinggi,n,1))
sampel
sampel<-data.frame(c=upra)
sampel

sampel<-sort(sampel)
sampel
d<-c(diff(sampel))^2
d
SDM<-(1-(n/N)*sum(d)/(2*n*(n-1)))
SDM
sampel<-c(ccss(total,n,1))
sort(sampel)


