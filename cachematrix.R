## Put comments here that give an overall description of what your
## functions do
##makeCacheMatrix creates an S3 object of type makeCacheMatrix, defines and initalizes
##x and m and accessors and mutators for both x and m.Values assigned in the function that
##will need to be accessed outside use the <<- operator. List is created with name/value
#pairs for list members. cacheSolve takes makeCacheMatrix objects and computes the inverse
#of the matrix stored inside. If first checks if there is already an inverse stored, if there is, 
#the stored inverse is retrieved, if its not there then the matrix is retirieved,
#inverse is computed and then stored in the object

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
##function to receive a matrix, compute its inverse if needed (no existing inverse)
cacheSolve <- function(x, ...) {
    inverseMatrix<-x$getInverse()
    if(!is.null(inverseMatrix)){ ##if is.Null() is False, matrix already cached
                                            ##and new matrix equal last matrix
      message("getting cached matrix")
      return(inverseMatrix) ##return to calling environment
    }
    matrixData<-x$get() ##does this really do anything?? now I see!! yes it does!!
    inverseMatrix <-solve(matrixData)
    x$setInverse(inverseMatrix)
    inverseMatrix  ##return to calling environment
        ## Return a matrix that is the inverse of 'x'
 }
