#this script is for extracting mutY genbank information into a dataframe of sequences, id, and country

#enviornments preparation
#makes beep sound for end of for loop

library(beepr)

#source function to create substring from pattern beginning and end
source("function_create_substring_from_pattern.R")
#read column of accessionID
mutY_accession_list<-read.table("mutY-accessions.seq")

#create df with accession id
ppa_df<-data.frame(AccessionID=mutY_accession_list,Sequence=NA,Country=NA)

#define file, using a file that has elements
fileName <-"mutY-sequences.gb"

#read as string-- warning long process if big file
singleString <- paste(readLines(fileName), collapse=" ")

#for loop implementation of functions
for(x in 1:nrow(ppa_df)){
  #find beginning of sequence ID (accession number)
  #define pattern
  paste(ppa_df[x,1],".*?(LOCUS|//)")-> accID
  #use function to make string with 1 accession id
  newSubString(accID, singleString)-> string_one_ID
  string_one_ID ->ppa_df$OneRecord[x] 
  #if statement to indicate end of loop
  if (x==nrow(ppa_df)){beep()}
}
  #extract sequence with extra characters
for (x in 1:nrow(ppa_df)){
  newSubString("ORIGIN.*?//", ppa_df$OneRecord[x]) -> ppa_df$UncleanSequence[x]
  if (x==nrow(ppa_df)){beep()}
}
  
  #remove non-sequence characters
for (x in 1:nrow(ppa_df)){
  gsub("[ORIGIN/]*\\d*\\s*", "", ppa_df$UncleanSequence[x], fixed=FALSE) -> ppa_df$Sequence[x]
  if (x==nrow(ppa_df)){beep()}
}


#extract country location
for (x in 1:nrow(ppa_df)) {
 
  #pattern for country
  country_pattern<-"/country=.*\\s{1}(gene)*?"
  #use function to generate substring with country based on country pattern
  newSubString(country_pattern, ppa_df$OneRecord[x])-> ppa_df$CountryDirty[x]
  #clean country string for only country name
  gsub("country|gene|*=*\\d*\\s*", "", ppa_df$CountryDirty[x], fixed=FALSE) ->ppa_df$CountryClean1[x]
  #second round of cleaning to remove special characters
  gsub("/*\"", "", ppa_df$CountryClean1[x]) -> ppa_df$CountryCleanest[x]
  #input clean country string into df
  ppa_df$Country[x]<-ppa_df$CountryCleanest[x]
  if (x==nrow(ppa_df)){beep()}
  }

#Remove extra columns
NULL->ppa_df$OneRecord
NULL->ppa_df$UncleanSequence
NULL->ppa_df$CountryDirty
NULL->ppa_df$CountryClean1
NULL->ppa_df$CountryCleanest

## Only adds rows from original data frame that DO NOT have an empty value for "country" column
ppa <- ppa_df[!(ppa_df$Country == ""), ]
