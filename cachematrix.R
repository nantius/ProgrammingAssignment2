##These functions together will store the inverse of a matrix and calculate it. Also, providing future access to the inverse matrix.




##The function makeCacheMatrix receives a matrix as an argument then creates a variable called inv to store the inverse of the matrix 
##and a series of methods used later by the cacheSolve function.
 
makeCacheMatrix <- function(x) 
{
    
    inv <- NULL
    
    
    get <- function()
    {
        x
    }
    
    setinv <- function(inverse)
    {
        inv <<- inverse
    }
    
    getinv <- function()
    {
        inv
    }
    
    list(get = get, 
         setinv = setinv, 
         getinv = getinv )
    
 
}



##cacheSolve receives the product of makeCacheMatrix, retrieves it's inv value via it's getinv method and checks wether it is NULL or not, 
##if it is null it will calculate the inverse matrix, store it at the matrix inv variable and return it, 
##if its not null it will simply return the value and end the function.


cacheSolve <- function(x, ...) 
{
    inv <- x$getinv()
    if(!is.null(inv))
    {
        message("Getting cached data")
        return(inv)
    }
    data <-x$get()
    inv <- solve(data)
    x$setinv(inv)
    
    inv    
}
