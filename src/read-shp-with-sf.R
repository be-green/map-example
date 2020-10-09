# check if string-based geojson works

library(data.table)
library(maptools)
library(sp)

test <- sf::st_read("data/shp/tl_2019_us_county.shp")

pal <- colorNumeric("viridis", NULL)

leaflet(test) %>%
  addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
              fillColor = ~pal(log10(as.numeric(ALAND))),
              label = ~paste0(NAME, ": ", formatC(ALAND, big.mark = ",")))
