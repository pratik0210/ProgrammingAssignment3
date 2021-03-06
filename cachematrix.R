## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {  ## define the argument with default mode of "matrix"
  inv <- NULL                                ## initialize inv as NULL; will hold value of matrix inverse 
  set <- function(y){                        ## define the set function to assign new 
    x <<- y
    inv <<- NULL                           ##if there is a new matrix, reset inv to NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() {inv}            ##getting the inverse of matrix
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed),
##then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)){      ##checking if the we have got the inverse or not
    message("getting cached data")
    return(inv)               ## Return a matrix that is the inverse of 'x'
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
        
}
