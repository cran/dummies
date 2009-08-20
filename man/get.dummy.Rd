\name{get.dummy}
\Rdversion{1.1}
\alias{get.dummy}
\alias{get.dummies}
\title{
   Get the dummy variable columns from a data frame.
}
\description{
  Given a data.frame and an optional variables name, return only the 
  columns whtat are dummy variables
}
\usage{
get.dummy(data, name = NULL)
get.dummies(data, name = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
    A data.frame with an dummies attributes
  }
  \item{name}{
    Optional.  The name of a variable. 
  }
}

\details{
   
   This uses \code{\link{which.dummy}} to identify the dummy columns.
}
\value{
    The subset of \code{data} that are dummy columns.
}
\author{
Christopher Brown
}



\seealso{
  \code{\link{which.dummy}},
  \code{\link{dummy.data.frame}}
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(data,name=NULL) {
    
  if( ! is.null(name) ) {
    dat <- data[ , which.dummy(data, name) ]  
  } else {
    dat <- data[ , which.dummy(data) ] 
  }

  return(dat)
  }
}
\keyword{ manip }
