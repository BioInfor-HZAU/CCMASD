setwd("./aisscc-test")
print("Please select the new cs data5:") 
newdata<-read.csv(file.choose())  # choose the new cs data
variable<-colnames(newdata)  # get the variable names
variablelist<-list()
for (i in 1:(length(variable)-1)){
variablenum1<-unlist(strsplit(variable[[i]],split='V'))  # delete the V
variablenum<-unlist(strsplit(variablenum1,split='  '))  # delete the space
variablelist<-append(variablelist,variablenum)
}
print("Please select the fifth result:") 
secondsccresult<-read.csv(file.choose())  # choose the fifth result
newpattern<-secondsccresult[,1]
sourcepattern<-list()
for (i in 1:(length(newpattern)))
{
#pattern<-chartr('->','  ',newpattern[[i]])
#patternvec<-unlist(strsplit(pattern,split='  '))  # delete the space
newp<-newpattern[[i]]
pattern<-unlist(chartr(',',' ',newp))  # delete the comma
patternvec<-unlist(strsplit(pattern,split=' '))  # delete the space
patternsourcevec<-c()
for (j in 1:length(patternvec))
{
patternvecasnum<-as.numeric(patternvec[[j]])
patternsourcevec<-paste(patternsourcevec,variablelist[[patternvecasnum]])
}
sourcepattern<-append(sourcepattern,patternsourcevec)
}
secondsccresult[,1]<-unlist(sourcepattern)
write.table(secondsccresult,file = "./result/transformedresult5.csv",sep = ",",row.names = FALSE,col.names=TRUE)  # write
