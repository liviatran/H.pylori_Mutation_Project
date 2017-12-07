# Official Code for "Cleaning Up" GenBank Sequence Files
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

mutygb <- import(con = "mutY-seq20-full.gb")
View(sources(mutygb2))
getSeq(mutygb)

mutygb
str(mutygb)

showMethods("otherFeatures")
otherFeatures(mutygb)

accession(mutygb)
definition(mutygb)
locus(mutygb)
sources(mutygb)
intergenic(mutygb)
variants(mutygb)

mutyacc <- read.table("mutY-accessions.seq")
mutyacc