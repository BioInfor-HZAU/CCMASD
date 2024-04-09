setwd("./aisscc-test")
print("Please select the mv source data:") 
mvsccsamples<-read.csv(file.choose(),header=F,skip=1)  # choose the source data
print("Please select the SNPround*.txt file") 
screenedresult<-read.table(file.choose(),header=F)  # choose the SNPround*.txt file
variable1<-colnames(mvsccsamples)  # get the variable1 names
pattlist<-list()
for (i in 1:length(screenedresult[,1])){
pattern<-paste('V',screenedresult[i,1],sep="")  # 增加"V",中间无空格
#patternvec<-unlist(pattern)
pattlist<-append(pattlist,pattern)
}

#按列增加
colnameslist<-list()
for (i in 1:(length(variable1)-1)){
if ((variable1[[i]] %in% pattlist)){
addcol<-mvsccsamples[,which(names(mvsccsamples)==variable1[[i]])]
mvsccsamples<-cbind(mvsccsamples,addcol)
colnameslist<-append(colnameslist,variable1[[i]])
}
}
#赋值结果列
mvsccsamples<-cbind(mvsccsamples,mvsccsamples[[length(variable1)]])
colnameslistwithresult<-append(colnameslist,variable1[[length(variable1)]])
#去掉旧数据
mvsccsamples<-mvsccsamples[,-(1:length(variable1))]
colnames(mvsccsamples)<-unlist(colnameslistwithresult)
#写入文件
write.table(mvsccsamples,file = "./result/newdata5rmv.csv",sep = ",",row.names = FALSE,col.names=TRUE)  # write the newdata to file

