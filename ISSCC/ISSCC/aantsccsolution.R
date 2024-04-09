setwd("./aisscc-test")
library(aisscc)
print("Please select the cs data:") 
sccsamples<-read.csv(file.choose(),head=T)  # 读取数据
mvsccsamples<-read.csv(file.choose())  # choose the new mv data
threshold=0.1
antnum=2000
group=5
rou=0.05
rate=0.1
rule=1
startaisscctime<-Sys.time()  # start timing
aantsccsolution<-aantscc(Ant_Num=antnum,group=group,covthreshold=threshold,sccsamples=sccsamples)
endaisscctime<-Sys.time()  # end timing
analysistime<-endaisscctime-startaisscctime  # calculate the time
extractanalysistime<-format(analysistime,format="%M")  # extract time
print("Please select the new mv data:") 

snps<-mvsccsamples[,1:(ncol(mvsccsamples)-1)]
class<-mvsccsamples[,ncol(mvsccsamples)]
# 开始按阶数计算并逐列写入结果

# 一阶
patt<-aantsccsolution$newResult[[1]]
if (length(patt)!=0){
cove<-lapply(patt,coverage,samples=sccsamples)
cons<-lapply(patt,consistency,samples=sccsamples)
#pval<-lapply(patt,chisquare,samples=sccsamples)
# chisquare
pv<-lapply(patt,chi2test,mvsccsamples)
pvaluevec<-unlist(pv)

# bocorrection
#bpv<-lapply(screencom,bocorrection,snps,pvaluevec)
N=ncol(snps)
bpv<-mapply(bocorrection,patt,pvaluevec,N)   # 可以传入两个以上向量参与运算
bpvaluevec<-unlist(bpv)

snp1=list()
for (i in 1:length(patt)){
snp1=append(snp1,patt[[i]][1])
}
oneorderdataframe=data.frame(SNP1=unlist(snp1),Coverage=unlist(cove),Consistency=unlist(cons),Pvalue=pvaluevec,Bpvalue=bpvaluevec)
#twoorderdataframe
write.csv(oneorderdataframe,'./result/aantsccresult1.csv',append=T,col.names=F,row.names=F)
}
# 二阶
pattt<-aantsccsolution$newResult[[2]]
if (length(pattt)!=0){
patt=list()  # 每个组合升序排列
for (j in 1:length(pattt)){
orderpattt=sort(pattt[[j]])
patt[[j]]=orderpattt
}
cove<-lapply(patt,coverage,samples=sccsamples)
cons<-lapply(patt,consistency,samples=sccsamples)
# chisquare
pv<-lapply(patt,chi2test,mvsccsamples)
pvaluevec<-unlist(pv)

# bocorrection
#bpv<-lapply(screencom,bocorrection,snps,pvaluevec)
N=ncol(snps)
bpv<-mapply(bocorrection,patt,pvaluevec,N)   # 可以传入两个以上向量参与运算
bpvaluevec<-unlist(bpv)
snp1=list()
for (i in 1:length(patt)){
snp1=append(snp1,patt[[i]][1])
}
snp2=list()
for (i in 1:length(patt)){
snp2=append(snp2,patt[[i]][2])
}
twoorderdataframe=data.frame(SNP1=unlist(snp1),SNP2=unlist(snp2),Coverage=unlist(cove),Consistency=unlist(cons),Pvalue=pvaluevec,Bpvalue=bpvaluevec)
#twoorderdataframe
write.csv(twoorderdataframe,'./result/aantsccresult2.csv',append=T,col.names=F,row.names=F)
}
# 三阶
pattt<-aantsccsolution$newResult[[3]]
if (length(pattt)!=0){
patt=list()  # 每个组合升序排列
for (j in 1:length(pattt)){
orderpattt=sort(pattt[[j]])
patt[[j]]=orderpattt
}
cove<-lapply(patt,coverage,samples=sccsamples)
cons<-lapply(patt,consistency,samples=sccsamples)
# chisquare
pv<-lapply(patt,chi2test,mvsccsamples)
pvaluevec<-unlist(pv)

# bocorrection
#bpv<-lapply(screencom,bocorrection,snps,pvaluevec)
N=ncol(snps)
bpv<-mapply(bocorrection,patt,pvaluevec,N)   # 可以传入两个以上向量参与运算
bpvaluevec<-unlist(bpv)
snp1=list()
for (i in 1:length(patt)){
snp1=append(snp1,patt[[i]][1])
}
snp2=list()
for (i in 1:length(patt)){
snp2=append(snp2,patt[[i]][2])
}
snp3=list()
for (i in 1:length(patt)){
snp3=append(snp3,patt[[i]][3])
}
threeorderdataframe=data.frame(SNP1=unlist(snp1),SNP2=unlist(snp2),SNP3=unlist(snp3),Coverage=unlist(cove),Consistency=unlist(cons),Pvalue=pvaluevec,Bpvalue=bpvaluevec)
#threeorderdataframe
write.csv(threeorderdataframe,'./result/aantsccresult3.csv',append=T,col.names=F,row.names=F)
}
# 四阶
pattt<-aantsccsolution$newResult[[4]]
if (length(pattt)!=0){
patt=list()  # 每个组合升序排列
for (j in 1:length(pattt)){
orderpattt=sort(pattt[[j]])
patt[[j]]=orderpattt
}
cove<-lapply(patt,coverage,samples=sccsamples)
cons<-lapply(patt,consistency,samples=sccsamples)
# chisquare
pv<-lapply(patt,chi2test,mvsccsamples)
pvaluevec<-unlist(pv)

# bocorrection
#bpv<-lapply(screencom,bocorrection,snps,pvaluevec)
N=ncol(snps)
bpv<-mapply(bocorrection,patt,pvaluevec,N)   # 可以传入两个以上向量参与运算
bpvaluevec<-unlist(bpv)
snp1=list()
for (i in 1:length(patt)){
snp1=append(snp1,patt[[i]][1])
}
snp2=list()
for (i in 1:length(patt)){
snp2=append(snp2,patt[[i]][2])
}
snp3=list()
for (i in 1:length(patt)){
snp3=append(snp3,patt[[i]][3])
}
snp4=list()
for (i in 1:length(patt)){
snp4=append(snp4,patt[[i]][4])
}
fourorderdataframe=data.frame(SNP1=unlist(snp1),SNP2=unlist(snp2),SNP3=unlist(snp3),SNP4=unlist(snp4),Coverage=unlist(cove),Consistency=unlist(cons),Pvalue=pvaluevec,Bpvalue=bpvaluevec)
#threeorderdataframe
write.csv(fourorderdataframe,'./result/aantsccresult4.csv',append=T,col.names=F,row.names=F)
}
# 五阶
pattt<-aantsccsolution$newResult[[5]]
if (length(pattt)!=0){
patt=list()  # 每个组合升序排列
for (j in 1:length(pattt)){
orderpattt=sort(pattt[[j]])
patt[[j]]=orderpattt
}
cove<-lapply(patt,coverage,samples=sccsamples)
cons<-lapply(patt,consistency,samples=sccsamples)
# chisquare
pv<-lapply(patt,chi2test,mvsccsamples)
pvaluevec<-unlist(pv)

# bocorrection
#bpv<-lapply(screencom,bocorrection,snps,pvaluevec)
N=ncol(snps)
bpv<-mapply(bocorrection,patt,pvaluevec,N)   # 可以传入两个以上向量参与运算
bpvaluevec<-unlist(bpv)
snp1=list()
for (i in 1:length(patt)){
snp1=append(snp1,patt[[i]][1])
}
snp2=list()
for (i in 1:length(patt)){
snp2=append(snp2,patt[[i]][2])
}
snp3=list()
for (i in 1:length(patt)){
snp3=append(snp3,patt[[i]][3])
}
snp4=list()
for (i in 1:length(patt)){
snp4=append(snp4,patt[[i]][4])
}
snp5=list()
for (i in 1:length(patt)){
snp5=append(snp5,patt[[i]][5])
}
fiveorderdataframe=data.frame(SNP1=unlist(snp1),SNP2=unlist(snp2),SNP3=unlist(snp3),SNP4=unlist(snp4),SNP5=unlist(snp5),Coverage=unlist(cove),Consistency=unlist(cons),Pvalue=pvaluevec,Bpvalue=bpvaluevec)
#threeorderdataframe
write.csv(fiveorderdataframe,'./result/aantsccresult5.csv',append=T,col.names=F,row.names=F)
}

write.table("aantscc:",'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("Ant_Num:",'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(antnum,'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("group:",'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(group,'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("coverage threshold:",'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(threshold,'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("rou:",'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(rou,'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("rate:",'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(rate,'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("rule:",'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(rule,'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table("aantscc analysistime:",'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')
write.table(extractanalysistime,'./result/aantsccresult.txt',append=T,col.names=F,row.names=F,eol='\n')