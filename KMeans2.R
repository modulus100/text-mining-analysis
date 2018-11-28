kmeans2 <- function(dataset, k) {
  # include custom fuctions
  source("CosineDistance.R")
  source("ComputeNewCentroids.R")
  source("ClosestClusterNumber.R")
  
  # max number of iterations
  limit <- 100
  cnt <- 0
  numSamples <- dim(dataset)[1]
  dataDimension <- dim(dataset)[2]
  
  # random centroids selection
  # https://stackoverflow.com/questions/7806702/how-do-i-select-a-sample-of-rows-at-random-with-repetition-from-a-matrix-in-r
  centroids <- dataset[sample(numSamples,size=k,replace=FALSE),]
  
  # saves temporary cluster values
  tempClusterSet <- matrix(1, numSamples, 1)
  print(centroids)
  
  while(cnt < limit || all.equal(dataset[,dataDimension], tempClusterSet) == FALSE) {
    tempClusterSet <- dataset[,dataDimension]
    indexSamples <- 1
    
    while(indexSamples < 8 + 1) { #numSamples
      indexCentroids <- 1
      distanceVector <- numeric(k)
      sample <- dataset[indexSamples,][1:lastElementPos]
      
      while(indexCentroids < k + 1) {
        centroid <- centroids[indexCentroids,][1:lastElementPos]
        
        switch(distanceMethod,
               mahal = {
                 # distanceVector[indexCentroids] <- mahalanobisDistance(centroid, sample, dataset[,-dataDimension])
               },
               minkovski = {
                 p <- 3
                 # distanceVector[indexCentroids] <- minkovskiDistance(centroid, sample, p)
               },
               canderra = {
                 # distanceVector[indexCentroids] <- canderraDistance(centroid, sample)
               },
               {
                 # default
                 # distanceVector[indexCentroids] <- canderraDistance(centroid, sample)
               })
        
        indexCentroids <- indexCentroids + 1
      }
      
      dataset[indexSamples,][dataDimension] <- closestClusterNumber(distanceVector)
      indexSamples <- indexSamples + 1
    }
    
    centroids <- computeNewCentroids(dataset, k)
    cnt <- cnt + 1
  }
  # return updated dataset
  list("dataset" = dataset, "centoids" = centroids)
}