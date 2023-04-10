## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  cachedMatrix<-NULL ##to check if matrix inverse already in object
  
  set <- function(newMatrixInput){
    x<<-newMatrixInput
    cachedMatrix<<-NULL
  }
  
  get<- function() x ##return newMatrix
  
  setInverse<-function(inverse) cachedMatrix<<-inverse
  getInverse<-function() cacheMatrix
  list(set=set, get=get,
       setInverse = setInverse,
       getInverse = getInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    inverseMatrix<-x$getInverse()
    if(!is.null(inverseMatrix)){
      message("getting cached matrix")
      return(inverseMatrix)
    }
    matrixData<-x$get()
    inverseMatrix <-solve(matrixData)
    x$setInverse(inverseMatrix)
    inverseMatrix
        ## Return a matrix that is the inverse of 'x'
 }
