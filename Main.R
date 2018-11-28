source("InitialTextProcessing.R")

# Get processed data for analysis
dataSet <- initialTextProcessing()

# Cosine distance



# K-means
library(fpc)
library(cluster)
d <- dist(t(dataSet), method="manhattan")
kfit <- kmeans(d, 2)
#print()
clusplot(as.matrix(d), kfit$cluster, color=T, shade=T, labels=2, lines=0)