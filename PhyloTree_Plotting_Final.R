library(ape)
library(seqinr)
library(phangorn)
library(ggtree)

#### PLOTTING PPA PHYLO TREE ####

## Reading in previous analysis data
ppa_tree <- read.tree(file="ppa_consensus_upgma")

## Creating matrix for later visualization by subgroup
ppa_colors <- matrix("NA", nrow = 22, ncol=3)
ppa_colors[,2] <- NA
ppa_colors[,3] <- "black"
colnames(ppa_colors) <- c("Country", "Subgroup", "Color")
ppa_frame <- as.data.frame(ppa_tree)

## Adds list of countries to "ppa_colors" list
for(n in 1:nrow(ppa_colors)){
  ppa_colors[n,1] <- ppa_frame[n,6]}

## Adding subgroups to each country
for(n in 1:nrow(ppa_colors)){
  if(grepl("Thailand", ppa_colors[n]) |
     grepl("China", ppa_colors[n]) |
     grepl("Mongolia", ppa_colors[n]) |
     grepl("Cambodia", ppa_colors[n]) |
     grepl("Bangladesh", ppa_colors[n]) |
     grepl("Japan", ppa_colors[n]) |
     grepl("Malaysia", ppa_colors[n]) |
     grepl("Bhutan", ppa_colors[n]) |
     grepl("Taiwan", ppa_colors[n]) == TRUE)
  {("East Asia" -> ppa_colors[n,2])
    ("purple" -> ppa_colors[n,3])}
  if(grepl("Australia", ppa_colors[n]) |
     grepl("Indonesia", ppa_colors[n]) |
     grepl("France", ppa_colors[n]) |
     grepl("Germany", ppa_colors[n]) |
     grepl("Lithuania", ppa_colors[n]) |
     grepl("Netherlands", ppa_colors[n]) |
     grepl("Peru", ppa_colors[n]) |
     grepl("Guatemala", ppa_colors[n]) |
     grepl("Colombia", ppa_colors[n]) |
     grepl("Iran", ppa_colors[n]) == TRUE)
  {("Europe" -> ppa_colors[n,2])
    ("darkgreen" -> ppa_colors[n,3])}
  if(grepl("Bangladesh", ppa_colors[n]) == TRUE)
  {("Northeast Africa" -> ppa_colors[n,2])
    ("purple" -> ppa_colors[n,3])}
  if(grepl("South_Africa", ppa_colors[n]) == TRUE)
  {("South Africa" -> ppa_colors[n,2])
    ("cadetblue" -> ppa_colors[n,3])}
  if(grepl("USA", ppa_colors[n]) |
     grepl("Gambia", ppa_colors[n]) == TRUE)
  {("West Africa" -> ppa_colors[n,2])
    ("darkblue" -> ppa_colors[n,3])}
  if(grepl("___", ppa_colors[n]) == TRUE)
  {("Africa" -> ppa_colors[n,2])
    ("red" -> ppa_colors[n,3])}
  if(grepl("___", ppa_colors[n]) == TRUE)
  {("Maori" -> ppa_colors[n,2])
    ("orange" -> ppa_colors[n,3])}
  if(grepl("Nepal", ppa_colors[n]) == TRUE)
  {("Asia" -> ppa_colors[n,2])
    ("cornsilk4" -> ppa_colors[n,3])}
  if(grepl("___", ppa_colors[n]) == TRUE)
  {("Native" -> ppa_colors[n,2])
    ("brown" -> ppa_colors[n,3])}
}

### NOTE: no Maori, West African, African, Asian, or Native groups tested in this data sample

## Converting "ppa_colors" to data frame for use in ggtree
ppa_colorsdf <- as.data.frame(ppa_colors)

## Plotting the resulting phylogenetic tree plus labels
ggtree(ppa_tree) %<+% ppa_colorsdf + geom_tiplab(aes(color=Subgroup)) +
  xlim(0,0.03) +
  theme(legend.position="left") +
  ggtitle("Relatedness of Helicobacter pylori Based on ppa Gene", subtitle="Phylogenetic Tree Visualization")

