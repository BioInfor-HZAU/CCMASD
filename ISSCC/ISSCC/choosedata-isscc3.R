setwd("./aisscc-test")
library(plyr)
library(purrr)
library(stringr)
#aisscc analysis
library(aisscc)
print("Please select the cs data:") 
sccsamples<-read.csv(file.choose())  # choose the data
print("Please select the mv data:") 
mvsccsamples<-read.csv(file.choose())  # choose the mv data
consistencythreshold<-0.0
maxnumofconditions<-3
startaisscctime<-Sys.time()  # start timing
aissccresult<-aisscc(consistencythreshold,maxnumofconditions,sccsamples,mvsccsamples)
endaisscctime<-Sys.time()  # end timing
analysistime<-endaisscctime-startaisscctime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
write.table("aisscc:",'./result/aissccresult3.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistencythreshold:",'./result/aissccresult3.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(consistencythreshold,'./result/aissccresult3.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("maxnumofconditions:",'./result/aissccresult3.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(maxnumofconditions,'./result/aissccresult3.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("The total time of aisscc analysis:",'./result/aissccresult3.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(extractanalysistime,'./result/aissccresult3.txt',append=T,col.names=F,row.names=F,eol='\n')
write.csv(aissccresult,'./result/aissccresult3.csv',append=T,col.names=F,row.names=F)
