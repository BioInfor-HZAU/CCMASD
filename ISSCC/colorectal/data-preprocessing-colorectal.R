setwd("./datapreprocessing")
library(snpStats)
library(data.table)
ob.plink<-read.plink(bed=(file.choose()), 
                       bim=(file.choose()), 
                       fam=(file.choose()))
snps<-ob.plink
geno<-snps$genotypes
#geno

individuals<-snps$fam
#head(individuals)

annotation<-snps$map
#head(annotation)

options(max.print = 1000000)

#write.table(annotation,file = "./result/annotation.csv",sep = ",",row.names = FALSE,col.names = FALSE)

#提取对照组
individualsCtrl <- individuals[individuals$affected == 1, ]
#individualsCtrl <- individuals[individuals$affected == -9, ]
genoCtrl <- geno[rownames(individualsCtrl), ]
#转换为shang编码，此时不能转换，否则报错。
#genoCtrl[genoCtrl=="3"]=4
#genoCtrl[genoCtrl=="1"]=3
#genoCtrl[genoCtrl=="4"]=1
#dim(genoCtrl)
#colnames(genoCtrl)
#control<-vector("2",nrow(genoCtrl))
control<-rep(2,nrow(genoCtrl))
#genoCtrlall<-cbind(genoCtrl,control)
#write.table(genoCtrlall,file = "./result/genoCtrl.csv",sep = ",",row.names = FALSE,col.names = FALSE)

#提取案例组
individualsCase <- individuals[individuals$affected == 2, ]
#individualsCase <- individuals[individuals$affected == -9, ]
genoCase <- geno[rownames(individualsCase), ]
#转换为shang编码
#genoCase[genoCase=="3"]=4
#genoCase[genoCase=="1"]=3
#genoCase[genoCase=="4"]=1
#genoCase
case<-rep(1,nrow(genoCase))
#write.table(genoCase,file = "./result/genoCase.csv",sep = ",",row.names = FALSE,col.names = FALSE)

#合并写到一起

genoa<-rbind(genoCtrl,genoCase)
disease<-append(control,case)

#总的数据按列合并
snpmatrix<-cbind(genoa,disease)
#write.table(snpmatrix,file = "./result/colorectalsourcedata.csv",sep = ",",row.names = FALSE,col.names = T)
#两种方式都一样，仅仅是有引号和没有引号的区别
fwrite(snpmatrix,file = "./result/colorectalsourcedata.csv",sep = ",",row.names = FALSE,col.names = T)

#转为显性模型
setwd("./datapreprocessing")
#install.packages("data.table")
library(data.table)
startisscctime<-Sys.time()  # start timing
print("Please select the mv data with miss:") 
mvsccsamples<-fread(file.choose(),header=F,data.table=F)  # choose the mv data of last step
zz<-mvsccsamples
title1<-zz[1,]  # title
a<-length(zz[,1])
snppre<-zz[(2:a),]
b<-length(zz[1,])-1
snp<-snppre[,(1:b)]
disease<-snppre[,(b+1)]
#snp[snp=="0"]=NA
#snp[snp=="0"]=0  # 缺失值直接赋值0
snp[snp=="1"]=0
snp[snp=="2"]=1
snp[snp=="3"]=1
disease[disease=="2"]=0
datasetdom1<-cbind(snp,disease)  # 按列合并
title<-list()    # 拆成单个的字符串
for (i in 1:length(title1)){
title<-append(title,title1[[i]][1])
}
datasetdom<-rbind(title,datasetdom1)  # 添加标题

#整体写入文件
#write.table(datasetdom,file = "./result/coronarydatamissto1-cs.csv",sep = ",",row.names = FALSE,col.names = FALSE)
fwrite(datasetdom,file = "./result/colorectaldomdata0.csv",sep = ",",row.names = FALSE,col.names = F)

#计算处理时长并写入文件
endisscctime<-Sys.time()  # end timing
analysistime<-endisscctime-startisscctime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
write.table(extractanalysistime,'./result/clearsetresult.txt',append=T,col.names=F,row.names=F,eol='\n')

#转为显性模型
setwd("./datapreprocessing")
#install.packages("data.table")
library(data.table)
startisscctime<-Sys.time()  # start timing
print("Please select the mv data with miss:") 
mvsccsamples<-fread(file.choose(),header=F,data.table=F)  # choose the mv data of last step
zz<-mvsccsamples
title1<-zz[1,]  # title
a<-length(zz[,1])
snppre<-zz[(2:a),]
b<-length(zz[1,])-1
snp<-snppre[,(1:b)]
disease<-snppre[,(b+1)]
#snp[snp=="0"]=NA
snp[snp=="0"]=4  # 缺失值先赋值4，再赋值1
snp[snp=="1"]=0
snp[snp=="2"]=1
snp[snp=="3"]=1
snp[snp==4]=1
disease[disease=="2"]=0
datasetdom1<-cbind(snp,disease)  # 按列合并
title<-list()    # 拆成单个的字符串
for (i in 1:length(title1)){
title<-append(title,title1[[i]][1])
}
datasetdom<-rbind(title,datasetdom1)  # 添加标题

#整体写入文件
#write.table(datasetdom,file = "./result/coronarydatamissto1-cs.csv",sep = ",",row.names = FALSE,col.names = FALSE)
fwrite(datasetdom,file = "./result/colorectaldomdata1.csv",sep = ",",row.names = FALSE,col.names = F)