### Don't forget to save output of ggtree plot as a .png!



#### PLOTTING MUTY PHYLO TREE ####

muty_tree <- read.tree(file="muty_consensus_upgma")

## Creating matrix for later visualization by subgroup
muty_colors <- matrix("NA", nrow = 22, ncol=3)
muty_colors[,2] <- NA
muty_colors[,3] <- "black"
colnames(muty_colors) <- c("Country", "Subgroup", "Color")
muty_frame <- as.data.frame(muty_tree)

## Adds list of countries to "muty_colors" list
for(n in 1:nrow(muty_colors)){
  muty_colors[n,1] <- muty_frame[n,6]}

## Adding subgroups to each country
for(n in 1:nrow(muty_colors)){
  if(grepl("Thailand", muty_colors[n]) |
     grepl("China", muty_colors[n]) |
     grepl("Mongolia", muty_colors[n]) |
     grepl("Cambodia", muty_colors[n]) |
     grepl("Bangladesh", muty_colors[n]) |
     grepl("Japan", muty_colors[n]) |
     grepl("Malaysia", muty_colors[n]) |
     grepl("Bhutan", muty_colors[n]) |
     grepl("Taiwan", muty_colors[n]) == TRUE)
  {("East Asia" -> muty_colors[n,2])
    ("purple" -> muty_colors[n,3])}
  if(grepl("Australia", muty_colors[n]) |
     grepl("Indonesia", muty_colors[n]) |
     grepl("France", muty_colors[n]) |
     grepl("Germany", muty_colors[n]) |
     grepl("Lithuania", muty_colors[n]) |
     grepl("Netherlands", muty_colors[n]) |
     grepl("Peru", muty_colors[n]) |
     grepl("Guatemala", muty_colors[n]) |
     grepl("Colombia", muty_colors[n]) |
     grepl("Iran", muty_colors[n]) == TRUE)
  {("Europe" -> muty_colors[n,2])
    ("darkgreen" -> muty_colors[n,3])}
  if(grepl("Bangladesh", muty_colors[n]) == TRUE)
  {("Northeast Africa" -> muty_colors[n,2])
    ("purple" -> muty_colors[n,3])}
  if(grepl("South_Africa", muty_colors[n]) == TRUE)
  {("South Africa" -> muty_colors[n,2])
    ("cadetblue" -> muty_colors[n,3])}
  if(grepl("USA", muty_colors[n]) |
     grepl("Gambia", muty_colors[n]) == TRUE)
  {("West Africa" -> muty_colors[n,2])
    ("darkblue" -> muty_colors[n,3])}
  if(grepl("___", muty_colors[n]) == TRUE)
  {("Africa" -> muty_colors[n,2])
    ("red" -> muty_colors[n,3])}
  if(grepl("___", muty_colors[n]) == TRUE)
  {("Maori" -> muty_colors[n,2])
    ("orange" -> muty_colors[n,3])}
  if(grepl("Nepal", muty_colors[n]) == TRUE)
  {("Asia" -> muty_colors[n,2])
    ("cornsilk4" -> muty_colors[n,3])}
  if(grepl("___", muty_colors[n]) == TRUE)
  {("Native" -> muty_colors[n,2])
    ("brown" -> muty_colors[n,3])}
}

### Note: no Maori, West African, African, Asian, or Native groups tested in this data sample

## Converting "muty_colors" to data frame for use in ggtree
muty_colorsdf <- as.data.frame(muty_colors)

## Plotting the resulting phylogenetic tree plus labels
ggtree(muty_tree) %<+% muty_colorsdf + geom_tiplab(aes(color=Subgroup)) +
  xlim(0,0.05) +
  theme(legend.position="left") +
  ggtitle("Relatedness of Helicobacter pylori Based on mutY Gene", subtitle="Phylogenetic Tree Visualization")

### Don't forget to save output of ggtree plot as a .png!