initialTextProcessing <- function() {
  rm(list = ls())
  cname <- file.path("/Users/aleksandrmadisson/Repository/DataMining/TextMiningAnalysis/samples")
  dir(cname)
  
  # load package tm  which is framework for text data mining
  library(tm)
  
  # load available documents
  docs <- VCorpus(DirSource(cname))   
  #print(summary(docs))
  
  # Preprocessing
  docs <- tm_map(docs,removePunctuation)   
  docs <- tm_map(docs, removeNumbers)   
  docs <- tm_map(docs, tolower)   
  docs <- tm_map(docs, removeWords, stopwords("english"))   
  docs <- tm_map(docs, removeWords, c("syllogism", "tautology"))   
  docs <- tm_map(docs, stripWhitespace)
  docs <- tm_map(docs, PlainTextDocument)
  
  dtm <- DocumentTermMatrix(docs)   
  
  #print(dtm)
  
  freq <- colSums(as.matrix(dtm))   
  length(freq)
  dtms <- removeSparseTerms(dtm, 0.1)
  #print(dtms)
  
  # table after removing sparse terms
  freq <- colSums(as.matrix(dtms))  
  #print(freq)
  
  #print(findFreqTerms(dtm, lowfreq=30))
  dtms <- removeSparseTerms(dtm, 0.15)
  return(dtms)
}