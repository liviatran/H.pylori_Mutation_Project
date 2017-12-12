source("function_create_substring_from_pattern.R")

CleanDfString<-function(pattern,ppa_df) {
#loop to clean up listing based on given pattern
for (x in 1:nrow(ppa_df)) {
if (unlist(gregexpr(pattern,ppa_df$Country[x])) > 0) {
      newSubString(pattern,ppa_df$Country[x]) -> ppa_df$Country[x]
}
  if (x == nrow(ppa_df)) {beep()}
}
}