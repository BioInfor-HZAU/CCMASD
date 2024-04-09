# change to RS
changetors <-
function(x,y){
a<-strsplit(x,'->')
b<-a[[1]][[1]]
c<-strsplit(b,'V')
d<-c[[1]][[2]]
e<-y[1,]
f<-y[2,]
for (i in 1:length(e)){
if (d==e[[i]]){
return (f[[i]])
}
}
}
write.table("condition",'./result/sccconresult.txt',append=T,col.names=F,row.names=F,eol='\t')
write.table("consistency",'./result/sccconresult.txt',append=T,col.names=F,row.names=F,eol='\n')
rs<-read.csv(file.choose(),header=F) 
conrs<-read.csv(file.choose(),header=T,sep = "\t")
for (i in 1:length(conrs[[1]])){
			r<-conrs[i,1]
			s<-strsplit(r,',')
			x<-changetors(s[[1]][[1]],rs)
			write.table(x,'./result/sccconresult.txt',append=T,col.names=F,row.names=F,eol='\t')
			write.table(s[[1]][[2]],'./result/sccconresult.txt',append=T,col.names=F,row.names=F,eol='\n')
			}
