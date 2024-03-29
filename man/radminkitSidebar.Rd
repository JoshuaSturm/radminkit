% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radminkitSidebar.R
\name{radminkitSidebar}
\alias{radminkitSidebar}
\title{Create a radminkit sidebar}
\usage{
radminkitSidebar(..., title = NULL, width = NULL, header = NULL)
}
\arguments{
\item{...}{Optional items to put in the sidebar. See Details sections}

\item{title}{Brand title to use in the sidebar}

\item{width}{(optional) Width of the sidebar}

\item{header}{A \code{\link{radminkitHeader}} item}
}
\description{
Create a radminkit sidebar
}
\details{
The \code{title} can be text, an image, or both.
To include mutliple objects, e.g. a picture and some text,
wrap them in a list.
}
\examples{
\dontrun{
radminkitSidebar(
  title = list(img("path/to/img", alt = "description of image"))
)
}

}
