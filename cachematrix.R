## Together, these functions enable the user to compute, cache, and retrieve
## the inverse of a matrix such that it need not be calculated repeatedly.    

## makeCacheMatrix takes an invertible matrix as an input and creates a list
## of functions that facilitate input, storage, and retrieval of the matrix  
## and its inverse.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set_matrix <- function(y) {
                x <<- y
                i <<- NULL
        }
        get_matrix <- function() x
        set_inverse <- function(inverse) i <<- inverse
        get_inverse <- function() i
        list(set_matrix = set_matrix, 
             get_matrix = get_matrix, 
             set_inverse = set_inverse, 
             get_inverse = get_inverse)
}


## cacheSolve takes a list generated by makeCacheMatrix as an input and either
## computes and caches the inverse of the matrix contained in the list or
## retrieves the inverse if it was calculated previously. 

cacheSolve <- function(x, ...) {
        i <- x$get_inverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get_matrix()
        i <- solve(data)
        x$set_inverse(i)
        i
}