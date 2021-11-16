library(readxl)
library(dplyr)

df <- read_excel("Book1.xlsx")
df <- mutate(.data = df,yibar=yi/mi)
yibarbar<-mean(df$yi/df$mi)
n<-nrow(df)
N<-90
sb<-sum(1/(n-1)*sum((df$yibar-yibarbar)^2))
var<-((1-n/N)/n*sb)
stderror<-sqrt(var)
rse<-stderror/yibarbar*100

cat("ydoublebar = ", yibarbar)
cat("variance = ",var)
cat("Standard Error = ",stderror)
cat("RSE = ",rse,"%")
