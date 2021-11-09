library(TeachingSampling)
library(readxl)
sample<-read_excel("FIX.xlsx", sheet = "Sheet3")
sample
HH(sample$data,sample$peluang)
