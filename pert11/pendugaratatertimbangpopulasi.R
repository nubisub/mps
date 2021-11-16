library(readxl)
library(dplyr)

df <- read_excel("Book1.xlsx")
n<-nrow(df)
N<-90
Mi<-3510
df <- mutate(.data = df,yibar=df$yi/df$mi)

mbar<-1/N*sum(Mi)
ydoublebar<-1/(n*mbar)*sum(df$yi)
df<-mutate(.data = df,sb=(mi*yibar/mbar-ydoublebar)^2)
sb<-1/(n-1)*sum((df$sb))
var<-((1-n/N)/n*sb)
stderror<-sqrt(var)
rse<-stderror/ydoublebar*100

cat("ydoublebar = ", ydoublebar)
cat("variance = ",var)
cat("Standard Error = ",stderror)
cat("RSE = ",rse,"%")
