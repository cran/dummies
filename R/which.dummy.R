# -----------------------------------------------------------------------------
# FUNCTIONS: which.dummy which dummies
#   Which variables are dummy variables
#  
#  TODO: 
#   - allow for multiple names.
# -----------------------------------------------------------------------------

which.dummy <- which.dummies <- function(data, name=NULL) {

  
  if( ! is.null(name) ) {
     indexes <- attr( data, 'dummies' )[[name]] 
  } else {  

    if( is.null( attr( data, 'dummies' ) ) )
      stop( "Data does not appear to have dummy variables." )

    indexes <- sapply( attr( data, 'dummies' ), I ) 
  }

  return( sort( as.integer( indexes ) ) )
}

