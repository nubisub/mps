library(survey)
library(dplyr)

sample <- read_excel("FIX.xlsx", sheet = "Sheet2")

sample<-mutate(sample,fraksi=0.25)
designstrat<-svydesign(ids = ~1,strata = ~Strata, data = sample,fpc = ~fraksi) 
svymean(~Stratified, design = designstrat) #mean & standarderror = sqrt(var)
confint(svymean(~Stratified, design = designstrat),level = 0.95) #selang rucika
