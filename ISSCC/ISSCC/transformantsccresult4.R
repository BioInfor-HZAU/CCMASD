setwd("./aisscc-test")
print("Please select the new data:") 
newdata<-read.csv(file.choose())  # choose the new data
variable<-colnames(newdata)  # get the variable names
variablelist<-list()
for (i in 1:(length(variable)-1)){
variablenum1<-unlist(strsplit(variable[[i]],split='V'))  # delete the V
variablenum<-unlist(strsplit(variablenum1,split='  '))  # delete the space
variablelist<-append(variablelist,variablenum)
}
print("Please select the result:") 
secondsccresult<-read.csv(file.choose())  # choose the second result
newpattern<-secondsccresult[,1]
snp1<-c()
for (j in 1:length(newpattern))
{
snp1[j]=variablelist[[newpattern[j]]]
}
secondsccresult[,1]<-unlist(snp1)

newpattern<-secondsccresult[,2]
snp2<-c()
for (j in 1:length(newpattern))
{
snp2[j]=variablelist[[newpattern[j]]]
}
secondsccresult[,2]<-unlist(snp2)

newpattern<-secondsccresult[,3]
snp3<-c()
for (j in 1:length(newpattern))
{
snp3[j]=variablelist[[newpattern[j]]]
}
secondsccresult[,3]<-unlist(snp3)

newpattern<-secondsccresult[,4]
snp4<-c()
for (j in 1:length(newpattern))
{
snp4[j]=variablelist[[newpattern[j]]]
}
secondsccresult[,4]<-unlist(snp4)
write.table(secondsccresult,file = "./result/transformedantsccresult4.csv",sep = ",",row.names = FALSE,col.names=TRUE)  # write
