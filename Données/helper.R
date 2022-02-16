library(leaflet)
library(rgdal)

# leaflet documentation : 
# http://rstudio.github.io/

fileCantons <- "C:/Users/nicolas.ricci/workspace/maps/K4_kant20220101_gf/K4kant20220101gf_ch2007Poly.shp"
cantonsData <- readOGR(fileCantons, use_iconv = TRUE, encoding = "UTF-8")
cantonsData <- spTransform(cantonsData, CRS("+proj=longlat +datum=WGS84"))

leaflet(cantonsData) %>%
  addTiles() %>%
  addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5,
              fillColor = "blue",
              label = ~name,
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE))


###############################

fileDepartements <- "C:/Users/nicolas.ricci/workspace/maps/departements.geojson"
departementsData <- readOGR(fileDepartements, use_iconv = TRUE, encoding = "UTF-8")

leaflet(departementsData) %>%
  addTiles() %>%
  addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5,
              fillColor = "blue",
              label = departementsData$nom,
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE))
