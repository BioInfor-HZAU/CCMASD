setwd("./aisscc-test")
library(data.table)
print("Please select the screened data:") 
#sourcedata<-read.csv(file.choose())  # choose the screened data
#https://www.jianshu.com/p/6ae88a24e43d, data.table参数默认为data.table，dat.table与data.frame的差别
sourcedata<-fread(file.choose(),data.table=F)
#读取条件变量矩阵的列名，并生成序号
conditiondata<-colnames(sourcedata)
ordernum<-c(1:ncol(sourcedata))
#按列合并
contrast<-cbind(ordernum,conditiondata)
#写入文件
fwrite(contrast,file = "./result/contrasttable.csv",sep = ",",row.names = FALSE,col.names=FALSE)

