## The first of these functions creates an object which handles storage and retrieval 
## of the matrix we want to invert.
##
## The second function either returns the previously stored inverted matrix, or, if it 
## hasn't already been stored, it returns the original inverted solution and stores it.


## makeCacheMatrix creates an object to/from which an invertable matrix can be stored or
## retrieved

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## cacheSolve either returns a previously cached solved matrix, or, if that can't be 
## found, does the inversion and both returns and caches the solution

cacheSolve <- function(x, ...) {
    # Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
