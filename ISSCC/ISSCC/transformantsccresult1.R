setwd("./aisscc-test")
print("Please select the cs data:") 
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
write.table(secondsccresult,file = "./result/transformedantsccresult1.csv",sep = ",",row.names = FALSE,col.names=TRUE)  # write
