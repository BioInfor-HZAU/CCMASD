setwd("./sccdhm-test")
library(plyr)
library(purrr)
#sccdhm analysis
library(sccdhm)
HMS = 50;     # Harmony memory size
max_iter =500;  # In HS algorithm, only one new harmony (solution) will be evaluated at each iteration.
HMCR=0.95;        # harmony memory consideration rate.  
PAR=0.35;         # pitch-adjustment rate  
#HSASCCtime=0;
sccsamples<-read.csv(file.choose())  # choose the data
mvsccsamples<-read.csv(file.choose())  # choose the data
sccdhmsolution<-sccdhm(HMS=HMS,max_iter=max_iter,HMCR=HMCR,PAR=PAR,sccsamples,mvsccsamples)
write.csv(sccdhmsolution$order2dataframe,'./result/sccdhm2order.csv',append=T,col.names=F,row.names=F)
write.table("sccdhm:",'./result/sccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("HMS:",'./result/sccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(HMS,'./result/sccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("max_iter:",'./result/sccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(max_iter,'./result/sccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("HMCR:",'./result/sccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(HMCR,'./result/sccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("PAR:",'./result/sccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(PAR,'./result/sccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("sccdhm analysistime:",'./result/sccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(sccdhmsolution$sccdhmtime,'./result/sccdhmresult.txt',append=T,col.names=F,row.names=F,eol='\n')