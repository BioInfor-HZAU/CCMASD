setwd("./comparison")
library(lattice)
#scc analysis
library(scc)
sccsamples<-read.csv(file.choose())  # choose the data
naturalbreakingpointcalculationresult<-naturalbreakingpointcalculation(sccsamples)
startscctime<-Sys.time()  # start timing
equivalenceanalysisresult<-equivalenceanalysis(sccsamples)
consistencythreshold<-0.641
maximumofconditions<-3
sccresult<-scc(consistencythreshold,maximumofconditions,sccsamples)
endscctime<-Sys.time()  # end timing
analysistime<-endscctime-startscctime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
write.table("consistencythreshold",'./result/scctotalresult.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table(consistencythreshold,'./result/scctotalresult.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table("maximumofconditions",'./result/scctotalresult.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table(maximumofconditions,'./result/scctotalresult.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table("The total time of scc analysis:",'./result/scctotalresult.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table(extractanalysistime,'./result/scctotalresult.txt',append=T,col.names=F,row.names=F,eol='\t')
write.csv(naturalbreakingpointcalculationresult,'./result/naturalbreakingpointcalculationresult.csv',append=T,col.names=F,row.names=F)
write.csv(equivalenceanalysisresult,'./result/equivalenceanalysisresult.csv',append=T,col.names=F,row.names=F)
write.csv(sccresult,'./result/sccresult.csv',append=T,col.names=F,row.names=F)
print(naturalbreakingpointcalculationresult)
print(equivalenceanalysisresult)
print(sccresult)
print(paste("The total time of scc analysis is:",extractanalysistime))  # print the analysis time
write.table("The total time of scc analysis is:",'./result/compareresult.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table(extractanalysistime,'./result/compareresult.txt',append=T,col.names=F,row.names=F,eol='\n')

#MDR analysis
library(MDR)
samplesresult<-list()  # define an empty list
samplesresult<-c(samplesresult,sccsamples[[length(sccsamples)]])  # extract the result column
samplesresultvec<-unlist(samplesresult)  # change to vector
MDRsamples<-list()  # define an empty list
MDRsamples[[1]]=samplesresultvec  # put the result to the first column
for (i in 1:(length(sccsamples)-1)){  # put the other columns
condition<-list()
condition<-c(condition,sccsamples[[i]])
condition<-unlist(condition)
MDRsamples[[i+1]]=condition
}
write.table(MDRsamples,file = "MDR.csv",sep = ",",row.names = FALSE,col.names=FALSE)
MDRsamples<-read.csv("MDR.csv",header=FALSE)
startMDRtime<-Sys.time()  # start timing
fit<-mdr.cv(data=MDRsamples,K=2,cv=10,ratio=1,equal="HR",genotype=c(0,1))
accuracy<-fit$'final model accuracy'
loc<-fit$'final model'
perm<-permute.mdr(accuracy,loci=loc,N.permute=100,method="CV",data=MDRsamples,cv=10,K=2,equal="HR",genotype=c(0,1),LRT=FALSE) #"K=2" represents the maximum allowed interaction of two SNPs
print(loc)  
print(perm[[1]])
endMDRtime<-Sys.time()  # end timing
analysistime<-endMDRtime-startMDRtime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
print(paste("The total time of MDR analysis is:",extractanalysistime))  # display the analysis time
write.table("The total time of MDR analysis is:",'./result/compareresult.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table(extractanalysistime,'./result/compareresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(loc,'./result/compareresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(perm[[1]],'./result/compareresult.txt',append=T,col.names=F,row.names=F,eol='\n')

#BOOST analysis
library(plyr)
library(purrr)
samplesresult<-list()  # define an empty list
samplesresult<-c(samplesresult,sccsamples[[length(sccsamples)]])  # extract the result column
samplesresultvec<-unlist(samplesresult)  # change to vector
BOOSTsamples<-list()  # define an empty list
BOOSTsamples[[1]]=samplesresultvec  # put the result to the first column
for (i in 1:(length(sccsamples)-1)){  # put the other columns
condition<-list()
condition<-c(condition,sccsamples[[i]])
condition<-unlist(condition)
BOOSTsamples[[i+1]]=condition
}
write.table(BOOSTsamples,file = "./data/BOOST.txt",sep = " ",row.names = FALSE,col.names=FALSE)
BOOSTsamples<-read.csv("./data/BOOST.txt",header=FALSE)
startBOOSTtime<-Sys.time()  # start timing
system2("CBOOST.exe",wait=T,stdout=F) # move CBOOST.exe and filenamelist.txt to current path firstly,then execute this command。
result<-try(boostcalculation<-read.table("InteractionRecords.txt",header = FALSE)) # read the result of BOOST
if("try-error" %in% class(result)){
write.table('NA','BOOSTresult.txt',append=T,col.names=F,row.names=F,eol='\t')
endBOOSTtime<-Sys.time()  # end timing
analysistime<-endBOOSTtime-startBOOSTtime
write.table(analysistime,'BOOSTresult.txt',append=T,col.names=F,row.names=F,eol='\t')
} else{
pairwithmaxinteraction<-which.max(boostcalculation[[6]]) # the sixth column is the InteractionBOOST,select the max InteractionBOOST
boosttranspose<-llply(transpose(boostcalculation), do.call, what = rbind) # transpose 
maxcombination<-boosttranspose[[pairwithmaxinteraction]]  # get the maxcombination
maxcombinationlist<-list()  # define the maxcombinationlist
remaxcombinationlist<-list()  # define the regular maxcombinationlist
maxcombinationlist<-c(maxcombinationlist,maxcombination[[2]]) 
maxcombinationlist<-c(maxcombinationlist,maxcombination[[3]])  # append the combination
remaxcombinationlist[[1]]<-maxcombinationlist[[1]]+1  # add 1 to the corresponding serial number, which is consistent with MDR and IECS 
remaxcombinationlist[[2]]<-maxcombinationlist[[2]]+1  # complete the remaxcombinationlist
ch<-chisquare(remaxcombinationlist,sccsamples)  # chi-square test，remaxcombinationlist is the pattern，sccsamples is the source dataset
boostresult<-c(remaxcombinationlist,ch) # join the combination, p-value together
print(boostresult) # display result
endBOOSTtime<-Sys.time()  # end timing
analysistime<-endBOOSTtime-startBOOSTtime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
print(paste("The total time of BOOST analysis is:",extractanalysistime))  # display the time of analysis 
} 
write.table("The total time of BOOST analysis is:",'./result/compareresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(extractanalysistime,'./result/compareresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(boostresult,'./result/compareresult.txt',append=T,col.names=F,row.names=F,eol='\n')
file.remove("data.csv","BOOST.txt","MDR.csv","BOOSTresult.txt","MarginalAssoc.txt","./data/BOOST.txt","./data/IECS.txt","./data/IECSS.txt","./data/MDR.csv","./data/IECS.csv")  # remove the file

