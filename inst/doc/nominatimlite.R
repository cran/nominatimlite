## ---- include = FALSE------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  fig.path = "./",
  comment = "#>",
  tidy = "styler",
  warning = FALSE,
  message = FALSE
)


## ----McDonalds-------------------------------------------------------------------------------------------------------
library(nominatimlite)

# Extract some points - McDonalds in California

LA <- geo_lite_sf("California", points_only = FALSE)

McDonalds <- geo_lite_sf("McDonalds, California",
  limit = 50,
  custom_query = list(countrycodes = "us")
)

library(ggplot2)

ggplot(LA) +
  geom_sf() +
  geom_sf(data = McDonalds, col = "red")


## ----penta-----------------------------------------------------------------------------------------------------------

pentagon_poly <- geo_lite_sf("Pentagon", points_only = FALSE)

ggplot(pentagon_poly) +
  geom_sf()


## ----example---------------------------------------------------------------------------------------------------------
library(tibble)

# create a dataframe with addresses
some_addresses <- tribble(
  ~name,                  ~addr,
  "White House",          "1600 Pennsylvania Ave NW, Washington, DC",
  "Transamerica Pyramid", "600 Montgomery St, San Francisco, CA 94111",
  "Willis Tower",         "233 S Wacker Dr, Chicago, IL 60606"
)

# geocode the addresses
lat_longs <- geo_lite(some_addresses$addr, lat = "latitude", long = "longitude")


## ----echo=FALSE------------------------------------------------------------------------------------------------------
knitr::kable(lat_longs)


## --------------------------------------------------------------------------------------------------------------------
reverse <- reverse_geo_lite(
  lat = lat_longs$latitude, long = lat_longs$longitude,
  address = "address_found"
)


## ---- echo = FALSE---------------------------------------------------------------------------------------------------
knitr::kable(reverse)

