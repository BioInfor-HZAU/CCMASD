setwd("./aisscc-test")
print("Please select the new data2:") 
#newdata<-read.csv(file.choose(),head=F)  # choose the new cs data
newdata<-read.csv(file.choose())  # choose the new cs data
#newdata<-read.csv(file.choose(),skip=1)  # choose the new cs data
variable<-colnames(newdata)  # get the variable names
variablelist<-list()
for (i in 1:(length(variable)-1)){
variablenum1<-unlist(strsplit(variable[[i]],split='V'))  # delete the V
variablenum<-unlist(strsplit(variablenum1,split='  '))  # delete the space
variablelist<-append(variablelist,variablenum)
}
print("Please select the deleting snp result:") 
#secondsccresult<-read.csv(file.choose())  # choose the second result
#newpattern<-secondsccresult[,1]
todeletesnp<-read.table(file.choose(),header=F)  # choose the result.txt file
todeletesnpmatrix<-as.matrix(todeletesnp)  # to matrix
todeletesnpvec<-as.vector(todeletesnpmatrix)  # to vector
#as.numeric(todeletesnpvec)
for (i in 1:length(variablelist)){
if (!(variablelist[i] %in% todeletesnpvec)){
write.table(as.numeric(variablelist[i]),'./result/SNPround5.txt',append=T,col.names=F,row.names=F,eol='\n')
}
}
