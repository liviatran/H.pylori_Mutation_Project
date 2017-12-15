ppadf <- read.csv("ppa_df_clean.df")
View(ppadf)


## New matrix for final data frame
ppa <- matrix()

## Only adds rows from original data frame that DO NOT have an empty value for "country" column
ppa <- ppadf[!(ppadf$Country == ""), ]
ppa
View(ppa)

source("function_create_substring_from_pattern.R")

  paste(ppa[1,2]) -> pattern

  
write.csv(ppa, file="ppa-tobecleaned")