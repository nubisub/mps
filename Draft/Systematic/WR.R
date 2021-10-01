total<-c(164,162,164,165,166,167,167,167,
         167,167,168,168,170,170,171,173,
         174,175,175,178,151,154,155,156,
         157,157,157,159,159,160,161,161,
         163,163,170)
sampel<-c(151,157,159,162,164,167,168,170,175,154)
n<-length(sampel)
N<-length(total)
f<-n/N
mean<-mean(sampel)

d<-c(diff(sampel))^2
mean<-mean(sampel)
varsampsdm<-((1-f)*sum(d)/(2*n*(n-1)))

SEsdm<-sqrt(varsampsdm)
RSEsdm<-SEsdm/mean*100
batasbawahsdm<-mean-SEsdm*1.96
batasatassdm<-mean+SEsdm*1.96
sum=0


for(i in 1:length(d)){
  if(i %% 2 != 0){
    sum=sum+(d[i])
  }
}
sum
varsamppsm<-(1-f)/n^2*sum

SEpsm<-sqrt(varsamppsm)
RSEpsm<-SEpsm/mean*100
batasbawahpsm<-mean-SEpsm*1.96
batasataspsm<-mean+SEpsm*1.96


