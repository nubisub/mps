library(dplyr)
library(survey)
library(prob)

#DataFix
samplesimple<-data.frame(simple = c(163,170,157,155,166,165,175,171)) 
#BuatFPC
fpc.str <- rep(35,8)  
#Design
designsimple<-svydesign(ids = ~1,fpc = fpc.str, data = samplesimple) 
#EstimasiRata2&StandardError
svymean(~simple, design = designsimple) 
#ConfidentInterval
confint(svymean(~simple, design = designsimple),level = 0.95)

