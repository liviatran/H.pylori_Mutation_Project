library(genbankr)

#read column of accessionID
ppa_accession_list<-read.table("ppa-accessions.seq")
ppa_accession_list_10<-df_ppa[1:10,]

#create df with accession id
ppa_df<-data.frame(AccessionID=ppa_accession_list_10,Sequence=NA,Country=NA)

#define file, using a file that has 2 elements
fileName <-"ppa-sequences-10.txt"

#read as string-- warning long process if big file
singleString <- paste(readLines(fileName), collapse=" ")

#function development

#find beginning of sequence ID (accession number)
#define pattern
paste(ppa_df[1,],".*?//")-> accID

source("function_create_substring_from_pattern.R")

newSubString(accID, singleString)-> string_one_ID

#extract sequence with extra characters
newSubString("ORIGIN.*?//", string_one_ID) ->string_one_sequence

#remove non-sequence characters
gsub("[ORIGIN/]*\\d*\\s*", "", string_one_sequence, fixed=FALSE) ->string_sequence_clean
string_sequence_clean -> ppa_df$Sequence[1]


#extra country and put into df
gregexpr("ountry", singleString)
View(singleString)
substring(singleString,3852)


colnames(df_ppa)<- "AccessionID"

df_ppa10<-df_ppa[1:10,]
df_ppa10

data.frame(AccessionID=df_ppa10)->dataf_ppa10
write.csv(dataf_ppa10, "ppa_df_10_elements.csv")

read.csv("ppa_df_10_elements.csv")
