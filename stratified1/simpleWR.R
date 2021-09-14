library(dplyr)
library(survey)
library(prob)

#buat tabel gan, serah sih mau tabel apa vector
samplesimple<-data.frame(simple= c(178,163,167,170,157,154,168,167,163,167))
#BuatFPC
designsimple<-svydesign(ids = ~1,fpc = NULL, data = samplesimple)
#Design
svymean(~simple, design = designsimple)
#EstimasiRata2&StandardError
confint(svymean(~simple, design = designsimple),level = 0.95)
