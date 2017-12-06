#download this package to access GenBank from R!
install.packages("rentrez")
library(rentrez)
library(seqinr)

#defines organims and gene of interest 
Helicobacter_ppa<-"Helicobacter pylori[Organism] AND ppa[Gene]"

#searches Genbank for what you're looking for (limited to 40 sequences)
Helicobacter_search<- entrez_search(db="nuccore", term=Helicobacter_ppa, retmax=40)  

#associates GenBank IDs with sequences 
Helicobacter_ppa_seqs<-entrez_fetch(db="nuccore", 
                                    id=Helicobacter_search$ids, 
                                    rettype="fasta")

#makes everything into a fasta file
write(Helicobacter_ppa_seqs, "Helicobacter_ppa.fasta", sep="\n")

#reads data as a fasta file 
Helicobacter_seqinr_ppa<-read.fasta(file="Helicobacter_ppa.fasta")

