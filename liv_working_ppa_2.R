setwd("~/bioinfofinal")

library(ape)
library(seqinr)

ppa_df<-read.csv("ppa_df_clean.df")
ppafasta <- read.fasta("ppa-fasta-tree")
ppaaligned <- read.alignment("ppa-fasta-tree", format = "fasta", forceToLower = TRUE)
ppacons <- seqinr::consensus(ppaaligned)
ppaconsensus <- as.data.frame.character(ppacons)
comparison_matrix <- t(read.dna("ppa-fasta-tree", format="fasta", as.character = TRUE))

View(comparison_matrix)
View(ppaconsensus)

numberofsequences <- ncol(comparison_matrix)
ppaconsensus_length <- nrow(ppaconsensus)

ts_count <- matrix(data = 0, nrow=ppaconsensus_length)

for(n in 1:numberofsequences){
for(x in 1:ppaconsensus_length){
  if(ppaconsensus[x,1] == "a" & comparison_matrix[x,n] != "a"){
    ts_count[x,] <- ts_count[x,]+1
  }
  if(ppaconsensus[x,1] == "t" & comparison_matrix[x,n] != "t"){
    ts_count[x,] <- ts_count[x,]+1
  }
  if(ppaconsensus[x,1] == "g" & comparison_matrix[x,n] != "g"){
    ts_count[x,] <- ts_count[x,]+1
  }
  if(ppaconsensus[x,1] == "c" & comparison_matrix[x,n] != "c"){
    ts_count[x,] <- ts_count[x,]+1
  }
}}


ts_count
ts_count/numberofsequences->meanfreq

meanfreq
Locus<-c(1:398)
meanfreqdf<-data.frame(Locus)
meanfreqdf$MeanFrequency<-meanfreq

View(meanfreqdf)

#most frequent mutations locations
order_ppa<-order(meanfreqdf$MeanFrequency, decreasing=T)
meanfreqdf[order_ppa,]->mostfrequentmutations

#for a better visual 
data.frame(mostfrequentmutations)->df
View(df)

#mutation frequency plot 
plot(muty_meanfreqdf, main="Mutation Frequencies", pch=2, col="blue")

