library(readxl)
library(dplyr)
library(prob)
df <- read_excel("Book2.xlsx")
M<-nrow(df)
n<-ncol(df)
ybarbar<-mean(colMeans(df))
sst<-sum((ybarbar-df$Cluster1)^2,(ybarbar-df$Cluster2)^2,
         (ybarbar-df$Cluster3)^2,(ybarbar-df$Cluster4)^2 )
varsample<-sst/(n*M-1)
cluster1<-df$Cluster1-ybarbar
cluster1<-urnsamples(cluster1,2)
cluster1<-sum(cluster1$X1*cluster1$X2)

cluster2<-df$Cluster2-ybarbar
cluster2<-urnsamples(cluster2,2)
cluster2<-sum(cluster2$X1*cluster2$X2)

cluster3<-df$Cluster3-ybarbar
cluster3<-urnsamples(cluster3,2)
cluster3<-sum(cluster3$X1*cluster3$X2)

cluster4<-df$Cluster4-ybarbar
cluster4<-urnsamples(cluster4,2)
cluster4<-sum(cluster4$X1*cluster4$X2)

cluster<-(cluster1+cluster2+cluster3+cluster4)
roh<-2*cluster/((M-1)*(n*M-1)*varsample)
cat(roh)

