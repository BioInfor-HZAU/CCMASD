setwd("./esascc-test")
library(esascc)
library(aesascc)
library(stringr)
print("Please select the cs data:") 
sccsamples<-read.csv(file.choose())  # choose the data
print("Please select the mv data:") 
mvsccsamples<-read.csv(file.choose())  # choose the mv data
consistencythreshold<-0.0
coveragethreshold<-0.0
maxnumofconditions<-2
startesascctime<-Sys.time()  # start timing
esasccresult<-esascc(consistencythreshold,coveragethreshold,maxnumofconditions,sccsamples)
endesascctime<-Sys.time()  # end timing
analysistime<-endesascctime-startesascctime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
write.table("esascc:",'./result/esasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistencythreshold:",'./result/esasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(consistencythreshold,'./result/esasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("maxnumofconditions:",'./result/esasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(maxnumofconditions,'./result/esasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("The total time of esascc analysis:",'./result/esasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(extractanalysistime,'./result/esasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.csv(esasccresult,'./result/esasccresult1.csv',append=T,col.names=F,row.names=F)

startaesascctime<-Sys.time()  # start timing
aesasccresult<-aesascc(consistencythreshold,maxnumofconditions,sccsamples,mvsccsamples)
endaesascctime<-Sys.time()  # end timing
analysistime<-endaesascctime-startaesascctime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
write.table("aesascc:",'./result/aesasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("consistencythreshold:",'./result/aesasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(consistencythreshold,'./result/aesasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("maxnumofconditions:",'./result/aesasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(maxnumofconditions,'./result/aesasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("The total time of aesascc analysis:",'./result/aesasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(extractanalysistime,'./result/aesasccresult1.txt',append=T,col.names=F,row.names=F,eol='\n')
write.csv(aesasccresult,'./result/aesasccresult1.csv',append=T,col.names=F,row.names=F)