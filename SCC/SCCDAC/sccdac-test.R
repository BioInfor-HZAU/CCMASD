setwd("./sccdac-test")
library(sccdac)
print("Please select the cs data:") 
sccsamples<-read.csv(file.choose(),head=T)  # 读取数据
mvsccsamples<-read.csv(file.choose())  # choose the new mv data
conthreshold=0.5
covthreshold=0.02
antnum=500
group=5
rou=0.05
rate=0.1
rule=1
sccdacsolutioncon<-sccdac(conthreshold=conthreshold,covthreshold=covthreshold,antnum=antnum,group=group,rou=rou,rate=rou,rule=rule,sccsamples=sccsamples,mvsccsamples=mvsccsamples)
write.csv(sccdacsolutioncon$order1dataframe,'./result/sccdac1order.csv',append=T,col.names=F,row.names=F)
write.csv(sccdacsolutioncon$order2dataframe,'./result/sccdac2order.csv',append=T,col.names=F,row.names=F)
write.csv(sccdacsolutioncon$order3dataframe,'./result/sccdac3order.csv',append=T,col.names=F,row.names=F)
write.csv(sccdacsolutioncon$order4dataframe,'./result/sccdac4order.csv',append=T,col.names=F,row.names=F)
write.csv(sccdacsolutioncon$order5dataframe,'./result/sccdac5order.csv',append=T,col.names=F,row.names=F)
write.table("sccdac:",'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("Ant_Num:",'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(antnum,'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("group:",'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(group,'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("coverage threshold:",'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(covthreshold,'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistency threshold:",'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(conthreshold,'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("rou:",'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(rou,'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("rate:",'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(rate,'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("rule:",'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(rule,'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("sccdac analysistime:",'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(sccdacsolutioncon$sccdactime,'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')