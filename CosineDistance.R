cosineDistance <- function(v1, v2) {
  # https://en.wikipedia.org/wiki/Cosine_similarity
  # https://www.npmjs.com/package/compute-cosine-distance
  # http://www.webmath.ru/poleznoe/formules_4_7.php
  # https://reference.wolfram.com/language/ref/CosineDistance.html
  sum <- 0
  
  for (i in 1:length(v1)) {
    tempVal <- (abs(v1[i] - v2[i])) / (abs(v1[i]) + abs(v2[i]))
    sum <- sum + tempVal
  }
  #return sum
  sum
}