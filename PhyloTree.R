library(seqinr)
library(ape)

## Reading file made in "PracticeData.R" as dataframe variable
muty_df <- read.table("mutydf.csv")
View(muty_df)

## Converting dataframe to matrix containing sequence data and locus names
muty_matrix <- matrix(muty_df$Origin, byrow=TRUE)
rownames(muty_matrix) <- muty_df$Locus
View(muty_matrix)

## Convert matrix to sequence alignment file
muty_align <- as.alignment(muty_matrix)
class(muty_align)
muty_align

### (Found better method for sequence alignment conversion, keeping this code just in case):
# Write matrix as fasta and re-import as sequence alignment file for use by phangorn
# write.dna(muty_matrix, "muty-fasta-tree", format="fasta", colw=420)
# muty_align <- read.dna(muty_matrix, file="muty-fasta-tree", format="fasta")


## Install "phangorn" package if not previously intalled:
# install.packages("phangorn")

library(phangorn)

# Convert alignment to phyDat format for use in phangorn package
muty_phy <- as.phyDat(muty_align, type="DNA")

# Model Testing
# Best model has high AIC and BIC, with most negative logLik (log likelihood)
muty_mt <- modelTest(muty_phy)
print(muty_mt) # Result = "JC" model appears best

# Distance Matrix - choose best model based on previous model testing
muty_dist <- dist.ml(muty_phy, model="JC69")

# UPGMA (Unweighted Pair Group Method with Arithmetic Averaging) Algorithm
## Assumes equal rates of evolution - branch tips come out equal
muty_upgma <- upgma(muty_dist)
plot(muty_upgma, main="UPGMA Model")

# Neighbor Joining
## Allows for unequal rates of evolution - branch lengths are proportional to amount of change
muty_nj <- NJ(muty_dist)
plot(muty_nj, main="Neighbor Joining Model")

# Determining best fit model - returns parisimony scores (goal is maximum parsimony)
parsimony(muty_nj, muty_phy) # Result = 114
parsimony(muty_upgma, muty_phy) # Result = 122

# Optimum parsimony is another option, will include nearest-neighbors and subtrees in parsimony calculations
optim.parsimony(muty_nj, muty_phy) # Result = 112
optim.parsimony(muty_upgma, muty_phy) # Result = 112

# Based on results, will proceed plotting using the UPGMA model for this dataset


## Install "ggtree" package if not previously installed:
# install.packages("ggtree")
library(ggtree)

ggtree(muty_upgma)
