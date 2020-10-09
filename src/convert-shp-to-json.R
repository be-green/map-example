library(leaflet)
library(ggplot2)
library(tigris)

# make directory if you are missing it
if(!dir.exists("./data/shp")) {
  dir.create("./data/shp", recursive = T)
}

if(!dir.exists("./data/json")) {
  dir.create("./data/json", recursive = T)
}



# update cache directory with shape files
options(tigris_use_cache = TRUE)
tigris::tigris_cache_dir("data/shp")
readRenviron('~/.Renviron')

# download counties
invisible(tigris::counties())

# read in shape file
county_map <- rgdal::readOGR("data/shp/tl_2019_us_county.shp")

# convert to geojson
json <- geojsonio::geojson_json(county_map)
geojsonio::geojson_write(json, file = "data/json/tl_2019_us_county.geojson", lat = 'lat', lon = 'long')

