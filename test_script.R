source("cachematrix.R")

my_matrix <- makeCacheMatrix(matrix(c(1,2,3,4,5,6,6,4,5,4,3,4,4,3,2,3),4))

cacheSolve(my_matrix)
