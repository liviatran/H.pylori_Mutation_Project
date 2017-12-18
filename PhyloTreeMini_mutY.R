library(ape)
library(seqinr)

## Reading file made in "PracticeData.R" as dataframe variable
muty_df <- read.csv("muty-tobecleaned")

## For-loop to make a matrix of all loci and countries
namelist <- matrix()
for(n in 1:nrow(muty_df)){
  paste(muty_df[n,3], "(", muty_df[n,5], ")") -> namelist[n]
}

## Converting dataframe to matrix containing sequence data and locus names with countries
muty_matrix <- matrix(muty_df$Sequence, byrow=TRUE)
rownames(muty_matrix) <- namelist

## View list of unique countries
countrylist <- matrix(unique(muty_df$Country))

## Creating a new matrix for each country
matrix() -> seqs_Thailand
matrix() -> seqs_Bangladesh
matrix() -> seqs_France
matrix() -> seqs_Cambodia
matrix() -> seqs_Iran
matrix() -> seqs_Malaysia
matrix() -> seqs_Indonesia
matrix() -> seqs_Mongolia
matrix() -> seqs_Nepal
matrix() -> seqs_Bhutan
matrix() -> seqs_Japan
matrix() -> seqs_USA
matrix() -> seqs_Colombia
matrix() -> seqs_Lithuania
matrix() -> seqs_Germany
matrix() -> seqs_Netherlands
matrix() -> seqs_Australia
matrix() -> seqs_SouthAfrica
matrix() -> seqs_Peru
matrix() -> seqs_China
matrix() -> seqs_Gambia
matrix() -> seqs_Guatemala

## For-loop to sort sequences from each country into their own matrices
for(n in 1:nrow(muty_matrix)){
  if(grepl("Thailand", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Thailand) -> seqs_Thailand)}
  if(grepl("Bangladesh", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Bangladesh) -> seqs_Bangladesh)}
  if(grepl("France", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_France) -> seqs_France)}
  if(grepl("Cambodia", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Cambodia) -> seqs_Cambodia)}
  if(grepl("Iran", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Iran) -> seqs_Iran)}
  if(grepl("Malaysia", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Malaysia) -> seqs_Malaysia)}
  if(grepl("Indonesia", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Indonesia) -> seqs_Indonesia)}
  if(grepl("Mongolia", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Mongolia) -> seqs_Mongolia)}
  if(grepl("Nepal", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Nepal) -> seqs_Nepal)}
  if(grepl("Bhutan", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Bhutan) -> seqs_Bhutan)}
  if(grepl("Japan", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Japan) -> seqs_Japan)}
  if(grepl("USA", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_USA) -> seqs_USA)}
  if(grepl("Colombia", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Colombia) -> seqs_Colombia)}
  if(grepl("Lithuania", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Lithuania) -> seqs_Lithuania)}
  if(grepl("Germany", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Germany) -> seqs_Germany)}
  if(grepl("Netherlands", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Netherlands) -> seqs_Netherlands)}
  if(grepl("Australia", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Australia) -> seqs_Australia)}
  if(grepl("South", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_SouthAfrica) -> seqs_SouthAfrica)}
  if(grepl("Peru", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Peru) -> seqs_Peru)}
  if(grepl("China", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_China) -> seqs_China)}
  if(grepl("Gambia", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Gambia) -> seqs_Gambia)}
  if(grepl("Guatemala", rownames(muty_matrix)[n]) == TRUE){
    (rbind(muty_matrix[n, 1, drop=FALSE], seqs_Guatemala) -> seqs_Guatemala)}
}
   

## Placing consensus sequence for each country into single matrix
finalcons <- matrix(data = c(seqinr::consensus(seqs_Thailand),
                     seqinr::consensus(seqs_Bangladesh),
                     seqinr::consensus(seqs_France),
                     seqinr::consensus(seqs_Cambodia),
                     seqinr::consensus(seqs_Iran),
                     seqinr::consensus(seqs_Malaysia),
                     seqinr::consensus(seqs_Indonesia),
                     seqinr::consensus(seqs_Mongolia),
                     seqinr::consensus(seqs_Nepal),
                     seqinr::consensus(seqs_Bhutan),
                     seqinr::consensus(seqs_Japan),
                     seqinr::consensus(seqs_USA),
                     seqinr::consensus(seqs_Colombia),
                     seqinr::consensus(seqs_Lithuania),
                     seqinr::consensus(seqs_Germany),
                     seqinr::consensus(seqs_Netherlands),
                     seqinr::consensus(seqs_Australia),
                     seqinr::consensus(seqs_SouthAfrica),
                     seqinr::consensus(seqs_Peru),
                     seqinr::consensus(seqs_China),
                     seqinr::consensus(seqs_Gambia),
                     seqinr::consensus(seqs_Guatemala)))

rownames(finalcons) <- c("Thailand", "Bangladesh", "France", "Cambodia", "Iran", "Malaysia",
                         "Indonesia", "Mongolia", "Nepal", "Bhutan", "Japan", "USA", "Colombia",
                         "Lithuania", "Germany", "Netherlands", "Australia", "South Africa",
                         "Peru", "China", "Gambia", "Guatemala")

View(finalcons)


## Convert matrix to sequence alignment file
muty_align <- ape::as.alignment(finalcons)
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
parsimony(muty_nj, muty_phy) # Result = 230
parsimony(muty_upgma, muty_phy) # Result = 236

# Optimum parsimony is another option, will include nearest-neighbors and subtrees in parsimony calculations
optim.parsimony(muty_nj, muty_phy) # Result = 227
optim.parsimony(muty_upgma, muty_phy) # Result = 228

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

write.tree(muty_upgma, file="muty_consensus_upgma")
write.tree(muty_nj, file="muty_consensus_nj")
