mutydf <- read.csv("mutY-clean.df")
View(mutydf)


## New matrix for final data frame
muty <- matrix()

## Only adds rows from original data frame that DO NOT have an empty value for "country" column
muty <- mutydf[!(mutydf$Country == ""), ]
muty
View(muty)

write.csv(muty, file="muty-tobecleaned")