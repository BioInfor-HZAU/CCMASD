setwd("./asccdhmct-test")
library(plyr)
library(purrr)
library(asccdhmct)
print("Please select the cs data:") 
sccsamples<-read.csv(file.choose(),head=T)  # 读取数据
mvsccsamples<-read.csv(file.choose())  # choose the new mv data
HMS = 5000;     
max_iter =10000; 
HMCR=0.95;     
PAR=0.35; 
asccdhmctsolution<-asccdhmct(HMS=HMS,max_iter=max_iter,HMCR=HMCR,PAR=PAR,sccsamples=sccsamples,mvsccsamples=mvsccsamples)
#write.csv(asccdhmctsolution$order1dataframe,'./result/sccdps1order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdhmctsolution$order2dataframe,'./result/asccdhmct2order.csv',append=T,col.names=F,row.names=F)
#write.csv(asccdhmctsolution$order3dataframe,'./result/sccdps3order.csv',append=T,col.names=F,row.names=F)
#write.csv(asccdhmctsolution$order4dataframe,'./result/sccdps4order.csv',append=T,col.names=F,row.names=F)
#write.csv(asccdhmctsolution$order5dataframe,'./result/sccdps5order.csv',append=T,col.names=F,row.names=F)
write.table("asccdhmct:",'./result/asccdhmctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("HMS:",'./result/asccdhmctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(HMS,'./result/asccdhmctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("max_iter:",'./result/asccdhmctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(max_iter,'./result/asccdhmctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("HMCR:",'./result/asccdhmctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(HMCR,'./result/asccdhmctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("PAR:",'./result/asccdhmctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(PAR,'./result/asccdhmctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(asccdhmctsolution$sccdhmtime,'./result/asccdhmctresult.txt',append=T,col.names=F,row.names=F,eol='\n')