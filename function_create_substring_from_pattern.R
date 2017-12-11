#function to find start and end of a pattern and makes a substring of it

newSubString<-function(pattern,string){

#obtain start and length of accession iD
find_pattern_gregexpr<-(gregexpr(pattern, string))
#extract start of genbank pattern
start<-unlist(find_pattern_gregexpr)
#extract length to end of genbank sequence
#use regexpr to obtain length of pattern
find_pattern_regexpr <- regexpr(pattern, string)
#attr() finds length of pattern, sum up start position with length to obtain position for end of substring
end <- start + attr(find_pattern_regexpr, "match.length")-1
#writes new substring as newString
newString<-substring(string, start, end)
newString
}
print("To use this function, type newSubString('your pattern','your sequence') -> 'your variable'")