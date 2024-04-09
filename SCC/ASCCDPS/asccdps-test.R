setwd("./asccdps-test")
library(plyr)
library(purrr)
library(asccdps)
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
asccdpssolution<-asccdps(sccsamples,mvsccsamples,MaxOrder=MaxOrder,Pop=Pop,Iter=Iter,c1=c1,c2=c2,TopSNP=TopSNP, alphacon=0.5,alphacov=0.02)
write.csv(asccdpssolution$order1dataframe,'./result/sccdps1order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdpssolution$order2dataframe,'./result/sccdps2order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdpssolution$order3dataframe,'./result/sccdps3order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdpssolution$order4dataframe,'./result/sccdps4order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdpssolution$order5dataframe,'./result/sccdps5order.csv',append=T,col.names=F,row.names=F)
write.table("asccdps:",'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("MaxOrder:",'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(MaxOrder,'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("Pop:",'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(Pop,'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("Iter:",'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(Iter,'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistency threshold:",'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(alphacon,'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("coverage threshold:",'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(alphacov,'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("TopSNP:",'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(TopSNP,'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("asccdps analysistime:",'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(asccdpssolution$sccdpstime,'./result/asccdpsresult.txt',append=T,col.names=F,row.names=F,eol='\n')