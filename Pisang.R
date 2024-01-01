setwd("D:/METOPEL UAS/MANDA METOPEL")
library(readxl)
library(tidyverse)
library(kableExtra)
read_excel("pisang1.xlsx")
dat <- read_excel("pisang1.xlsx")
kbl(dat) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))


#Regresi Multivariat
# pengaruh ekspor pisang kinerja ekspor indonesia

reg1<-lm(data=dat,ekspor~pisang+PDB) #Y~X+S
summary(reg1)

#plot error
dat$m<-resid(reg1)
plot(dat$pisang,dat$m,xlab="Nilai Ekspor Pisang",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$ekspor,dat$m,xlab="Nilai Ekspor",ylab="error")
abline(h=0)

dat$m<-resid(reg1)
plot(dat$PDB,dat$m,xlab="Nilai PDB",ylab="error")
abline(h=0)

