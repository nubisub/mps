library(readxl)
library(dplyr)

df <- read_excel("tinggibadan.xlsx")
df <- df$tinggi

N=35 #populasi
n=8 #sampel
a = 0.05 #alfa
sys(N,n,a,df)

sys <- function(N, n, a, df) {
  k = ceiling(N/n)
  r = sample(1:k, 1)
  sys.samp = seq(r, r + k*(n-1), k)
  if(sys.samp[n]>n){sys.samp[n]=sys.samp[n]-N}
  df <- sort(df)
  sampel<-df[sys.samp]
  print(data.frame(sampel))
  
  z<-qnorm(a/2,lower.tail = F) #Alfa
  f<-n/N
  mean<-mean(sampel)
  cat("\nRata-rata = ",mean)
  
  d<-c(diff(sampel))^2
  mean<-mean(sampel)
  varsampsdm<-((1-f)*sum(d)/(2*n*(n-1)))
  SEsdm<-sqrt(varsampsdm)
  RSEsdm<-SEsdm/mean*100
  batasbawahsdm<-mean-SEsdm*z
  batasatassdm<-mean+SEsdm*z
  cat("\n\nSDM   = ",varsampsdm)
  cat("\nSE    = ",SEsdm)
  cat("\nLower = ",batasbawahsdm)
  cat("\nUpper = ",batasatassdm)
  
  sum=0
  for(i in 1:length(d)){
    if(i %% 2 != 0){
      sum=sum+(d[i])
    }
  }
  varsamppsm<-(1-f)/n^2*sum
  SEpsm<-sqrt(varsamppsm)
  RSEpsm<-SEpsm/mean*100
  batasbawahpsm<-mean-SEpsm*z
  batasataspsm<-mean+SEpsm*z
  cat("\n\nSDM   = ",varsamppsm)
  cat("\nSE    = ",SEpsm)
  cat("\nLower = ",batasbawahpsm)
  cat("\nUpper = ",batasataspsm)
  }
  
#Paired Selection Model
#Succesive Difference Model
#Manual gan
