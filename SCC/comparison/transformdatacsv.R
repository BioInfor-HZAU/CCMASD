transformdatacsv <-
function(number){  # define the function
setwd("./data/GAMETESdata/Gametes_EDM-1")
numberstr<-as.character(number)
if (nchar(numberstr)==1) { 
    numberstring<-paste("00",numberstr,sep="")
    } else if (nchar(numberstr)==2) {
    numberstring<-paste("0",numberstr,sep="")
    } else {
    numberstring<-numberstr
}  # change the number to string
#gametesdatawithoutclo<-read.csv(paste("Gametes_EDM-1_",numberstring,".txt",sep=""),sep="\t")  # read gametesdata
gametesdata<-read.csv(paste("Gametes_EDM-1_",numberstring,".txt",sep=""),sep="\t",header=F)  # read gametesdata
#coldata<-read.csv(paste("Gametes_EDM-1_","001",".txt",sep=""),sep="\t",header=F)  # read gametesdata
#coldata<-colnames(gametesdata)
interdata<-list()  # initialize the IECSdata
for (i in 1:length(gametesdata)){
a<-unlist(gametesdata[i])
a[which(a==2)]<-1  # dominant model,change 2 to 1
interdata[[i]]<-a
}
finaldata<-list()
finaldata[[1]]<-interdata[[length(interdata)-2]]  # move a to first column
finaldata[[2]]<-interdata[[length(interdata)-1]]
for (i in 1:(length(interdata)-3)){
finaldata[[i+2]]<-interdata[[i]]
}
finaldata[[length(interdata)]]<-interdata[[length(interdata)]]
setwd('..')
setwd('..')
setwd('..')
write.table(finaldata,file = "./data/IECS.csv",sep = ",",row.names = FALSE,col.names=FALSE)  # write the IECS data to file with colnames
MDRpredata<-read.csv("./data/IECS.csv")  # read IECS data without colnames
write.table(MDRpredata,file = "./data/IECSS.txt",sep = ",",row.names = FALSE,col.names=FALSE)  # write the source data to file without colnames for BOOST
MDRdata<-list()  # initialize the MDRdata
MDRdata[[1]]<-MDRpredata[[length(MDRpredata)]]  # put the MDRdata result to the first column
for (i in 1:(length(MDRpredata)-1)){
b<-(MDRpredata[[i]])
MDRdata[[i+1]]<-b  # put the other variables
}
write.table(MDRdata,file = "./data/MDR.csv",sep = ",",row.names = FALSE,col.names=FALSE)  # write the MDR data to file
write.table(MDRdata,file = "./data/BOOST.txt",sep = "  ",row.names = FALSE,col.names=FALSE)  # write the BOOST data to file
}