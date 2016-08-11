## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


################THIS IS MY SOLUTION #########################################
# Clean:
rm(list = ls(all = TRUE)) #clear all;
graphics.off() # close all;
gc() # Clear memmory (residuals of operations?, cache? Not sure)

# set the value of the vector
# get the value of the vector
# set the value of the mean
# get the value of the mean

a = rbind(c(1/4, 1/2), c(1/4, 1/3)) #thi is my matrix, the inverse of a number is when the numerator is change to the position of the denominator
#and the denominator to the numerator. So inverse of 1/4 should be 4/1 or 4

#This function creates a special "matrix" object that can cache its inverse, nevertheless it won't calculate the inverse; but it will
#provide an empty space to save the inverse once you use the cachesolve().
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

b<-makeCacheMatrix(a) 

# This function computes the inverse of the special "matrix" returned by 
# makeCacheMatrix above. If the inverse has already been calculated 
# (and the matrix has not changed), then the cachesolve should retrieve the inverse from 
# the cache.

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data.")
        return(m)
    } else {
        data <- x$get()
        m <- lapply(data,solve) #I use lapply so it will apply the function solve to every object or every number. check my comment down the code
        x$setinverse(m)
        m
    }
   
}
    
cacheSolve(b)

#if you run the cachesolve function usion m<-solve(data,...) it will give you values, but they are wrong. use this matrix rbind(c(1/4, 1/2), c(1/4, 1/3))
#the inverse is 4,2,4,3....which is the same as 4/1, 2/1, 4/1, 3/1.
