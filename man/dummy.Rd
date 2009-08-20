\name{dummy}
\Rdversion{1.1}
\alias{dummy}
\alias{dummy.data.frame}

\title{
  Flexible, efficient creation of dummy variables.
}
\description{
  This package flexibly and efficiently creates dummy variables for
  a variety of structures. 
}
\usage{
dummy(x, data = NULL, sep = "", drop = TRUE, fun = as.integer)

dummy.data.frame(data, all = TRUE, dummy.classes = getOption("dummy.classes"), ...)
}

\arguments{
  \item{x}{ a single variable or variable _name_ } 
  \item{data}{ an object such as a data.frame or matrix that has colnames }
  \item{drop}{ 
    when \code{x} or \code{data[,x]} is a factor, whether to produce dummy
    variables only the used levles. By default only the used levels are 
    retained.  Default is TRUE.
  }
  \item{sep}{
    For the names of the created dummy variables, sep is the character used 
    between the variable name and the value. 
  }
  \item{fun}{
    Function used to coerce values in the resulting matrix or frame.
  }  

For \code{dummy.data.frame} only: 

  \item{dummy.classes}{ 
    ( For \code{dummy.data.frame} only )  The classes for which dummy 
    variables are created.  By default, these are factor, and character 
    and are set globally by options('dummy.classes' ).
  }
  \item{all}{ 
    ( For \code{dummy.data.frame} only ).  Whether to return columns
    that are not dummy classes.  The default is TRUE and returns all
    classes.  Non dummy classes are untouched.  
  }


  \item{...}{ arguments passed to other functions }

}

\details{
    \code{dummy} take a single variable OR the name of single variable  
    with data frame coerces.  It coerces the variable to a factor and 
    returns a matrix of dummy variables using \code{\link{model.matrix}}.
    If the \code{data} has rownames, these are retained.

    Optionally, \code{dummy} can create dummies for unused levels.  

    If there is only one level for the variable, a warning is issued
    before creating the dummy variable with all the same value.

    A seperator, \code{sep}, can be specified for the seperator between
    the variable name and the value for the construction of new variable
    names.  The default is to provide no seperator.

    The type of values returned can be affected using the \code{fun}
    argument.  

    \code{dummy.data.frame} takes a data.frame or matrix and returns
    a data.frame in which all columns of the \code{dummy.classes}
    are expanded as dummy.variables.  Dummy classes can be specified
    globally via \code{options('dummy.classes')}.  Columns that are 
    not defined dummy.classes are untouched and are passed through. 
    
    If the argument \code{all} is FALSE.  The data.frame with contain
    only the new dummy variables  By default, all columns of the 
    object are returned and are returned in the order of the variables
    were in in the original data.frame.

}

\value{

\code{dummy} returns a matrix with the number of rows equal 
to the that of given variable.  By default, the matrix contains 
integers, but the exact type can be affected by \code{fun} argument.
Rownames are retained if the supplied variable has associate row names.

\code{dummy.data.frame} returns a data.frame in which variables are
expanded to dummy variables if they are one of the dummy classes. 
The columns are return in the same order as the input with dummy 
variable columns replacing the original column.

}

\references{

  http://wiki.r-project.org/rwiki/doku.php?id=tips:data-manip:create_indicator

  http://tolstoy.newcastle.edu.au/R/help/00b/1199.html

  http://tolstoy.newcastle.edu.au/R/help/03a/6409.html

  http://tolstoy.newcastle.edu.au/R/help/01c/0580.html

}
\author{
  Christopher Brown
}

\seealso{

  \code{\link{model.frame}}, 
  \code{\link{model.matrix}}, 
  \code{\link{factor}}

}

\examples{

  letters <- c( "a", "a", "b", "c", "d", "e", "f", "g", "h", "b", "b" )
  dummy( as.character(letters) )
  dummy( letters[1:6] )
  
  l <- as.factor(letters)[ c(1:3,1:6,4:6) ]
  dummy(l)
  dummy(l, drop=FALSE)
  dummy(l, sep=":")
  dummy(l, sep="::", fun=as.logical)
  
  # TESTING NAS
  l <- c( NA, l, NA)
  dummy(l)
  dummy(l,sep=":")
  
  
  dummy(iris$Species)
  dummy(iris$Species[ c(1:3,51:53,101:103) ] )
  dummy(iris$Species[ c(1:3,51:53,101:103) ], sep=":" )
  dummy(iris$Species[ c(1:3,51:53) ], sep=":", drop=FALSE )     
  

  # TESTING TRAP FOR ONE LEVEL
  dummy( as.factor(letters)[c(1,1,1,1)] )
  dummy( as.factor(letters)[c(1,1,2,2)] )
  dummy( as.factor(letters)[c(1,1,1,1)] , drop = FALSE )   

  
  dummy.data.frame(iris)
  dummy.data.frame(iris, all=FALSE)



}

\keyword{ manip }
\keyword{ models }
