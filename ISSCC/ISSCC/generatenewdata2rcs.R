setwd("./aisscc-test")
print("Please select the source cs data:") 
sccsamples<-read.csv(file.choose(),header=F,skip=1)  # choose the source data
print("Please select the SNPround*.txt file") 
screenedresult<-read.table(file.choose(),header=F)  # choose the SNPround*.txt file 
variable<-colnames(sccsamples)  # get the variable names
pattlist<-list()
for (i in 1:length(screenedresult[,1])){
pattern<-paste('V',screenedresult[i,1],sep="")  # 增加"V",中间无空格
#patternvec<-unlist(pattern)
pattlist<-append(pattlist,pattern)
}

#按列增加
colnameslist<-list()
for (i in 1:(length(variable)-1)){
if ((variable[[i]] %in% pattlist)){
addcol<-sccsamples[,which(names(sccsamples)==variable[[i]])]
sccsamples<-cbind(sccsamples,addcol)
colnameslist<-append(colnameslist,variable[[i]])
}
}
#赋值结果列
sccsamples<-cbind(sccsamples,sccsamples[[length(variable)]])
colnameslistwithresult<-append(colnameslist,variable[[length(variable)]])
#去掉旧数据
sccsamples<-sccsamples[,-(1:length(variable))]
colnames(sccsamples)<-unlist(colnameslistwithresult)
#写入文件
write.table(sccsamples,file = "./result/newdata2rcs.csv",sep = ",",row.names = FALSE,col.names=TRUE)  # write the newdata to file

