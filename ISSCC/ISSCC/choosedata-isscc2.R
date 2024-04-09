setwd("./aisscc-test")
library(aisscc)
print("Please select the cs data:") 
sccsamples<-read.csv(file.choose())  # choose the data
print("Please select the mv data:") 
mvsccsamples<-read.csv(file.choose())  # choose the mv data
consistencythreshold<-0.0
maxnumofconditions<-2
startaisscctime<-Sys.time()  # start timing
aissccresult<-aisscc(consistencythreshold,maxnumofconditions,sccsamples,mvsccsamples)
endaisscctime<-Sys.time()  # end timing
analysistime<-endaisscctime-startaisscctime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
write.table("aisscc:",'./result/aissccresult2.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistencythreshold:",'./result/aissccresult2.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(consistencythreshold,'./result/aissccresult2.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("maxnumofconditions:",'./result/aissccresult2.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(maxnumofconditions,'./result/aissccresult2.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("The total time of aisscc analysis:",'./result/aissccresult2.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(extractanalysistime,'./result/aissccresult2.txt',append=T,col.names=F,row.names=F,eol='\n')
write.csv(aissccresult,'./result/aissccresult2.csv',append=T,col.names=F,row.names=F)
#library(data.table)
#fwrite(aissccresult,file = "./result/testaissccresult2.csv.csv",sep = ",",row.names = FALSE,col.names = F)