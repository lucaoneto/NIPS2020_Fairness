setwd(".")
rm(list=ls())
library(randomForest)
library(data.table)
cat("\014")
set.seed(13)

#
DL = as.data.frame.matrix(fread('Data/L.csv'))
DT = as.data.frame.matrix(fread('Data/T.csv'))
d = ncol(DL) - 1
XL = DL[,-(d+1)]; YL = DL[,d+1]
XT = DT[,-(d+1)]; YT = DT[,d+1]
M <- randomForest(x=XL, y=YL, ntree=500, do.trace=TRUE)
YLF <- predict(M, XL)
YTF <- predict(M, XT)
write.table(YLF,file='Data/RF_YLF.csv', col.names=F, row.names=F) 
write.table(YL, file='Data/RF_YLT.csv', col.names=F, row.names=F)
write.table(YTF,file='Data/RF_YTF.csv', col.names=F, row.names=F) 
write.table(YT, file='Data/RF_YTT.csv', col.names=F, row.names=F)  