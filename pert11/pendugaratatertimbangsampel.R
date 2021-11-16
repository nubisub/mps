library(readxl)
library(dplyr)

df <- read_excel("Book1.xlsx")
n<-nrow(df)
N<-90
df <- mutate(.data = df,yibar=df$yi/df$mi)
yibarbar<-(sum(df$yi)/sum(df$mi))
df<-mutate(.data = df, entah=mi^2*(yibar-yibarbar)^2)
mbaraksen<-1/n*sum(df$mi)
sb<-sum(sum(df$entah)/(mbaraksen^2*(n-1)))
var<-((1-n/N)/n*sb)
stderror<-sqrt(var)
rse<-stderror/yibarbar*100

cat("ydoublebar = ", yibarbar)
cat("variance = ",var)
cat("Standard Error = ",stderror)
cat("RSE = ",rse,"%")
