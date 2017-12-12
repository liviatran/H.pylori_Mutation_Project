ppadf <- read.csv("ppa_df_clean.df")
View(ppadf)


## New matrix for final data frame
ppa <- matrix()

## Only adds rows from original data frame that DO NOT have an empty value for "country" column
ppa <- ppadf[!(ppadf$Country == ""), ]
ppa
View(ppa)
