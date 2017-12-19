#livia's working script 
library(seqinr)
library(ape)
library(genbankr)
mutyseq <- read.fasta(file="mutY-sequences.gb", as.string=TRUE, forceDNAtolower=FALSE)
mutyseq <- read.GenBank("LC271864.1", species.names =TRUE, as.character=FALSE)
str(mutyseq)


mutyseq <- read.dna(file="mutY-sequences.gb", format = "sequential")
install.packages("genbankr")

source("https://bioconductor.org/biocLite.R")
biocLite("genbankr")

mutygb <- import(con = "sequence(1).gb")
View(sources(mutygb))
getSeq(mutygb)


read.csv("ppa-tobecleaned")->ppadf
View(ppadf)
library(beepr)

for(i in 1:nrow(ppadf))
  {toString(ppadf$Sequence[i]) -> ppadf$SeqString[i]
  if(i==nrow(ppadf)){beep()}
}

library(seqinr)
library(ape)
class(ppadf$SeqString)


write.fasta(sequences=ppadf$SeqString, names=ppadf$V1, file.out="ppaseqs.fasta")

ppaseqinr<-read.fasta(file="ppaseqs.fasta")
ppaseqinr

ppaaligned<-read.alignment(file="ppaseqs.fasta", format="fasta", forceToLower = TRUE)
ppamatrix<-read.dna("ppaseqs.fasta", format="fasta", as.character=TRUE)

as.matrix.alignment(ppaaligned)

cons<-seqinr::consensus(ppamatrix)
cons

write.fasta(list(ppadf$SeqString), names=(list(ppadf$V1)), file.out="ppaseqs.fasta")
write.fasta(ppadf$SeqString, names=list(ppadf$V1), file.out="ppaseqs.fasta")
