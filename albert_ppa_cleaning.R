#enviornments preparation
library(genbankr)
#source function to create substring from pattern beginning and end
source("function_create_substring_from_pattern.R")
#read column of accessionID
ppa_accession_list<-read.table("ppa-accessions.seq")

#create df with accession id
ppa_df<-data.frame(AccessionID=ppa_accession_list,Sequence=NA,Country=NA)

#define file, using a file that has elements
fileName <-"ppa-sequences.gb"

#read as string-- warning long process if big file
singleString <- paste(readLines(fileName), collapse=" ")

#for loop implementation off functions
for(x in 1:nrow(ppa_df)){
  #find beginning of sequence ID (accession number)
  #define pattern
  paste(ppa_df[x,1],".*?//")-> accID
  #use function to make string with 1 accession id
  newSubString(accID, singleString)-> string_one_ID
  #extract sequence with extra characters
  newSubString("ORIGIN.*?//", string_one_ID) ->string_sequence_dirty
  #remove non-sequence characters
  gsub("[ORIGIN/]*\\d*\\s*", "", string_sequence_dirty, fixed=FALSE) ->string_sequence_clean
  #input clean sequence into df
  string_sequence_clean -> ppa_df$Sequence[x]
}
#extract country location

  #pattern for country
  country_pattern<-"/country=.*?gene"
  #use function to generate substring with country based on country pattern
  newSubString(country_pattern, string_one_ID)->string_country_dirty
  #clean country string for only country name
  gsub("country|gene|*=*\\d*\\s*", "", string_country_dirty, fixed=FALSE) ->string_country_clean
  #second round of cleaning to remove special characters
  gsub("/*\"", "", string_country_clean) ->string_country_cleanest
  #input clean country string into df
  ppa_df$Country[x]<-string_country_cleanest

