# -----------------------------------------------------------------------------
# FUNCTION: dummy.data.frame
#  Produce a dummy data.frame, i.e. where all categorical ( non-continous ) 
#  variables are expanded. 
#  
#  all  : return all columns or only the categorical variables.
#
#  TODO:
#   - matrix?
#   - na.action
#
# -----------------------------------------------------------------------------

dummy.data.frame <- function( data, all=TRUE, dummy.classes=getOption("dummy.classes"), ... ) {

  # Initialize the data.frame
    df<-data.frame( row.names=row.names(data) )
    new.attr <- list()  # Track location of dummy variables

    for( nm in names(data) ) {
      
      old.attr <- attr(df,'dummies')
      if( class(data[,nm]) %in% dummy.classes ) {

        dummies <- dummy( nm, data, ... )
        new.attr[[nm]] <- (ncol(df)+1):( ncol(df)+ncol(dummies) ) 

      } else {
        if( ! all ) next()
        dummies <- data[,nm, drop=FALSE ]
      }

      df <- cbind(df, dummies)
    }

    attr( df, 'dummies' ) <- new.attr
    return(df)

}
      
    
# TESTING:
# dummy.data.frame(iris)
# dummy.data.frame(iris all=FALSE)



