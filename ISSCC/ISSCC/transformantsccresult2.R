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
newpattern1<-secondsccresult[,1]
snp1<-c()
for (j in 1:length(newpattern1))
{
#snpcom<-unlist(strsplit(newpattern[j],",")) # 结果分割，提取第一个SNP号
#snp1no<-as.numeric(snpcom[1])
snp1no=newpattern1[j]
snp1[j]=variablelist[[snp1no]]
}
newpattern2<-secondsccresult[,2]
snp2<-c()
for (j in 1:length(newpattern2))
{
#snpcom<-unlist(strsplit(newpattern[j],",")) # 结果分割，提取第一个SNP号
#snp2no<-as.numeric(snpcom[2])
#snp2[j]=variablelist[[snp2no]]
snp2no=newpattern2[j]
snp2[j]=variablelist[[snp2no]]
}

#开始组合结果

#secondsccresultall<-cbind(unlist(snp1),unlist(snp2),secondsccresult[,3],secondsccresult[,4],secondsccresult[,5],secondsccresult[,6])
#通过构建数据框架组合结果
secondsccresultall<-data.frame(snp1=unlist(snp1),snp2=unlist(snp2),Coverage=secondsccresult[,3],Consistency=secondsccresult[,4],pvalue=secondsccresult[,5],Bpvalue=secondsccresult[,6])
write.table(secondsccresultall,file = "./result/transformedantsccresult2.csv",sep = ",",row.names = FALSE,col.names=TRUE)  # write
