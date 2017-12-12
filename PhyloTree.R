library(seqinr)
library(ape)

## Reading file made in "PracticeData.R" as dataframe variable
ppa_df <- read.csv("ppa-tobecleaned")
View(ppa_df)

## For-loop to make a matrix of all loci and countries
namelist <- matrix()
for(n in 1:nrow(ppa_df)){
  paste(ppa_df[n,3], "(", ppa_df[n,5], ")") -> namelist[n]
}

## Converting dataframe to matrix containing sequence data and locus names with countries
ppa_matrix <- matrix(ppa_df$Sequence, byrow=TRUE)
rownames(ppa_matrix) <- namelist
View(ppa_matrix)

## Convert matrix to sequence alignment file
ppa_align <- as.alignment(ppa_matrix)
class(ppa_align)
ppa_align

### (Found better method for sequence alignment conversion, keeping this code just in case):
# Write matrix as fasta and re-import as sequence alignment file for use by phangorn
# write.dna(ppa_matrix, "ppa-fasta-tree", format="fasta", colw=420)
# ppa_align <- read.dna(ppa_matrix, file="ppa-fasta-tree", format="fasta")


## Install "phangorn" package if not previously intalled:
# install.packages("phangorn")

library(phangorn)

# Convert alignment to phyDat format for use in phangorn package
ppa_phy <- as.phyDat(ppa_align, type="DNA")

# Model Testing - THIS WIL TAKE TIME TO RUN
# Best model has high AIC and BIC, with most negative logLik (log likelihood)
ppa_mt <- modelTest(ppa_phy)
print(ppa_mt)
# Result = "JC" model appears best

# Distance Matrix - choose best model based on previous model testing
ppa_dist <- dist.ml(ppa_phy, model="JC69")

# UPGMA (Unweighted Pair Group Method with Arithmetic Averaging) Algorithm
## Assumes equal rates of evolution - branch tips come out equal
ppa_upgma <- upgma(ppa_dist)
plot(ppa_upgma, main="UPGMA Model")

# Neighbor Joining
## Allows for unequal rates of evolution - branch lengths are proportional to amount of change
ppa_nj <- NJ(ppa_dist)
plot(ppa_nj, main="Neighbor Joining Model")

# Determining best fit model - returns parisimony scores (goal is maximum parsimony)
parsimony(ppa_nj, ppa_phy) # Result = 1436
parsimony(ppa_upgma, ppa_phy) # Result = 1617

# Optimum parsimony is another option, will include nearest-neighbors and subtrees in parsimony calculations
optim.parsimony(ppa_nj, ppa_phy) # Result = 1385
optim.parsimony(ppa_upgma, ppa_phy) # Result = 1398

# Based on results, will proceed plotting using the UPGMA model for this dataset


## Install "ggtree" package if not previously installed:
# install.packages("ggtree")
library(ggtree)

### Plotting code in progress...
ggtree(ppa_upgma, aes(color=)) +
  geom_tiplab(size=3, color="blue") +
  scale_color_continuous(low='darkgreen', high='red') +
  theme(legend.position="right")

View(ppa_upgma)

gzoom(ppa_upgma, grep("Nepal", ppa_upgma$tip.label))


## Code to view list of unique countries
countrylist <- matrix(unique(ppa_df$Country))
View(countrylist)

write.csv(ppa_upgma, file="ppa_upgma")