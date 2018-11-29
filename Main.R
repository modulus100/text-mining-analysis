# Init custom functions
source("initialTextProcessing.R")
source("cosineDistance.R")
source("kMeans2.R")
source("plotKMeans.R")
source("desicionBoundary.R")

# Get processed data for analysis
initialDataSet <- initialTextProcessing()

# Transpose matrix for further vector processing
transposedDataSet <- t(initialDataSet)

# Convert transposedDataSet to matrix
dataSet <- as.matrix(transposedDataSet)

# Cosine distance
distance <- cosineDistance(dataSet[1,], dataSet[2,])

# K-means
kmData <- kmeans2(dataSet, 2)
plotKMeans(kmData)

# Decision boundary
# https://www.coursera.org/lecture/machine-learning/decision-boundary-WuL1H
# draw desicionBoundary
desicionBoundary(kmData)


