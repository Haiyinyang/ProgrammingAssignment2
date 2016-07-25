## Matrix inversion is usually a costly computation and there may be some benefit o caching the inverse of a matrix rather than computing it repeatedly


## Function makeCacheMatrix creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y){
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) i <<- inverse
	getinverse <- function() i
	list(set = set, get = get, 
		 setinverse = setinverse,
		 getinverse = getinverse)
}


## Function cachSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if (!is.null(m)) {
        	message("getting cached data")
        	return(i)
        }
        data <- x$get()
        i <- inverse(data, ...)
        x$setinverse(i)
        i
}
