setwd("./comparison")
# judge whether two SNPs are the same function
judge2pattern <-
function(x,y){ 
a=x[[1]] %in% y
b=x[[2]] %in% y
c<-a&&b
return(c)
}

# strsplit combination
strsplitpattern <-
function(x){
a<-strsplit(x,'<->')
return(a[[1]]) 
}

scceqresultwithtime<-read.csv(file.choose(),header=T)  # choose the data
x<-length(scceqresultwithtime[[1]])
#scceqresult<-scceqresultwithtime[-c(x),]
scceqresult<-scceqresultwithtime
for (i in 1:(length(scceqresult[[1]])-1))
#for (i in 1:(length(scceqresult[[1]])))
{
	for (j in (i+1):(length(scceqresult[[1]])))
	{	a<-strsplitpattern(scceqresult[[1]][[i]])
		b<-strsplitpattern(scceqresult[[1]][[j]])
		if(judge2pattern(a,b))
			{
			write.table(a[[1]],'./result/transformresult.txt',append=T,col.names=F,row.names=F,eol='\t')
			write.table(a[[2]],'./result/transformresult.txt',append=T,col.names=F,row.names=F,eol='\t')
			write.table(scceqresult[[2]][[i]],'./result/transformresult.txt',append=T,col.names=F,row.names=F,eol='\t')
			write.table(scceqresult[[3]][[i]],'./result/transformresult.txt',append=T,col.names=F,row.names=F,eol='\t')
			write.table(scceqresult[[4]][[i]],'./result/transformresult.txt',append=T,col.names=F,row.names=F,eol='\n')
			}
	}
}

# change to RS
changetors <-
function(x,y){
a<-strsplit(x,'V')
b<-a[[1]][[2]]
c<-y[1,]
d<-y[2,]
for (i in 1:length(c)){
if (b==c[[i]]){
return (d[[i]])
}
}
}
write.table("SNP1",'./result/equivalence.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table("SNP2",'./result/equivalence.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table("consistency",'./result/equivalence.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table("coverage",'./result/equivalence.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table("pvalue",'./result/equivalence.txt',append=T,col.names=F,row.names=F,eol='\n')
rs<-read.csv(file.choose(),header=F) 
#sccrs<-read.csv(file.choose(),header=T,sep = "\t")
sccrs<-read.csv("./result/transformresult.txt",header=F,sep = "\t")
for (i in (1:length(sccrs[[1]]))){
			m<-sccrs[i,1]
			n<-sccrs[i,2]
			x<-changetors(m,rs)
			y<-changetors(n,rs)
			write.table(x,'./result/equivalence.txt',append=T,col.names=F,row.names=F,eol='\t')
			write.table(y,'./result/equivalence.txt',append=T,col.names=F,row.names=F,eol='\t')
			write.table(sccrs[[3]][[i]],'./result/equivalence.txt',append=T,col.names=F,row.names=F,eol='\t')
			write.table(sccrs[[4]][[i]],'./result/equivalence.txt',append=T,col.names=F,row.names=F,eol='\t')
			write.table(sccrs[[5]][[i]],'./result/equivalence.txt',append=T,col.names=F,row.names=F,eol='\n')
			}
file.remove("./result/transformresult.txt")