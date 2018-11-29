desicionBoundary <- function(kmData) {
  redCluster <- 1
  numSamples <- dim(kmData$dataset)[1]
  dataDimension <- dim(kmData$dataset)[2]
  minLength <- Inf
  minVector <- numeric(dataDimension)
  
  # http://chortle.ccsu.edu/vectorlessons/vch04/vch04_4.html
  # find min length vector
  vectorLength <- function(v) {
    sum <- 0
    for (i in 1:length(v)) { sum <- sum + (v[i] * v[i]) }
    return(sqrt(sum))
  }
  
  for (sampleIndex in 1:numSamples) {
    tempLength <- vectorLength(kmData$dataset[sampleIndex,])
    
    if (kmData$cluster[sampleIndex] == redCluster && tempLength < minLength) {
      minLength <- tempLength
      minVector <- kmData$dataset[sampleIndex,]
    }
  }
  
  # find the dot with the highets angle
  maxAngle <- 0.0
  maxVector <- numeric(dataDimension)
  offset <- -1
  
  for (sampleIndex in 1:numSamples) {
    if (kmData$cluster[sampleIndex] == redCluster) {
      length <- abs(minVector[1] - kmData$dataset[sampleIndex,][1])
      height <- abs(minVector[2] - kmData$dataset[sampleIndex,][2])
      
      if (length > 0 && height > 0) {
        tempAngle <-atan(height/length)
        
        if (tempAngle > maxAngle) {
          maxAngle <- tempAngle
          maxVector <- kmData$dataset[sampleIndex,]
          print(maxVector)
        }
      }
    }
  }
  
  # draw boundary
  abline(a=-minVector[1], b=maxVector[2] + offset, col = 2)
  par(new=TRUE)
  print(minVector[1])
  print(maxVector[2])
}