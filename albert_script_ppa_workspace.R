library(genbankr)


#define file, using a file that has 2 elements
fileName <-"ppa-sequences-2-results.txt"

#read as string
singleString <- paste(readLines(fileName), collapse=" ")
gregexpr("ountry", singleString)
