#making a cache matrix
makeCacheMatrix<-function(x=matrix()){
  inv<-NULL
  set<-function(y){
    x<<-y
    inv<<-NULL
  }
  get<-function() {x}
  setInverse<-function(inverse){inv<<-inverse}
  getInverse<-function() {inv}
  list(set,get=get,setInverse=setInverse,getInverse=getInverse)
}

#caching inverse of a matrix
cacheSolve<-function(x,...){
  inv<-x$getInverse()
  if ( !is.null (inv)){
    message("show cached data")
    return(inv)
  }
  mat<-x$get()
  inv<-solve(mat,...)
  x$setInverse(inv)
  inv
}
