setwd("./comparison")
#library(admisc)
#library(purrr)
#library(plyr)
#library(lattice)
#library(MDR)
#library(iev)
#source("chisquare.R")
#source("patternjudge.R")
#source("pvaluejudge.R")
#source("patternjudgeiev.R")
# start to compare
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IEVtime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IEVR<<-0  # initialize the number of right result of IEV
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.05,seed=see,casenumber=100)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IEV.R")  # IEV analysis
}
write.table(MDRtime/1000,"./result/compareresult5%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/100,"./result/compareresult5%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/100,"./result/compareresult5%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/100,"./result/compareresult5%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IEVtime/100,"./result/compareresult5%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of IEV
write.table(IEVR/100,"./result/compareresult5%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IEV
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IEVtime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IEVR<<-0  # initialize the number of right result of IEV
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.1,seed=see,casenumber=100)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IEV.R")  # IEV analysis
}
write.table(MDRtime/100,"./result/compareresult10%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/100,"./result/compareresult10%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/100,"./result/compareresult10%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/100,"./result/compareresult10%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IEVtime/100,"./result/compareresult10%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of IEV
write.table(IEVR/100,"./result/compareresult10%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IEV
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IEVtime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IEVR<<-0  # initialize the number of right result of IEV
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.15,seed=see,casenumber=100)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IEV.R")  # IEV analysis
}
write.table(MDRtime/100,"./result/compareresult15%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/100,"./result/compareresult15%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/100,"./result/compareresult15%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/100,"./result/compareresult15%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IEVtime/100,"./result/compareresult15%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of IEV
write.table(IEVR/100,"./result/compareresult15%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IEV
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IEVtime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IEVR<<-0  # initialize the number of right result of IEV
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.2,seed=see,casenumber=100)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IEV.R")  # IEV analysis
}
write.table(MDRtime/100,"./result/compareresult20%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/100,"./result/compareresult20%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/100,"./result/compareresult20%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/100,"./result/compareresult20%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IEVtime/100,"./result/compareresult20%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of IEV
write.table(IEVR/100,"./result/compareresult20%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IEV
see<<-3 # initial seed 
MDRtime<<-0
BOOSTtime<<-0
IEVtime<<-0
MDRR<<-0  # initialize the number of right result of MDR
BOOSTR<<-0  # initialize the number of right result of BOOST
IEVR<<-0  # initialize the number of right result of IEV
source("generatedata.R")  
for (i in 1:1000){
see<-see+50  # add the number of seed
generatedata(datafull="A*B*C*D*E*S",noise=0.25,seed=see,casenumber=100)  # generate the dataset according to the arguments
source("MDR.R")  # MDR analysis
source("BOOST.R")  # BOOST analysis
source("IEV.R")  # IEV analysis
}
write.table(MDRtime/100,"./result/compareresult25%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of MDR
write.table(MDRR/100,"./result/compareresult25%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of MDR
write.table(BOOSTtime/100,"./result/compareresult25%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of BOOST
write.table(BOOSTR/100,"./result/compareresult25%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of BOOST
write.table(IEVtime/100,"./result/compareresult25%noise.txt",append=T,col.names=F,row.names=F,eol="\t")  # calculate the average runtime of IEV
write.table(IEVR/100,"./result/compareresult25%noise.txt",append=T,col.names=F,row.names=F,eol="\n")  # calculate the power of IEV
