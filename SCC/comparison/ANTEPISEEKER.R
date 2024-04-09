start<-Sys.time()  # start to time
sccsamples<-read.csv("./data/IECS.csv")
#samplesresult<-list()  # define an empty list
#samplesresult<-c(samplesresult,iecssamples[[length(iecssamples)]])  # extract the result column
#samplesresultvec<-unlist(samplesresult)  # change to vector
#samples<-list()  # define an empty list
#samples[[1]]=samplesresultvec  # put the result to the first column
#for (i in 1:(length(iecssamples)-1)){  # put the other columns
#condition<-list()
#condition<-c(condition,iecssamples[[i]])
#condition<-unlist(condition)
#samples[[i+1]]=condition
#}
write.table(sccsamples,file = "data0.txt",sep = ",",row.names = FALSE,col.names=T)
#samples<-read.csv("antepiseeker.txt",header=FALSE)
#startantepiseekertime<-Sys.time()  # start timing
#write.table("mark",'antepiseekerresult.txt',append=T,col.names=F,row.names=F,eol='\n') # write a mark in the antepiseekerresult.txt
#file.remove("antepiseekerresult.txt")  # remove the file
startantepiseekertime<-Sys.time()  # start timing
system2("AntEpiSeeker.exe",wait=T,stdout=F) # move Cantepiseeker.exe and filenamelist.txt to current path firstly,then execute this command。
endantepiseekertime<-Sys.time()  # end timing
analysistime<-endantepiseekertime-startantepiseekertime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
result<-try(antepiseekercalculation<-read.table("result.txt",skip=1,2)) # read the result of antepiseeker
#按阶数来写，用字符串切割
#二阶，其他阶类推
allpatternstr<-list()
allpattern<-list()
for (i in 1:nrow(result)){
re1<-list()
pattern<-chartr('(',' ',result[i,][1])  # delete the asterisk
patternvec<-unlist(strsplit(pattern,split=' '))  # delete the space
snp1<-as.numeric(patternvec[1])+1  # 转为正确的序号
pattern<-chartr('(',' ',result[i,][2])  # delete the asterisk
patternvec<-unlist(strsplit(pattern,split=' '))  # delete the space
snp2<-as.numeric(patternvec[1])+1  # 转为正确的序号
if (snp1<snp2){
re1[1]<-snp1  # add the number to keep consistent with antepiseeker and IEV
re1[2]<-snp2
} else{
re1[1]<-snp2  # add the number to keep consistent with antepiseeker and IEV
re1[2]<-snp1
}
revec=unlist(re1)
allpattern[[i]]=revec
snpstr<-c()
for (i in (1:length(revec))){
snpstr<-str_c(snpstr,(revec[[i]]),sep=',')
}
allpatternstr<-c(allpatternstr,snpstr)
}
order2dataframe=data.frame(cobinationall=unlist(allpatternstr),chi2=unlist(result[,3]),Pvalue=unlist(result[,4]))
if ("1,2" %in% order2dataframe$cobinationall){
belon<-("R")  # if pattern is in the pathogenic model and P-value is less than 0.05,mark "R"
antepiseekerR<-antepiseekerR+1  # count the right items
} else{
belon<-("W")  # esle,mark "W"
}
end<-Sys.time()  # end to time
runningtime<-end-start  # calculate the time
antepiseekertime<-antepiseekertime+runningtime  # calculate the total time

