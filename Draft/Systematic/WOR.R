
sampel<-c(151,157,161,164,167,168,173,151)
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


