% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\encoding{UTF-8}
\name{osm_amenities}
\alias{osm_amenities}
\title{OpenStreetMap amenity database}
\format{
A \code{\link[tibble:tibble]{tibble}} with with
136 rows and
fields:
\describe{
\item{category}{The category of the amenity.}
\item{amenity}{The value of the amenity.}
\item{comment}{A brief description of the type of amenity.}
}
}
\source{
\url{https://wiki.openstreetmap.org/wiki/Key:amenity}
}
\description{
Database with the list of amenities available on OpenStreetMap.
}
\note{
Data extracted on \strong{03 April 2024}.
}
\examples{

data("osm_amenities")

osm_amenities
}
\seealso{
Other amenity: 
\code{\link{geo_amenity}()},
\code{\link{geo_amenity_sf}()}
}
\concept{amenity}
\concept{datasets}
