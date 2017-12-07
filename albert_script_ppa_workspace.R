library(genbankr)


#define file, using a file that has 2 elements
fileName <-"ppa-sequences-2-results.txt"

#read as string
singleString <- paste(readLines(fileName), collapse=" ")
gregexpr("ountry", singleString)
View(singleString)
substring(singleString,3852)

df_ppa<-read.table("ppa-accessions.seq")
class(df_ppa)
head(df_ppa)
colnames(df_ppa)<- "AccessionID"

df_ppa10<-df_ppa[1:10,]
df_ppa10

data.frame(AccessionID=df_ppa10)->dataf_ppa10
write.csv(dataf_ppa10, "ppa_df_10_elements.csv")
