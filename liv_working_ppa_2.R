setwd("~/bioinfofinal")

library(ape)
library(seqinr)

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
ts_count/numberofsequences