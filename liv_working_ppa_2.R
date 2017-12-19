#sets working directory
setwd("~/bioinfofinal")

#loads relevant libraries
library(ape)
library(seqinr)

#reads in fasta file
ppafasta <- read.fasta("ppa-fasta-tree")

#aligns sequences from fasta file
ppaaligned <- read.alignment("ppa-fasta-tree", format = "fasta", forceToLower = TRUE)

#finds consensus sequence from all data sequences
ppacons <- seqinr::consensus(ppaaligned)

#makes the consensus sequence into a data frame to match up with matrix 
ppaconsensus <- as.data.frame.character(ppacons)

#reads the fasta file into a DNA format 
comparison_matrix <- t(read.dna("ppa-fasta-tree", format="fasta", as.character = TRUE))

#stores columns of comparison matrix (i.e. nucleotides) into number of sequences
numberofsequences <- ncol(comparison_matrix)

#stores rows of ppa consensus into ppaconsensus_length 
ppaconsensus_length <- nrow(ppaconsensus)

#stores ts_count as 0 with the rows=to the consensensus length 
ts_count <- matrix(data = 0, nrow=ppaconsensus_length)

#for loop to add a count for when the consensus sequence does not match the matrix 
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


#calculates mean frequency
ts_count/numberofsequences->meanfreq

#creates a data frame with locus and mean frequencies and stores into meanfreq variable
Locus<-c(1:398)
meanfreqdf<-data.frame(Locus)
meanfreqdf$MeanFrequency<-meanfreq

#most frequent mutations locations
order_ppa<-order(meanfreqdf$MeanFrequency, decreasing=T)
meanfreqdf[order_ppa,]->mostfrequentmutations

#for a better visual 
data.frame(mostfrequentmutations)->df
View(df)

#mutation frequency plot 
plot(muty_meanfreqdf, main="PPA Gene Mutation Frequencies", pch=2, col="blue")->ppaplot

