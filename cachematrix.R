## This function creates a special “matrix” object that can cache its inverse

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
  set <- function(y) {
          x <<- y
          i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## This function computes the inverse of the special matrix that returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
          message("getting cached data")
          return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
