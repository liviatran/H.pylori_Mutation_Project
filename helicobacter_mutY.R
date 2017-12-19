#download this package to access GenBank from R!
library(rentrez)
library(seqinr)
library(ape)

install.packages("genbankr")

#defines organims and gene of interest 
Helicobacter_mutY<-"Helicobacter pylori[Organism] AND mutY[Gene]"

#searches Genbank for what you're looking for (limited to 40 sequences)
Helicobacter_search_mutY<- entrez_search(db="nuccore", term=Helicobacter_mutY, retmax=40)  

#associates GenBank IDs with sequences 
Helicobacter_mutY_seqs<-entrez_fetch(db="nuccore", 
                                    id=Helicobacter_search_mutY$ids, 
                                    rettype="gb")


Helicobacter_mutY_seqs
#makes everything into a fasta file
write(Helicobacter_mutY_seqs, "Helicobacter_mutY.fasta", sep="\n")

#reads data as a fasta file 
Helicobacter_seqinr_mutY<-read.fasta(file="Helicobacter_mutY.fasta")

Helicobacter_seqinr_mutY

Hsummary<-entrez_summary(db="nuccore", id=Helicobacter_search_mutY$ids)



library(genbankr)

readGenBank("sequence3.gb")



library(genbankr)


#define file, using a file that has 2 elements
fileName <-"ppa-sequences-2-results.txt"

#read as string
singleString <- paste(readLines("sequence3.txt"), collapse=" ")

View(singleString)
gregexpr("ountry", singleString)q
