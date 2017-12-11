#function to read .gb file into a single string

GbtoString<-function(fileName){
singleString <- paste(readLines(fileName), collapse=" ")
}

print("To use function, GbtoString('yourfilename') -> 'your variable'")
