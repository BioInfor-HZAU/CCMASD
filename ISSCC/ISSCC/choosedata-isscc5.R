setwd("./aisscc-test")
library(plyr)
library(purrr)
library(stringr)
#isscc analysis
library(aisscc)
print("Please select the cs data:") 
sccsamples<-read.csv(file.choose())  # choose the data
print("Please select the mv data:") 
mvsccsamples<-read.csv(file.choose())  # choose the mv data
consistencythreshold<-0.0
maxnumofconditions<-5
startisscctime<-Sys.time()  # start timing
issccresult<-aisscc(consistencythreshold,maxnumofconditions,sccsamples,mvsccsamples)
endisscctime<-Sys.time()  # end timing
analysistime<-endisscctime-startisscctime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
write.table("isscc:",'./result/aissccresult5.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistencythreshold:",'./result/aissccresult5.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(consistencythreshold,'./result/aissccresult5.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("maxnumofconditions:",'./result/aissccresult5.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(maxnumofconditions,'./result/aissccresult5.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("The total time of isscc analysis:",'./result/aissccresult5.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(extractanalysistime,'./result/aissccresult5.txt',append=T,col.names=F,row.names=F,eol='\n')
write.csv(issccresult,'./result/aissccresult5.csv',append=T,col.names=F,row.names=F)
