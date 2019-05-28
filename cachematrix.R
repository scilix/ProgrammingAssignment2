## This is a set of functions providing functionality to create specialized matrix objects
## which can cache their own inverse. 
## -> advantage: the time consuming inversion calculation needs to be done only ones


## Provides a wrapper around a matrix for getting and setting the matrix 
## itself as well as the inverse.
## - input: a square matrix
## - output: a 'cacheMatrix' object, which is basically a list of for functions
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Returns the inverse of input matrix x. The inverse is only calculated, if this has not
## yet been done, otherwise the cached version is returned.
## - input: a 'cacheMatrix' object
## - output: the inverse of the input matrix
cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}
