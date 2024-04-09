setwd("./asccct-test")
library(asccct)
library(purrr)
library(plyr)
library(stringr)
sccsamples<-read.csv(file.choose(),header=F,skip=1)
mvsccsamples<-read.csv(file.choose(),header=F,skip=1)
#naturalbreakingpointcalculationresult<-naturalbreakingpointcalculation(sccsamples)
consistencythreshold<-0
coveragethreshold<-0
maxnumofconditions<-1
startscctime<-Sys.time()  # start timing
asccctresult<-asccct(sccsamples,mvsccsamples,maxnumofconditions,consistencythreshold,coveragethreshold)
ascccttime<-Sys.time()  # end to time
asccctanalysisruntime<-ascccttime-startscctime  # calculate the runtime
asccctextracttime<-format(asccctanalysisruntime,format="%M")  # extract time
write.csv(asccctresult,'./result/asccctresult.csv',append=T,col.names=F,row.names=F)
write.table("asccct:",'./result/asccctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistencythreshold:",'./result/asccctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(consistencythreshold,'./result/asccctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("coveragethreshold:",'./result/asccctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(coveragethreshold,'./result/asccctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("maxnumofconditions:",'./result/asccctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(maxnumofconditions,'./result/asccctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("asccctruntime:",'./result/asccctresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(asccctextracttime,'./result/asccctresult.txt',append=T,col.names=F,row.names=F,eol='\n')