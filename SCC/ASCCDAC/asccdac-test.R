setwd("./asccdac-test")
library(asccdac)
print("Please select the cs data:") 
sccsamples<-read.csv(file.choose(),head=T)  # 读取数据
mvsccsamples<-read.csv(file.choose())  # choose the new mv data
conthreshold=0.324
covthreshold=0.05 # MR1至少5个案例支持
antnum=20
group=5
rou=0.05
rate=0.1
rule=1
asccdacsolutioncon<-asccdac(conthreshold=conthreshold,covthreshold=covthreshold,antnum=antnum,group=group,rou=rou,rate=rou,rule=rule,sccsamples=sccsamples,mvsccsamples=mvsccsamples)
write.csv(asccdacsolutioncon$order1dataframe,'./result/asccdac1order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdacsolutioncon$order2dataframe,'./result/asccdac2order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdacsolutioncon$order3dataframe,'./result/asccdac3order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdacsolutioncon$order4dataframe,'./result/asccdac4order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdacsolutioncon$order5dataframe,'./result/asccdac5order.csv',append=T,col.names=F,row.names=F)
write.table("asccadac:",'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
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
write.table("asccadac analysistime:",'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(asccdacsolutioncon$asccdactime,'./result/asccadacresult.txt',append=T,col.names=F,row.names=F,eol='\n')