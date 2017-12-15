setwd("~/bioinfofinal")

library(ape)
library(seqinr)


ppafasta<-read.fasta("ppa-fasta-tree")

ppaaligned<-read.alignment("ppa-fasta-tree", format="fasta")
ppamatrix<-read.dna("ppa-fasta-tree", format="fasta", as.character=TRUE)

cons<-seqinr::consensus(ppaaligned)

cons

for(i in 1:ppadf$Sequence){
  if(ppadf$Sequence=!"cons"){
    mutfreq<-length(which(ppamatrix[,i]==cons[i]))/(nrow(ppamatrix))}
  }

  View(ppamatrix)


  





    