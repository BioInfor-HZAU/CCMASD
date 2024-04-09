setwd("./asccdpshct-test")
library(plyr)
library(purrr)
library(asccdpshct)
print("Please select the cs-ct data:") 
sccsamples<-read.csv(file.choose(),head=T)  # 读取数据 PC901
mvsccsamples<-read.csv(file.choose())  # choose the new mv data
MaxOrder=5
Pop=5000
Iter=10
c1=2
c2=2
TopSNP=10
alphacon=0.582
alphacov=0.042
asccdpshctsolution<-asccdpshct(sccsamples,mvsccsamples,MaxOrder=MaxOrder,Pop=Pop,Iter=Iter,c1=c1,c2=c2,TopSNP=TopSNP, alphacon=0.5,alphacov=0.02)
#write.csv(asccdpshctsolution$order1dataframe,'./result/sccdpsh1order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdpshctsolution$order2dataframe,'./result/asccdpshct2order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdpshctsolution$order3dataframe,'./result/asccdpshct3order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdpshctsolution$order4dataframe,'./result/asccdpshct4order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdpshctsolution$order5dataframe,'./result/asccdpshct5order.csv',append=T,col.names=F,row.names=F)
write.table("asccdpshct:",'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("MaxOrder:",'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(MaxOrder,'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("Pop:",'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(Pop,'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("Iter:",'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(Iter,'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistency threshold:",'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(alphacon,'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("coverage threshold:",'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(alphacov,'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("TopSNP:",'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(TopSNP,'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("asccdpshct analysistime:",'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(asccdpshctsolution$sccdpstime,'./result/asccdpshctresult.txt',append=T,col.names=F,row.names=F,eol='\n')