## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, warning=FALSE, message=FALSE--------------------------------------
library(leaflet)
library(leaflet.multiopacity)
library(raster)
# Create raster example
r <- raster(xmn = -2.8, xmx = -2.79,
            ymn = 54.04, ymx = 54.05,
            nrows = 30, ncols = 30)
values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
crs(r) <- CRS("+init=epsg:4326")

## ---- warning=FALSE-----------------------------------------------------------
leaflet() %>%
  addProviderTiles("OpenStreetMap", layerId = "base") %>%
  addRasterImage(r, layerId = "rast") %>%
  addAwesomeMarkers(lng = -2.79545, lat = 54.04321,
                    label = "Hospital", layerId = "hospital") %>%
  addOpacityControls()

## ---- warning=FALSE-----------------------------------------------------------
leaflet() %>%
  addProviderTiles("OpenStreetMap", layerId = "base") %>%
  addRasterImage(r, layerId = "rast") %>%
  addAwesomeMarkers(lng = -2.79545, lat = 54.04321,
                    label = "Hospital", layerId = "hospital") %>%
  addOpacityControls(collapsed = TRUE, position = "topleft")

## ---- warning=FALSE-----------------------------------------------------------
leaflet() %>%
  addProviderTiles("OpenStreetMap", layerId = "osm") %>%
  addRasterImage(r, layerId = "rast") %>%
  addAwesomeMarkers(lng = -2.79545, lat = 54.04321,
                    layerId = "hospital", label = "hospital") %>%
  addOpacityControls(layerId = c("rast", "hospital"))

## ---- warning=FALSE-----------------------------------------------------------
leaflet() %>%
  addProviderTiles("OpenStreetMap", layerId = "osm", group = "base") %>%
  addRasterImage(r, layerId = "rast", group = "rasters") %>%
  addAwesomeMarkers(lng = -2.79545, lat = 54.04321,
                    layerId = "hospital", label = "hospital",
                    group = "markers") %>%
  addOpacityControls(group = c("base", "rasters", "markers"))

## ---- warning=FALSE-----------------------------------------------------------
leaflet() %>%
  addProviderTiles("OpenStreetMap") %>%
  addRasterImage(r, layerId = "rast") %>%
  addAwesomeMarkers(lng = -2.79545, lat = 54.04321,
                    label = "hospital", layerId = "hospital") %>%
  addOpacityControls(category = c("image", "marker"))

