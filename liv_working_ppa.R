setwd("~/bioinfofinal")

library(ape)
library(seqinr)
ppadf<-read.csv("ppa_df_clean.df")

View(ppaconsensus_matrix)

ppafasta <- read.fasta("ppa-fasta-tree")
ppaaligned <- read.alignment("ppa-fasta-tree", format = "fasta", forceToLower = T)
ppaconsensus_matrix <- read.dna("ppa-fasta-tree", format="fasta", as.character = TRUE)

meanFreq <- function(ppafasta){
  library(seqinr)
  numberofsequences <- length(ppafasta)
  ppaconsensus_length <- length(ppaconsensus)
  number_column <- seq(1, ppaconsensus_length)
  ppanewdf <- data.frame("num" = number_column, "MeanFreq" = 0, "wtnt" = ppaconsensus)
  for(x in 1:ppaconsensus_length){
    current_base <- ppaconsensus[x]
    current_matrix_base_count <- ppadf$Sequence
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
    ppanewdf$meanfreq<- ts_count/number_of_seqs
  }
  ppanewdf$wtnt<-as.character(ppanewdf$wtnt)
  return(ppanewdf)
}

View(ppanewdf)






    