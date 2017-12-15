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

for(x in 1:ppaconsensus_length){
  if(ppaconsensus[x,1] == "a" & comparison_matrix[x,1] == "a"){
    ts_count[x,] <- ts_count[1]+1
  }
  if(ppaconsensus[x,1] == "a" & comparison_matrix[x,1] != "a"){
    ts_count[x,] <- ts_count[1]+0
  }
}


ts_count
ts_count/numberofsequences






###############

number_column <- seq(1, ppaconsensus_length)
ppanewdf <- data.frame("num" = number_column, "MeanFreq" = 0, "wtnt" = ppaconsensus)


for(x in 1:ppaconsensus_length){
    current_base <- ppaconsensus[x,2]
    current_matrix_base_count <- comparison_matrix[x,2]
    ts_count <- 0
    if(current_base == "a"){
      ts_count <- current_matrix_base_count[["g"]]
    }
    if(current_base == "a"){
      ts_count <- current_matrix_base_count[["t"]]
    }
    if(current_base == "a"){
      ts_count <- current_matrix_base_count[["c"]]
    }
    if(current_base == "g"){
      ts_count <- current_matrix_base_count[["a"]]
    }
    if(current_base == "g"){
      ts_count <- current_matrix_base_count[["t"]]
    }
    if(current_base == "g"){
      ts_count <- current_matrix_base_count[["c"]]
    }
    if(current_base == "c"){
      ts_count <- current_matrix_base_count[["t"]]
    }
    if(current_base == "c"){
      ts_count <- current_matrix_base_count[["a"]]
    }
    if(current_base == "c"){
      ts_count <- current_matrix_base_count[["g"]]
    }
    if(current_base == "t"){
      ts_count <- current_matrix_base_count[["c"]]
    }
    if(current_base == "t"){
      ts_count <- current_matrix_base_count[["a"]]
    }
    if(current_base == "t"){
      ts_count <- current_matrix_base_count[["g"]]
    }
    ppanewdf[,2]<- ts_count/numberofsequences
  }

ppanewdf$wtnt<-as.character(ppanewdf$wtnt)
return(ppanewdf)

View(ppanewdf)