plotKMeans <- function(kmeansData) {
  getFormattedMatrixPoint <- function(v) {
    len <- length(v)
    matrix(v, nrow = 1, ncol = len)
  }
  
  # all points
  samples <- dim(kmeansData$dataset)[1]
  dimension <- dim(kmeansData$dataset)[2]
  textWors <- names(kmeansData$dataset[,1])
  
  for (sampleIndex in 1:samples) {
    point <- getFormattedMatrixPoint(kmeansData$dataset[sampleIndex,])
    colour <- switch(kmeansData$cluster[sampleIndex],"red","green","blue")
    plot(point, col=colour, type="p", xlim=c(0,10), ylim=c(-2,24))
    text(point, textWors[sampleIndex], cex=1, pos=4, col=colour)
    par(new=TRUE)
  }
  
  # centroids
  samples <- dim(kmeansData$centoids)[1]
  dimension <- dim(kmeansData$centoids)[2]
  
  for (cnetroidIndex in 1: samples) {
    point <- getFormattedMatrixPoint(kmeansData$centoids[cnetroidIndex,])
    colour <- "black"
    plot(point, col=colour, type="p", xlim=c(0,10), ylim=c(-2,24), pch = 17, cex = 1.5)
    par(new=TRUE)
  }
}
