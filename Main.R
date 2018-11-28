source("InitialTextProcessing.R")
source("CosineDistance.R")

# Get processed data for analysis
initialDataSet <- initialTextProcessing()

# Transpose matrix for further vector processing
transposedDataSet <- t(initialDataSet)

# Convert transposedDataSet to matrix
dataSet <- as.matrix(transposedDataSet)

# Cosine distance
distance <- cosineDistance(dataSet[1,], dataSet[2,])


# K-means
library(fpc)
library(cluster)
# d <- dist(t(transposedDataSet), method="manhattan")
# kfit <- kmeans(d, 2)
# clusplot(as.matrix(d), kfit$cluster, color=T, shade=T, labels=2, lines=0)