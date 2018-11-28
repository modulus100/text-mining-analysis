computeNewCentroids <- function(dataset, clusterSet, k) {
  
  numSamples <- dim(dataset)[1]
  dataDimension <- dim(dataset)[2]
  newCentroids <- matrix(0, k, dataDimension)
  
  # go trought all the dataset samples
  for (clusterNumber in 1:k) {
    sumVector <- numeric(dataDimension)
    dataCount <- 0
    
    # calculate number of samples for each k
    for (indexSamples in 1:numSamples) {
      if (clusterSet[indexSamples] == clusterNumber) {
        dataCount <- dataCount + 1
        
        # adds all certrain cluster's vector to one sumVector
        for (indexDimension in 1:dataDimension) {
          sumVector[indexDimension] = sumVector[indexDimension] + dataset[indexSamples,][indexDimension]
        }
      }
    }
    
    # calculates a new centroid vector
    for (indexDimension in 1:dataDimension) {
      # means, last column is ignored
      newCentroids[clusterNumber,][indexDimension] <- sumVector[indexDimension] / dataCount
    }
  }
  
  return(newCentroids)
}