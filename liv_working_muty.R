setwd("~/bioinfofinal")

library(ape)
library(seqinr)

mutyfasta <- read.fasta("muty-fasta-tree")
mutyaligned <- read.alignment("muty-fasta-tree", format = "fasta", forceToLower = TRUE)
mutycons <- seqinr::consensus(mutyaligned)
mutyconsensus <- as.data.frame.character(mutycons)
muty_muty_comparison_matrix <- t(read.dna("muty-fasta-tree", format="fasta", as.character = TRUE))

View(muty_muty_comparison_matrix)
View(mutyconsensus)

numberofsequences <- ncol(muty_muty_comparison_matrix)
mutyconsensus_length <- nrow(mutyconsensus)

ts_count <- matrix(data = 0, nrow=mutyconsensus_length)

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


ts_count
ts_count/numberofsequences->muty_meanfreq

Locus<-c(1:420)
muty_meanfreqdf<-data.frame(Locus)
muty_meanfreqdf$MeanFrequency<-muty_meanfreq

View(muty_meanfreqdf)

order_muty<-order(muty_meanfreqdf$MeanFrequency, decreasing=T)
muty_meanfreqdf[order_muty,]->mostfrequentmutations

data.frame(mostfrequentmutations)->df
View(df)


plot(muty_meanfreqdf, main="MutY Gene Mutation Frequencies", pch=15, col="purple")->mutyplot
