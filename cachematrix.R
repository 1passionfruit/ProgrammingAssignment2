## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##function defines 4 functions for x and stores a cached Inverse of x

makeCacheMatrix <- function(x = matrix()) {
  
  cachedMatrix<-NULL ##cached matrix
  
  ##funtions to mutate/access 
  set <- function(newMatrixInput){ ##set inputMatrix
    x<<-newMatrixInput
    cachedMatrix<<-NULL
  }
  
  get<- function() x ##return InputMatrix
  
  ##functions to mutate/access the inverse
  setInverse<-function(inverse) cachedMatrix<<-inverse
  getInverse<-function() cachedMatrix
  list(set=set, get=get,
       setInverse = setInverse,
       getInverse = getInverse)

}


## Write a short comment describing this function
##function to receive a matrix, compute its inverse if needed (no existing
## inverse or if matrix has changed)
cacheSolve <- function(x, ...) {
    inverseMatrix<-x$getInverse()
    if(!is.null(inverseMatrix)){ ##if is.Null() is False, matrix already cached
      message("getting cached matrix")
      return(inverseMatrix)
    }
    matrixData<-x$get() ##does this really do anything??
    inverseMatrix <-solve(matrixData)
    x$setInverse(inverseMatrix)
    inverseMatrix
        ## Return a matrix that is the inverse of 'x'
 }
