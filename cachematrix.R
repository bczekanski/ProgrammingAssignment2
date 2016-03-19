## These functions make and cache a matrix

## This function makes a matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolved <- function(solve) m <<- solve
  getsolved <- function() m
  list(set = set, get = get,
       setsolved = setsolved,
       getsolved = getsolved)
}


## This function solves the matrix

cacheSolve <- function(x, ...) {
  m <- x$getsolved()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <-  solve(data, ...)
  x$setsolved(m)
  m
}