library(readxl)
library(survey)

estimasi <- function(data) { 
  samplewr<-data.frame(data) 
  designwr<-svydesign(ids = ~1, data = samplewr,fpc = NULL,probs = NULL)
  print(samplewr)
  print(svymean(~data, design = designwr)) #estimasi rata-rata & standard error = sqrt(var)
  print(confint(svymean(~data, design = designwr))) #confidental interval
}
sample<-read_excel("FIX.xlsx", sheet = "Sheet1")
estimasi(sample$Data) #Panggil Fungsi
