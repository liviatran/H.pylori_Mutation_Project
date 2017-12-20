#set working directory
setwd("~/bioinfofinal")

#load relevant libraries
library(ape)
library(seqinr)

#reads fasta file
mutyfasta <- read.fasta("muty-fasta-tree")

#aligns sequences from fasta file
mutyaligned <- read.alignment("muty-fasta-tree", format = "fasta", forceToLower = TRUE)

#finds consensus sequence from all data sequences
mutycons <- seqinr::consensus(mutyaligned)

#makes the consensus sequence into a data frame to match up with matrix 
mutyconsensus <- as.data.frame.character(mutycons)

#reads the fasta file into a DNA format 
muty_comparison_matrix <- t(read.dna("muty-fasta-tree", format="fasta", as.character = TRUE))

#stores columns of comparison matrix (i.e. nucleotides) into number of sequences
numberofsequences <- ncol(muty_muty_comparison_matrix)

#stores rows of ppa consensus into mutyconsensus_length 
mutyconsensus_length <- nrow(mutyconsensus)

#stores ts_count as 0 with the rows=to the consensensus length 
ts_count <- matrix(data = 0, nrow=mutyconsensus_length)

#for loop to add a count for when the consensus sequence does not match the matrix 
for(n in 1:numberofsequences){
  for(x in 1:mutyconsensus_length){
    if(mutyconsensus[x,1] == "a" & muty_comparison_matrix[x,n] != "a"){
      ts_count[x,] <- ts_count[x,]+1
    }
    if(mutyconsensus[x,1] == "t" & muty_comparison_matrix[x,n] != "t"){
      ts_count[x,] <- ts_count[x,]+1
    }
    if(mutyconsensus[x,1] == "g" & muty_comparison_matrix[x,n] != "g"){
      ts_count[x,] <- ts_count[x,]+1
    }
    if(mutyconsensus[x,1] == "c" & muty_comparison_matrix[x,n] != "c"){
      ts_count[x,] <- ts_count[x,]+1
    }
  }}


#calculates mean frequency
ts_count/numberofsequences->muty_meanfreq

#creates a data frame with locus and mean frequencies and stores into meanfreq variable
Locus<-c(1:420)
muty_meanfreqdf<-data.frame(Locus)
muty_meanfreqdf$MeanFrequency<-muty_meanfreq

#most frequent mutations locations
order_muty<-order(muty_meanfreqdf$MeanFrequency, decreasing=T)
muty_meanfreqdf[order_muty,]->mostfrequentmutations

#for a better visual 
data.frame(mostfrequentmutations)->df2
View(df2)

#mutation frequency plot 
plot(muty_meanfreqdf, main="MutY Gene Mutation Frequencies", pch=15, col="purple")->mutyplot
