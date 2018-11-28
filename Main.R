rm(list = ls())
cname <- file.path("/Users/aleksandrmadisson/Repository/DataMining/TextDatamining2018/samples")
#cname <- file.path("/Users/aleksandrmadisson/Repository/DataMining/TextDatamining2018/customSamples")
dir(cname)

# load package tm  which is framework for text data mining
library(tm)

# load available documents
docs <- VCorpus(DirSource(cname))   
print(summary(docs))

# Preprocessing
docs <- tm_map(docs,removePunctuation)   
docs <- tm_map(docs, removeNumbers)   
docs <- tm_map(docs, tolower)   
docs <- tm_map(docs, removeWords, stopwords("english"))   
docs <- tm_map(docs, removeWords, c("syllogism", "tautology"))   
docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, PlainTextDocument)


dtm <- DocumentTermMatrix(docs)   


print(dtm)

freq <- colSums(as.matrix(dtm))   
length(freq)   
#print(freq) 
dtms <- removeSparseTerms(dtm, 0.1)
print(dtms)

# table after removing sparse terms
freq <- colSums(as.matrix(dtms))  
print(freq)

print(findFreqTerms(dtm, lowfreq=30)) 

# K-means
library(fpc)
library(cluster)
dtms <- removeSparseTerms(dtm, 0.15)
d <- dist(t(dtms), method="manhattan")
kfit <- kmeans(d, 2)
clusplot(as.matrix(d), kfit$cluster, color=T, shade=T, labels=2, lines=0)