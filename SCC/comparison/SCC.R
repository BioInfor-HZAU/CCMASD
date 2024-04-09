library(scc)
SCCtime<-0
sccsamples<-read.csv("./data/IECS.csv")  # choose the data
startscctime<-Sys.time()  # start timing
consistencythreshold<-0.5
maximumofconditions<-2
sccresult<-scc(consistencythreshold,maximumofconditions,sccsamples)
endscctime<-Sys.time()  # end timing
analysistime<-endscctime-startscctime  # calculate the time
SCCtime<-SCCtime+analysistime
# change pattern to number function
changetonumber <-function(pattern){
samples<-read.csv("./data/IECS.csv",header = F,skip=1) 
condition<-colnames(samples)
conditionwithoutresult<-condition[-length(condition)]
result<-list()
interpa<-chartr("*"," ",pattern)
interpat<-chartr("*"," ",interpa)
#interpatt<-chartr("->"," ",interpat)
interpatt<-gsub("->"," ",interpat)
interpattern<-strsplit(interpatt," ")
y<-unlist(interpattern)
x<-y[-length(y)]
for (i in 1:length(x)){
z<-match(x[[i]],conditionwithoutresult)
result<-c(result,z)
}
return(result)
}
#start to judge
mar<-0  # start to judge result
for (i in 1:(length(sccresult[[1]])-1)){
pattern<-sccresult[[1]][[i]]   
patterntonum<-changetonumber(pattern) 
write.table(patterntonum,"./result/sccresult.txt",append=T,col.names=F,row.names=F,eol="\t")
consistency<-as.numeric(sccresult[[2]][[i]])  # get the consistency
write.table(consistency,"./result/sccresult.txt",append=T,col.names=F,row.names=F,eol="\t")
ch<-as.numeric(sccresult[[4]][[i]])  # get the P-value
write.table(ch,"./result/sccresult.txt",append=T,col.names=F,row.names=F,eol="\n")
paj<-patternjudgescc(patterntonum)  # judge the pattern
pvj<-pvaluejudge(ch)  # judge P-value,less than 0.05
if (paj&pvj){
mar<-mar+1  # get the number of right solutions
} else{
NULL}
}
if(mar){
belon<-("R")  # put the mark of solution
SCCR<-SCCR+1
} else{
belon<-("W")
}  # end to judge solution
write.table(sccresult[[1]][[length(sccresult[[1]])]],"./result/sccresult.txt",append=T,col.names=F,row.names=F,eol="\t")
write.table(sccresult[[2]][[length(sccresult[[2]])]],"./result/sccresult.txt",append=T,col.names=F,row.names=F,eol="\t")
write.table(belon,"./result/sccresult.txt",append=T,col.names=F,row.names=F,eol="\n")
