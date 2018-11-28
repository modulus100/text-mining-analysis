cosineDistance <- function(v1, v2) {
  # https://en.wikipedia.org/wiki/Cosine_similarity
  # https://www.npmjs.com/package/compute-cosine-distance
  # http://www.webmath.ru/poleznoe/formules_4_7.php
  # https://reference.wolfram.com/language/ref/CosineDistance.html
  
  # summarizes vector values
  sumMultipliedVectorValues <- function(v1, v2) {
    sum <- 0
    for (i in 1:length(v1)) { sum <- sum + (v1[i] * v2[i]) }
    return(sum)
  }
  
  # summarizes root vector values
  sumSquareVectorValues <- function(v) {
    sum <- 0
    for (i in 1:length(v)) { sum <- sum + v[i] * v[i] }
    return(sum)
  }
  
  # calculates cosine distance 
  return(1 - (sumMultipliedVectorValues(v1, v2) / (sqrt(sumSquareVectorValues(v1)) * sqrt(sumSquareVectorValues(v2)))))
}
