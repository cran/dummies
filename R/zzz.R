
.First.lib <- function(libname, pkgname) {

  if( is.null( getOption("dummy.classes") ) )  
  options( "dummy.classes" = c("factor","character") )

}
