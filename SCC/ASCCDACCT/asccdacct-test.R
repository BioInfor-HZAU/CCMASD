setwd("./asccdacct-test")
library(asccdacct)
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
asccdacctsolutioncon<-asccdacct(conthreshold=conthreshold,covthreshold=covthreshold,antnum=antnum,group=group,rou=rou,rate=rou,rule=rule,sccsamples=sccsamples,mvsccsamples=mvsccsamples)
write.csv(asccdacctsolutioncon$order1dataframe,'./result/asccdacct1order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdacctsolutioncon$order2dataframe,'./result/asccdacct2order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdacctsolutioncon$order3dataframe,'./result/asccdacct3order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdacctsolutioncon$order4dataframe,'./result/asccdacct4order.csv',append=T,col.names=F,row.names=F)
write.csv(asccdacctsolutioncon$order5dataframe,'./result/asccdacct5order.csv',append=T,col.names=F,row.names=F)
write.table("asccadacct:",'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("Ant_Num:",'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(antnum,'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("group:",'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(group,'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("coverage threshold:",'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(covthreshold,'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistency threshold:",'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(conthreshold,'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("rou:",'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(rou,'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("rate:",'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(rate,'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("rule:",'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(rule,'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("asccadac analysistime:",'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(asccdacctsolutioncon$asccdactime,'./result/asccadacctresult.txt',append=T,col.names=F,row.names=F,eol='\n')