setwd("./aisscc-test")
library(aisscc)
print("Please select the scource cs data:") 
sccsamples<-read.csv(file.choose())  # choose the data
print("Please select the source mv data:") 
mvsccsamples<-read.csv(file.choose())  # choose the mv data
print("Please select the group1 snps:") 
group1list<-read.table(file.choose(),header=F)
group1<-unlist(group1list)
print("Please select the group2 snps:") 
group2list<-read.table(file.choose(),header=F)
group2<-unlist(group2list)
consistencythreshold<-0.0
startesascctime<-Sys.time()  # start timing
abgsccsolution<-abgscc(consistencythreshold,sccsamples,mvsccsamples,group1,group2)
endesascctime<-Sys.time()  # end timing
analysistime<-endesascctime-startesascctime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
write.table("abgscc:",'./result/abgsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistencythreshold:",'./result/abgsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(consistencythreshold,'./result/abgsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("The total time of bgscc analysis:",'./result/abgsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(extractanalysistime,'./result/abgsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.csv(abgsccsolution,'./result/abgsccresult.csv',append=T,col.names=F,row.names=F)