#计算处理时长并写入文件
endisscctime<-Sys.time()  # end timing
analysistime<-endisscctime-startisscctime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
write.table(extractanalysistime,'./result/clearsetresult.txt',append=T,col.names=F,row.names=F,eol='\n')

setwd("./datapreprocessing")
library(data.table)
print("Please select the screened data:") 
#sourcedata<-read.csv(file.choose())  # choose the screened data
#https://www.jianshu.com/p/6ae88a24e43d, data.table参数默认为data.table，dat.table与data.frame的差别
sourcedata<-fread(file.choose(),data.table=F)
#读取条件变量矩阵
conditiondata<-sourcedata[,1:(ncol(sourcedata)-1)] 
#转换为shang编码，由colorectal的示例中得到进行如下转化。
conditiondata[conditiondata==3]=4
conditiondata[conditiondata==1]=3
conditiondata[conditiondata==4]=1
#和结果变量按列组合
resultnum<-ncol(sourcedata)
disease<-sourcedata[,resultnum]
datash<-cbind(conditiondata,disease)
#写入文件
#write.table(datash,file = "./result/obesitysourcedata-sh.csv",sep = ",",row.names = FALSE,col.names = T)
fwrite(datash,file = "./result/colorectalscreeneddata-sh.csv",sep = ",",row.names = FALSE,col.names = T)

setwd("./datapreprocessing")
#install.packages("data.table")
library(data.table)
startisscctime<-Sys.time()  # start timing
#选择源数据
print("Please select the source data:") 
sccsamples<-fread(file.choose(),header=F,skip=1,data.table=F)  # choose the source data，第一行不作为列名，忽略第一行的数值，方便后面筛选
#选择要删除的SNP
print("Please select the screened .txt result") 
screenedresult<-read.table(file.choose(),header=F)  # choose the screened .txt result 
variable<-colnames(sccsamples)  # get the variable names
pattlist<-list()
for (i in 1:length(screenedresult[,1])){
pattern<-paste('V',screenedresult[i,1],sep="")  # 增加"V",中间无空格
#patternvec<-unlist(pattern)
pattlist<-append(pattlist,pattern)
}

#按列添加
newsccsamples<-sccsamples[,1] # 第一列作为引子,后面方便删除
colnameslist<-list()
for (i in 1:(length(variable)-1)){
if (!(variable[[i]] %in% pattlist)){   # 不在列当中
addcol<-sccsamples[,which(names(sccsamples)==variable[[i]])]
newsccsamples<-cbind(newsccsamples,addcol)
colnameslist<-append(colnameslist,variable[[i]])
}
}

#赋值结果列
newsccsamples<-cbind(newsccsamples,sccsamples[[length(variable)]])
colnameslistwithresult<-append(colnameslist,variable[[length(variable)]])

#去掉旧数据
newsccsamples<-newsccsamples[,-1]
colnames(newsccsamples)<-unlist(colnameslistwithresult)
#写入文件
#write.table(sccsamples,file = "./result/newdata1.csv",sep = ",",row.names = FALSE,col.names=TRUE)  # write the newdata to file

#筛选并加入RS号，直接读第一行
#sccsamplesall<-read.csv(file.choose(),header=T)  # choose the sh data,数据少读了一行,但不影响后面的结果
#snpvariables<-colnames(sccsamplesall)  # get the variable names,
#https://www.codenong.com/39110755/#:~:text=%E4%B8%80%E7%A7%8D%E6%96%B9%E6%B3%95%E6%98%AF%E4%BD%BF%E7%94%A8%E4%B8%A4%E4%B8%AA%20read.csv%20%E5%91%BD%E4%BB%A4%EF%BC%8C%E7%AC%AC%E4%B8%80%E4%B8%AA%E8%AF%BB%E5%8F%96%E6%A0%87%E5%A4%B4%EF%BC%8C%E7%AC%AC%E4%BA%8C%E4%B8%AA%E8%AF%BB%E5%8F%96%E6%95%B0%E6%8D%AE%EF%BC%9A%201%202%203%20headers%20%3D,%3D%203%2C%20header%20%3D%20F%29%20colnames%20%28df%29%3D%20headers
#选取源数据集，和前两步一样
snpvariables<-fread(file.choose(),header=F,nrows=1,data.table=F)  #不把第一行作为列名读取，取第一行数据作为列名

snplist<-list()
for (j in 1:(length(snpvariables)-1)){
if (!(j %in% unlist(screenedresult))){   # 不在列当中
snplist<-append(snplist,snpvariables[j])
}
}
snplist<-append(snplist,"disease")
#sccsamples[1,]=snplist
newsccsamples<-rbind(snplist,newsccsamples)

#去掉0的行，结果只剩0行。
#sccsampleswithou0<-sccsamples[apply(sccsamples!= 0,1,all),]

#写入文件
fwrite(newsccsamples,file = "./result/colorectalscreeneddata.csv",sep = ",",row.names = FALSE,col.names=FALSE)
#尝试第二种方法,结果失败
#library(dplyr)
#df_new <- filter_if(sccsamples, is.numeric , all_vars((.) != 0 ))

#计算处理时长并写入文件
endisscctime<-Sys.time()  # end timing
analysistime<-endisscctime-startisscctime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
write.table(extractanalysistime,'./result/deleteprocesstime.txt',append=T,col.names=F,row.names=F,eol='\n')


