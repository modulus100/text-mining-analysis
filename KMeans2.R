kmeans2 <- function(dataSet, k) {
  # include custom fuctions
  source("CosineDistance.R")
  
  # random centroids selection
  # https://stackoverflow.com/questions/7806702/how-do-i-select-a-sample-of-rows-at-random-with-repetition-from-a-matrix-in-r
  centroids <- dataset[sample(numSamples,size=k,replace=FALSE),]
  
}