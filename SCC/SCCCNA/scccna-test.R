setwd("./scccna-test")
library(lattice)
library(purrr)
library(plyr)
library(stringr)
library(scccna)
sccsamples<-read.csv(file.choose(),header=F,skip=1)  # choose the data
mvsccsamples<-read.csv(file.choose())
#naturalbreakingpointcalculationresult<-naturalbreakingpointcalculation(sccsamples)
consistencythreshold<-0
maxinumofconditions<-2
scccnaresultsolution<-scccna(sccsamples,mvsccsamples,consistencythreshold,maxinumofconditions)
write.csv(scccnaresultsolution$scccnaresult,'./result/scccnaresult.csv',append=T,col.names=F,row.names=F)
write.table("scccna:",'./result/scccnaresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistencythreshold:",'./result/scccnaresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(consistencythreshold,'./result/scccnaresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("maxinumofconditions:",'./result/scccnaresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(maxinumofconditions,'./result/scccnaresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(scccnaresultsolution$scccnatime,'./result/scccnaresult.txt',append=T,col.names=F,row.names=F,eol='\n')

