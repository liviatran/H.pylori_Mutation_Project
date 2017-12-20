# File Explanations/Information
Bioinformatics Class Final Project by Nicole Allen, Livia Tran, and Albert Wong

### General Files:
1. mutY-sequences.gb: GenBank file containing NCBI data from 1500+ samples for mutY gene of H. pylori
2. ppa-sequences.gb: GenBank file containing NCBI data from 1500+ samples for ppa gene of H. pylori
3. mutY-accessions.seq: list of mutY Accession IDs downloaded from NCBI (corresponds to GenBank files)
4. ppa-accessions.seq: list of ppa Accession IDs downloaded from NCBI (corresponds to GenBank files)


### Albert's Files:
1.function_create_substring_from_pattern.R: a script defining a function, newSubString() that will require input of a string pattern's beginning and end, outputting the exact string that has this beginning and end.
2. albert_ppa_cleaning.R: script using newSubString() and Accession ID to extract ppa gene sequences and country obtained. Combined with nicole_mut_cleaning_country2.R to remove sequences with no countries specified. 
3.ppa-clean.df: dataframe with ppa Accession ID, sequence, and country
4. albert_mutY_cleaning.R: same as albert_ppa_cleaning.R, creating dataframe mutY-clean.df
5.mutY-clean.df: data frame containing mutY Accession ID, sequence, and country

### Nicole's Files (Order of Use):
1. ppa-accessions.seq: list of ppa gene accession numbers for later use by Albert
2. mutY-accessions.seq: list of mutY gene accession numbers for later use by Albert
3. nicole_muty_cleaning_country2.R: code to take Albert's "mutY-clean.df" and remove all rows with no country listed
4. muty-tobecleaned: CSV file output of #3
5. nicole_ppa_cleaning_country2.R: code to take Albert's "ppa-clean.df" and remove all rows with no country listed
6. ppa-tobecleaned: CSV file output of #5
7. ppa-fasta-tree: fasta file generated for Livia containing accession number and country of each ppa sequence
8. muty-fasta-tree: fasta file generated for Livia containing accession number and country of each ppa sequence
9. PhyloTreeMini_mutY.R: Phylogenetic analysis of mutY genes based on consensus sequence from each country.
10. muty_consensus_nj: contains data needed to construct mutY phylogenetic tree based on neighbor-joining calculations/analysis
11. muty_consensus_upgma: contains data to construct mutY phylogenetic tree based on UPGMA calculations/analysis
12. PhyloTreeMini_ppa.R: Phylogenetic analysis of ppa genes based on consensus sequence from each country.
13. ppa_consensus_nj: contains data needed to construct ppa phylogenetic tree based on neighbor-joining calculations/analysis
14. ppa_consensus_upgma: contains data to construct ppa phylogenetic tree based on UPGMA calculations/analysis
15. PhyloTree_Plotting_Final.R: Plots both mutY and ppa phylogenetic trees based on output from "PhyloTreeMini" files.
16. muty_tree.png: Result of mutY phylogenetic tree ggtree plot
17. ppa_tree.png: Result of ppa phylogenetic tree ggtree plot

### Livia's Files:
1. helicobacter_mutY.R:
2. helicobacter_ppa.R:
3. liv_working_muty.R: 
4. liv_working_ppa_2.R:
5. mutyplot.png:
6. ppaplot.png:
7. ppaseq.fasta: 
