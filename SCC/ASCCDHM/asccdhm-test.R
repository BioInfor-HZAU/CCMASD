setwd("./asccdhm-test")
library(plyr)
library(purrr)
library(asccdhm)
print("Please select the cs data:") 
sccsamples<-read.csv(file.choose(),head=T)  # 读取数据
mvsccsamples<-read.csv(file.choose())  # choose the new mv data
HMS = 100;     
max_iter =1000; 
HMCR=0.95;     
PAR=0.35; 
asccdhmsolution<-asccdhm(HMS=HMS,max_iter=max_iter,HMCR=HMCR,PAR=PAR,sccsamples=sccsamples,mvsccsamples=mvsccsamples)
#write.csv(asccdhmsolution$order1dataframe,'./result/sccdps1order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdhmsolution$order2dataframe,'./result/sccdps2order.csv',append=T,col.names=F,row.names=F)
#write.csv(asccdhmsolution$order3dataframe,'./result/sccdps3order.csv',append=T,col.names=F,row.names=F)
#write.csv(asccdhmsolution$order4dataframe,'./result/sccdps4order.csv',append=T,col.names=F,row.names=F)
#write.csv(asccdhmsolution$order5dataframe,'./result/sccdps5order.csv',append=T,col.names=F,row.names=F)
write.table("asccdhm:",'./result/asccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("HMS:",'./result/asccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(HMS,'./result/asccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("max_iter:",'./result/asccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(max_iter,'./result/asccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("HMCR:",'./result/asccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(HMCR,'./result/asccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("PAR:",'./result/asccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(PAR,'./result/asccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(asccdhmsolution$sccdhmtime,'./result/asccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')