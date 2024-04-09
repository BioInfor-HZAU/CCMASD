library(iev)
source("patternjudgeiev.R")
ievsamples<-read.csv("./data/IEV.csv")  # choose the data
startievtime<-Sys.time()  # start to time
iterations<-5
consistencythreshold<-0.5
ievresult<-iev(k=iterations,consistencythreshold=consistencythreshold,samples=ievsamples)  # iev analysis
endievtime<-Sys.time()  # end timing
analysistime<-endievtime-startievtime  # calculate the time
IEVtime<-IEVtime+analysistime
# change pattern to number function
changetonumber <-function(pattern,samples){
condition<-colnames(samples)
result<-list()
x<-strsplit(pattern," ")
y<-unlist(x)
for (i in 1:length(y)){
z<-match(y[[i]],condition)
result<-c(result,z)
}
return(result)
}
#start to judge
mar<-0  # start to judge result
for (i in 1:(length(ievresult[[1]])-1)){
pattern<-ievresult[[1]][[i]]   
patterntonum<-changetonumber(pattern,ievsamples) 
write.table(patterntonum,"./result/ievresult.txt",append=T,col.names=F,row.names=F,eol="\t")
ch<-as.numeric(ievresult[[2]][[i]])  # get the P-value
write.table(ch,"./result/ievresult.txt",append=T,col.names=F,row.names=F,eol="\n")
paj<-patternjudgeiev(patterntonum)  # judge the pattern
pvj<-pvaluejudge(ch)  # judge P-value,less than 0.05
if (paj&pvj){
mar<-mar+1  # get the number of right solutions
} else{
NULL}
}
if(mar){
belon<-("R")  # put the mark of solution
IEVR<-IEVR+1
} else{
belon<-("W")
}  # end to judge solution
write.table(ievresult[[1]][[length(ievresult[[1]])]],"./result/ievresult.txt",append=T,col.names=F,row.names=F,eol="\t")
write.table(ievresult[[2]][[length(ievresult[[2]])]],"./result/ievresult.txt",append=T,col.names=F,row.names=F,eol="\t")
write.table(belon,"./result/ievresult.txt",append=T,col.names=F,row.names=F,eol="\n")