setwd("./comparison-mdr-boost-scc-ant")
library(admisc)
library(purrr)
library(plyr)
library(lattice)
library(MDR)
library(scc)
source("chisquare.R")
source("pvaluejudge.R")
source("patternjudge.R")
source("patternjudgescc.R")
source("transformdatacsv.R")
startcomparisontime<-Sys.time()  # start timing
MDRtime<<-0
BOOSTtime<<-0
SCCtime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
SCCR<<-0  # initialize the number of right result of SCC
MDRB<<-0  # initialize the number of break result of MDR
BOOSTB<<-0  # initialize the number of break of BOOST
SCCB<<-0  # initialize the number of break result of SCC
for (j in 1:100){ 
transformdatacsv(number=j)
fit<-try(source("MDR.R"),TRUE)  # MDR analysis
if("try-error" %in% class(fit)){
MDRB<-MDRB+1}
fit<-try(source("BOOST.R"),TRUE)  # BOOST analysis
if("try-error" %in% class(fit)){
BOOSTB<-BOOSTB+1}
fit<-try(source("SCC.R"),TRUE)  # SCC analysis
if("try-error" %in% class(fit)){
SCCB<-SCCB+1}
}
write.table(MDRB,"./result/compareresultGametesdata-MDR-BOOST-SCC.txt",append=T,col.names=F,row.names=F,eol="\t")  # record the break number
write.table(MDRtime/100,"./result/compareresultGametesdata-MDR-BOOST-SCC.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/100,"./result/compareresultGametesdata-MDR-BOOST-SCC.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTB,"./result/compareresultGametesdata-MDR-BOOST-SCC.txt",append=T,col.names=F,row.names=F,eol="\t")  # record the break number
write.table(BOOSTtime/100,"./result/compareresultGametesdata-MDR-BOOST-SCC.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/100,"./result/compareresultGametesdata-MDR-BOOST-SCC.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(SCCB,"./result/compareresultGametesdata-MDR-BOOST-SCC.txt",append=T,col.names=F,row.names=F,eol="\t")  # record the break number
write.table(SCCtime/100,"./result/compareresultGametesdata-MDR-BOOST-SCC.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of SCC
write.table(SCCR/100,"./result/compareresultGametesdata-MDR-BOOST-SCC.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of SCC
#file.remove("data.csv","MDR.csv","BOOSTresult.txt","InteractionRecords.txt","MarginalAssoc.txt","./data/BOOST.txt","./data/IECS.txt","./data/IECSS.txt","./data/MDR.csv","./data/IECS.csv")  # remove the file
endcomparisontime<-Sys.time()  # end timing
comparisontime<-endcomparisontime-startcomparisontime  # calculate the time
extractcomparisontime<-format(comparisontime,format="%M")  # extract time
print(paste("The total time of comparison is:",extractcomparisontime))  # print the analysis time

# ANTEPISEEKER
library(admisc)
library(purrr)
library(plyr)
library(lattice)
library(stringr)
source("transformdatacsv.R")
startcomparisontime<-Sys.time()  # start timing
#MDRtime<<-0
antepiseekertime<<-0
#SCCtime<<-0
#MDRR<<-0  # initialize the number of right result of MDR
antepiseekerR<<-0  # initialize the number of right result of antepiseeker
#SCCR<<-0  # initialize the number of right result of SCC
#MDRB<<-0  # initialize the number of break result of MDR
antepiseekerB<<-0  # initialize the number of break of antepiseeker
#SCCB<<-0  # initialize the number of break result of SCC
for (j in 1:100){ 
transformdatacsv(number=j)
#fit<-try(source("MDR.R"),TRUE)  # MDR analysis
#if("try-error" %in% class(fit)){
#MDRB<-MDRB+1}
fit<-try(source("ANTEPISEEKER.R"),TRUE)  # antepiseeker analysis
if("try-error" %in% class(fit)){
antepiseekerB<-antepiseekerB+1}
#fit<-try(source("SCC.R"),TRUE)  # SCC analysis
#if("try-error" %in% class(fit)){
#SCCB<-SCCB+1}
}
#write.table(MDRB,"./result/antepiseeker-totalresult.txt",append=T,col.names=F,row.names=F,eol="\t")  # record the break number
#write.table(MDRtime/100,"./result/antepiseeker-totalresult.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
#write.table(MDRR/100,"./result/antepiseeker-totalresult.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(antepiseekerB,"./result/antepiseeker-totalresult.txt",append=T,col.names=F,row.names=F,eol="\t")  # record the break number
write.table(antepiseekertime/100,"./result/antepiseeker-totalresult.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of antepiseeker
write.table(antepiseekerR/100,"./result/antepiseeker-totalresult.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of antepiseeker
#write.table(SCCB,"./result/antepiseeker-totalresult.txt",append=T,col.names=F,row.names=F,eol="\t")  # record the break number
#write.table(SCCtime/100,"./result/antepiseeker-totalresult.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of SCC
#write.table(SCCR/100,"./result/antepiseeker-totalresult.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of SCC
#file.remove("data0.txt","MDR.csv","antepiseekerresult.txt","InteractionRecords.txt","MarginalAssoc.txt","./data/antepiseeker.txt","./data/IECS.txt","./data/IECSS.txt","./data/MDR.csv")  # remove the file
endcomparisontime<-Sys.time()  # end timing
comparisontime<-endcomparisontime-startcomparisontime  # calculate the time
extractcomparisontime<-format(comparisontime,format="%M")  # extract time
print(paste("The total time of comparison is:",extractcomparisontime))  # print the analysis time