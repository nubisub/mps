library(readxl)
library(dplyr)
df <- read_excel("Book2.xlsx")
M<-nrow(df)
ybarbar<-mean(colMeans(df))
ssw<-sum((mean(df$Cluster1)-df$Cluster1)^2,
         (mean(df$Cluster2)-df$Cluster2)^2,
         (mean(df$Cluster3)-df$Cluster3)^2,
         (mean(df$Cluster4)-df$Cluster4)^2 )
sst<-sum((ybarbar-df$Cluster1)^2,(ybarbar-df$Cluster2)^2,
         (ybarbar-df$Cluster3)^2,(ybarbar-df$Cluster4)^2 )
ssb<-sst-ssw
roh<-1-(M/(M-1)*ssw/sst)
cat(roh)
