#this script is for extracting mutY genbank information into a dataframe of sequences, id, and country

#enviornments preparation
#makes beep sound for end of for loop

library(beepr)

#source function to create substring from pattern beginning and end
source("function_create_substring_from_pattern.R")
#read column of accessionID
mutY_accession_list<-read.table("mutY-accessions.seq")

#create df with accession id
muty_df<-data.frame(AccessionID=mutY_accession_list,Sequence=NA,Country=NA)

#define file, using a file that has elements
fileName <-"mutY-sequences.gb"

#read as string-- warning long process if big file
singleString <- paste(readLines(fileName), collapse=" ")

#for loop implementation of functions
for(x in 1:nrow(muty_df)){
  #find beginning of sequence ID (accession number)
  #define pattern
  paste(muty_df[x,1],".*?(LOCUS|//)")-> accID
  #use function to make string with 1 accession id
  newSubString(accID, singleString)-> string_one_ID
  string_one_ID ->muty_df$OneRecord[x] 
  #if statement to indicate end of loop
  if (x==nrow(muty_df)){beep()}
}
  #extract sequence with extra characters
for (x in 1:nrow(muty_df)){
  newSubString("ORIGIN.*?//", muty_df$OneRecord[x]) -> muty_df$UncleanSequence[x]
  if (x==nrow(muty_df)){beep()}
}
  
  #remove non-sequence characters
for (x in 1:nrow(muty_df)){
  gsub("[ORIGIN/]*\\d*\\s*", "", muty_df$UncleanSequence[x], fixed=FALSE) -> muty_df$Sequence[x]
  if (x==nrow(muty_df)){beep()}
}


#extract country location
for (x in 1:nrow(muty_df)) {
 
  #pattern for country
  country_pattern<-"/country=.*\\s{1}(gene)*?"
  #use function to generate substring with country based on country pattern
  newSubString(country_pattern, muty_df$OneRecord[x])-> muty_df$CountryDirty[x]
  #clean country string for only country name
  gsub("country|gene|*=*\\d*\\s*", "", muty_df$CountryDirty[x], fixed=FALSE) ->muty_df$CountryClean1[x]
  #second round of cleaning to remove special characters
  gsub("/*\"", "", muty_df$CountryClean1[x]) -> muty_df$CountryCleanest[x]
  #input clean country string into df
  muty_df$Country[x]<-muty_df$CountryCleanest[x]
  if (x==nrow(muty_df)){beep()}
  }

#Remove extra columns
NULL->muty_df$OneRecord
NULL->muty_df$UncleanSequences
NULL->muty_df$CountryDirty
NULL->muty_df$CountryClean1
NULL->muty_df$CountryCleanest

## Only adds rows from original data frame that DO NOT have an empty value for "country" column
muty <- muty_df[!(muty_df$Country == ""), ]

### TO SAVE FULL INFO FILE AS A .CSV, REMOVE HASH AND RUN LINE BELOW
# write.csv(muty, file="FILENAME")

### RUN THE FOLLOWING STEPS TO SAVE AS A FASTA FILE ###

## For-loop to make a matrix of all loci and countries
namelist <- matrix()
for(n in 1:nrow(muty)){
  paste(muty[n,3], "(", muty[n,5], ")") -> namelist[n]
}

## Converting dataframe to matrix containing sequence data and locus names with countries
muty_matrix <- matrix(muty$Sequence, byrow=TRUE)
rownames(muty_matrix) <- namelist

## Convert matrix to sequence alignment file
muty_align <- as.alignment(muty_matrix)

## TO WRITE MATRIX AS FASTA FILE, REMOVE HASH AND RUN LINE BELOW
# write.dna(muty_matrix, "FILENAME", format="fasta", colw=420)