setwd("./sccdps-test")
library(plyr)
library(purrr)
library(sccdps)
print("Please select the cs data:") 
sccsamples<-read.csv(file.choose(),head=T)  # 读取数据
mvsccsamples<-read.csv(file.choose())  # choose the new mv data
MaxOrder=5
Pop=100
Iter=10
c1=2
c2=2
TopSNP=10
alphacon=0.5
alphacov=0.02
sccdpssolution<-sccdps(sccsamples,mvsccsamples,MaxOrder=MaxOrder,Pop=Pop,Iter=Iter,c1=c1,c2=c2,TopSNP=TopSNP, alphacon=0.5,alphacov=0.02)
write.csv(sccdpssolution$order1dataframe,'./result/sccdps1order.csv',append=T,col.names=F,row.names=F)
write.csv(sccdpssolution$order2dataframe,'./result/sccdps2order.csv',append=T,col.names=F,row.names=F)
write.csv(sccdpssolution$order3dataframe,'./result/sccdps3order.csv',append=T,col.names=F,row.names=F)
write.csv(sccdpssolution$order4dataframe,'./result/sccdps4order.csv',append=T,col.names=F,row.names=F)
write.csv(sccdpssolution$order5dataframe,'./result/sccdps5order.csv',append=T,col.names=F,row.names=F)
write.table("sccdps:",'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("MaxOrder:",'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(MaxOrder,'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("Pop:",'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(Pop,'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("Iter:",'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(Iter,'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistency threshold:",'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(alphacon,'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("coverage threshold:",'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(alphacov,'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("TopSNP:",'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(TopSNP,'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("sccdps analysistime:",'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(sccdpssolution$sccdpstime,'./result/sccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')