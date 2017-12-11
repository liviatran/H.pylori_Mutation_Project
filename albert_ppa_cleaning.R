library(genbankr)

#read column of accessionID
ppa_accession_list<-read.table("ppa-accessions.seq")
ppa_accession_list_10<-df_ppa[1:10,]

#create df with accession id
ppa_df<-data.frame(AccessionID=ppa_accession_list_10)

#define file, using a file that has 2 elements
fileName <-"ppa-sequences-10.txt"

#read as string-- warning long process if big file
singleString <- paste(readLines(fileName), collapse=" ")

#function development

#find beginning of sequence ID (accession number)
#define pattern
paste(ppa_df[1,],".*?//")-> accID


#obtain start and length of accession iD
find_pattern_gregexpr<-(gregexpr(accID, singleString))
#extract start of genbank pattern
start<-unlist(find_pattern_gregexpr)
#extract length to end of genbank sequence
  #use regexpr to obtain length of pattern
find_pattern_regexpr <- regexpr(accID, singleString)
#attr() finds length of pattern, sum up start position with length to obtain position for end of substring
end <- start + attr(find_pattern_regexpr, "match.length")

#create new string of just that sequence's information
one_genbank_string<-substring(singleString, start, end)
#extract sequence and input into df
one_genbank_string

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
