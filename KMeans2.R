kmeans2 <- function(dataset, k, distanceMethod="cosine") {
  # include custom fuctions
  source("mahalanobisDistance.R")
  source("minkovskiDistance.R")
  source("canderraDistance.R")
  source("cosineDistance.R")
  source("computeNewCentroids.R")
  source("closestClusterNumber.R")
  
  # max number of iterations
  limit <- 100
  cnt <- 0
  numSamples <- dim(dataset)[1]
  dataDimension <- dim(dataset)[2]
  
  # random centroids selection
  # https://stackoverflow.com/questions/7806702/how-do-i-select-a-sample-of-rows-at-random-with-repetition-from-a-matrix-in-r
  centroids <- dataset[sample(numSamples,size=k,replace=FALSE),]
  
  # saves temporary cluster values
  clusterSet <- matrix(1, numSamples, 1)
  
  # goes through the each dataset sample
  # conditions for the stoping clustering recalculation
  while (cnt < limit || all.equal(dataset[,dataDimension], tempClusterSet) == FALSE) {
    tempClusterSet <- clusterSet # dataset[,dataDimension]
    
    # goes throug
    for (indexSamples in 1:numSamples) {
      distanceVector <- numeric(k)
      sample <- dataset[indexSamples,]
      
      # calculate distance between each centroid(vector) and a given samle(vector)
      for (indexCentroids in 1:k) {
        centroid <- centroids[indexCentroids,]
        
        switch(distanceMethod,
          mahal = {
           distanceVector[indexCentroids] <- mahalanobisDistance(centroid, sample, dataset)
          },
          minkovski = {
           p <- 3
           distanceVector[indexCentroids] <- minkovskiDistance(centroid, sample, p)
          },
          canderra = {
           distanceVector[indexCentroids] <- canderraDistance(centroid, sample)
          },
          cosine = {
           distanceVector[indexCentroids] <- cosineDistance(centroid, sample)
          },
          {
           # default
           distanceVector[indexCentroids] <- cosineDistance(centroid, sample)
          })
      }
      
      # closestClusterNumber returns cluster number, maps vector to a certain cluster
      clusterSet[indexSamples] <- closestClusterNumber(distanceVector)
    }
    
    centroids <- computeNewCentroids(dataset, clusterSet, k)
    cnt <- cnt + 1
  }
  # return updated dataset
  list("dataset" = dataset, "centoids" = centroids, "cluster" = clusterSet)
}