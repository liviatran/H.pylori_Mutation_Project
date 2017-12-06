#download this package to access GenBank from R!
library(rentrez)
library(seqinr)

#defines organims and gene of interest 
Helicobacter_mutY<-"Helicobacter pylori[Organism] AND mutY[Gene]"

#searches Genbank for what you're looking for (limited to 40 sequences)
Helicobacter_search_mutY<- entrez_search(db="nuccore", term=Helicobacter_mutY, retmax=40)  

#associates GenBank IDs with sequences 
Helicobacter_mutY_seqs<-entrez_fetch(db="nuccore", 
                                    id=Helicobacter_search_mutY$ids, 
                                    rettype="fasta")

#makes everything into a fasta file
write(Helicobacter_mutY_seqs, "Helicobacter_mutY.fasta", sep="\n")

#reads data as a fasta file 
Helicobacter_seqinr_mutY<-read.fasta(file="Helicobacter_mutY.fasta")

Helicobacter_seqinr_mutY[1]
