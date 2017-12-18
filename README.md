# File Explanations/Information
Bioinformatics Class Final Project
by Nicole Allen, Livia Tran, and Albert Wong

## Nicole's Files (In Order of Intended Use):

1. ppa-accessions.seq: list of ppa gene accession numbers for later use by Albert
2. mutY-accessions.seq: list of mutY gene accession numbers for later use by Albert
3.nicole_muty_cleaning_country2.R: code to take Albert's "mutY-clean.df" and remove all rows with no country listed
	3a. muty-tobecleaned: CSV file output of code
4. nicole_ppa_cleaning_country2.R: code to take Albert's "ppa-clean.df" and remove all rows with no country listed
	4a. ppa-tobecleaned: CSV file output of code
5. ppa-fasta-tree: fasta file generated for Livia containing accession number and country of each ppa sequence
6. muty-fasta-tree: fasta file generated for Livia containing accession number and country of each ppa sequence
7. PhyloTreeMini_mutY.R: Phylogenetic analysis of mutY genes based on consensus sequence from each country.
	7a. muty_consensus_nj: contains data needed to construct mutY phylogenetic tree based on neighbor-joining calculations/analysis
	7b. muty_consensus_upgma: contains data to construct mutY phylogenetic tree based on UPGMA calculations/analysis
8. PhyloTreeMini_ppa.R: Phylogenetic analysis of ppa genes based on consensus sequence from each country.
	8a. ppa_consensus_nj: contains data needed to construct ppa phylogenetic tree based on neighbor-joining calculations/analysis
	8b. ppa_consensus_upgma: contains data to construct ppa phylogenetic tree based on UPGMA calculations/analysis
9. PhyloTree_Plotting_Final.R: Plots both mutY and ppa phylogenetic trees based on output from "PhyloTreeMini" files.
	9a. muty_tree.png: Result of mutY phylogenetic tree ggtree plot
	9b. ppa_tree.png: Result of ppa phylogenetic tree ggtree plot
