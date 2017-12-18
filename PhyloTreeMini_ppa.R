library(ape)
library(seqinr)

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

## View list of unique countries
countrylist <- matrix(unique(ppa_df$Country))

## Creating a new matrix for each country
matrix() -> seqs_Thailand
matrix() -> seqs_France
matrix() -> seqs_Cambodia
matrix() -> seqs_Iran
matrix() -> seqs_Malaysia
matrix() -> seqs_Indonesia
matrix() -> seqs_Mongolia
matrix() -> seqs_Nepal
matrix() -> seqs_Bhutan
matrix() -> seqs_Taiwan
matrix() -> seqs_Japan
matrix() -> seqs_Colombia
matrix() -> seqs_USA
matrix() -> seqs_Australia
matrix() -> seqs_China
matrix() -> seqs_Guatemala
matrix() -> seqs_Gambia
matrix() -> seqs_Germany
matrix() -> seqs_SouthAfrica
matrix() -> seqs_Netherlands
matrix() -> seqs_Australia
matrix() -> seqs_Lithuania
matrix() -> seqs_Peru

## For-loop to sort sequences from each country into their own matrices
for(n in 1:nrow(ppa_matrix)){
  if(grepl("Thailand", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Thailand) -> seqs_Thailand)}
  if(grepl("France", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_France) -> seqs_France)}
  if(grepl("Cambodia", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Cambodia) -> seqs_Cambodia)}
  if(grepl("Iran", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Iran) -> seqs_Iran)}
  if(grepl("Malaysia", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Malaysia) -> seqs_Malaysia)}
  if(grepl("Indonesia", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Indonesia) -> seqs_Indonesia)}
  if(grepl("Mongolia", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Mongolia) -> seqs_Mongolia)}
  if(grepl("Nepal", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Nepal) -> seqs_Nepal)}
  if(grepl("Bhutan", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Bhutan) -> seqs_Bhutan)}
  if(grepl("Taiwan", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Taiwan) -> seqs_Taiwan)}
  if(grepl("Japan", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Japan) -> seqs_Japan)}
  if(grepl("Colombia", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Colombia) -> seqs_Colombia)}
  if(grepl("USA", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_USA) -> seqs_USA)}
  if(grepl("Australia", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Australia) -> seqs_Australia)}
  if(grepl("China", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_China) -> seqs_China)}
  if(grepl("Guatemala", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Guatemala) -> seqs_Guatemala)}  
  if(grepl("Gambia", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Gambia) -> seqs_Gambia)}
  if(grepl("South", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_SouthAfrica) -> seqs_SouthAfrica)}
  if(grepl("Germany", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Germany) -> seqs_Germany)}
  if(grepl("Lithuania", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Lithuania) -> seqs_Lithuania)}
  if(grepl("Netherlands", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Netherlands) -> seqs_Netherlands)}
  if(grepl("Peru", rownames(ppa_matrix)[n]) == TRUE){
    (rbind(ppa_matrix[n, 1, drop=FALSE], seqs_Peru) -> seqs_Peru)}

}

## Placing consensus sequence for each country into single matrix
finalcons <- matrix(data = c(seqinr::consensus(seqs_Thailand),
                     seqinr::consensus(seqs_France),
                     seqinr::consensus(seqs_Cambodia),
                     seqinr::consensus(seqs_Iran),
                     seqinr::consensus(seqs_Malaysia),
                     seqinr::consensus(seqs_Indonesia),
                     seqinr::consensus(seqs_Mongolia),
                     seqinr::consensus(seqs_Nepal),
                     seqinr::consensus(seqs_Bhutan),
                     seqinr::consensus(seqs_Taiwan),
                     seqinr::consensus(seqs_Japan),
                     seqinr::consensus(seqs_Colombia),
                     seqinr::consensus(seqs_USA),
                     seqinr::consensus(seqs_Australia),
                     seqinr::consensus(seqs_China),
                     seqinr::consensus(seqs_Guatemala),
                     seqinr::consensus(seqs_Gambia),
                     seqinr::consensus(seqs_SouthAfrica),
                     seqinr::consensus(seqs_Germany),
                     seqinr::consensus(seqs_Lithuania),
                     seqinr::consensus(seqs_Netherlands),
                     seqinr::consensus(seqs_Peru)
))

rownames(finalcons) <- c("Thailand", "France", "Cambodia", "Iran", "Malaysia", "Indonesia",
                         "Mongolia", "Nepal", "Bhutan", "Taiwan", "Japan", "Colombia", "USA",
                         "Australia", "China", "Guatemala", "Gambia", "South Africa", "Germany",
                         "Lithuania", "Netherlands", "Peru")

View(finalcons)


## Convert matrix to sequence alignment file
ppa_align <- ape::as.alignment(finalcons)
class(ppa_align)
ppa_align

### (Found better method for sequence alignment conversion, keeping this code just in case):
## Write matrix as fasta and re-import as sequence alignment file for use by phangorn
# write.dna(ppa_matrix, "ppa-fasta-tree", format="fasta", colw=420)
# ppa_align <- read.dna(ppa_matrix, file="ppa-fasta-tree", format="fasta")


## Install "phangorn" package if not previously installed:
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
parsimony(ppa_nj, ppa_phy) # Result = 105
parsimony(ppa_upgma, ppa_phy) # Result = 112

# Optimum parsimony is another option, will include nearest-neighbors and subtrees in parsimony calculations
optim.parsimony(ppa_nj, ppa_phy) # Result = 102
optim.parsimony(ppa_upgma, ppa_phy) # Result = 101

# Based on results, will proceed plotting using the UPGMA model for this dataset