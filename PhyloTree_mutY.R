library(seqinr)
library(ape)

## Reading file made in "PracticeData.R" as dataframe variable
muty_df <- read.csv("muty-tobecleaned")
View(muty_df)

## For-loop to make a matrix of all loci and countries
namelist <- matrix()
for(n in 1:nrow(muty_df)){
  paste(muty_df[n,3], "(", muty_df[n,5], ")") -> namelist[n]
}

## Converting dataframe to matrix containing sequence data and locus names with countries
muty_matrix <- matrix(muty_df$Sequence, byrow=TRUE)
rownames(muty_matrix) <- namelist
View(muty_matrix)

## Convert matrix to sequence alignment file
muty_align <- as.alignment(muty_matrix)
class(muty_align)
muty_align

### (Found better method for sequence alignment conversion, keeping this code just in case):
## Write matrix as fasta and re-import as sequence alignment file for use by phangorn
# write.dna(muty_matrix, "muty-fasta-tree", format="fasta", colw=420)
# muty_align <- read.dna(muty_matrix, file="muty-fasta-tree", format="fasta")


## Install "phangorn" package if not previously intalled:
# install.packages("phangorn")

library(phangorn)

# Convert alignment to phyDat format for use in phangorn package
muty_phy <- as.phyDat(muty_align, type="DNA")

# Model Testing - THIS WIL TAKE TIME TO RUN
# Best model has high AIC and BIC, with most negative logLik (log likelihood)
muty_mt <- modelTest(muty_phy)
print(muty_mt)
# Result = "JC" model appears best

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
parsimony(muty_nj, muty_phy) # Result = 3302
parsimony(muty_upgma, muty_phy) # Result = 3501

# Optimum parsimony is another option, will include nearest-neighbors and subtrees in parsimony calculations
optim.parsimony(muty_nj, muty_phy) # Result = 3141
optim.parsimony(muty_upgma, muty_phy) # Result = 3142

# Based on results, will proceed plotting using the UPGMA model for this dataset


## Install "ggtree" package if not previously installed:
# install.packages("ggtree")
library(ggtree)

### Plotting code in progress...
ggtree(muty_upgma, aes(color=)) +
  geom_tiplab(size=3, color="blue") +
  scale_color_continuous(low='darkgreen', high='red') +
  theme(legend.position="right")

View(muty_upgma)

gzoom(muty_upgma, grep("Nepal", muty_upgma$tip.label))


## Code to view list of unique countries
countrylist <- matrix(unique(muty_df$Country))
View(countrylist)

write.csv(muty_upgma, file="muty_upgma")