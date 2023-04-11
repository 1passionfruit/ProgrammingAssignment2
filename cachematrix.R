## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##function defines 4 functions, x and stores a cached Inverse of some matrix

makeCacheMatrix <- function(x = matrix()) {
  
  cachedMatrix<-NULL ##cached matrix
  
  ##funtions to mutate/access inputMatrix
  set <- function(newMatrixInput){ ##set inputMatrix
    x<<-newMatrixInput
    cachedMatrix<<-NULL
  }
  
  get<- function() x ##return inputMatrix
  
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
                                            ##and new matrix equal last matrix
      message("getting cached matrix")
      return(inverseMatrix)
    }
    matrixData<-x$get() ##does this really do anything?? yes it does!!
    inverseMatrix <-solve(matrixData)
    x$setInverse(inverseMatrix)
    inverseMatrix
        ## Return a matrix that is the inverse of 'x'
 }
