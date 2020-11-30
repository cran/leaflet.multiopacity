## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, eval=FALSE--------------------------------------------------------
#  library(leaflet)
#  library(leaflet.multiopacity)
#  library(raster)
#  

## ----eval=FALSE---------------------------------------------------------------
#  ui <- shiny::fluidPage(
#    leaflet::leafletOutput("map"),
#    shiny::actionButton("addLayers", "Add Layers")
#  )
#  
#  server <- function(input, output, session) {
#  
#    # Create a map inside of your server function
#    output$map <- leaflet::renderLeaflet({
#      # Create raster example
#      r <- raster::raster(xmn = -2.8, xmx = -2.79,
#                          ymn = 54.04, ymx = 54.05,
#                          nrows = 30, ncols = 30)
#      raster::values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
#      raster::crs(r) <- raster::crs("+init=epsg:4326")
#  
#      leaflet::leaflet() %>%
#        leaflet::setView(lng = -2.79545, lat = 54.04321, zoom = 14) %>%
#        leaflet::addProviderTiles("OpenStreetMap", layerId = "osm") %>%
#        leaflet.multiopacity::addOpacityControls(group = "layersToAdd",
#                                                 renderOnLayerAdd = TRUE)
#  
#    })
#  
#    # Observer that trigger a map update
#    shiny::observeEvent(input$addLayers, {
#      leaflet::leafletProxy("map", session) %>%
#        leaflet::addRasterImage(r, colors = "viridis",
#                                layerId = "raster1",
#                                group = "layersToAdd") %>%
#        leaflet::addRasterImage(r, colors = "Spectral",
#                                layerId = "raster2",
#                                group = "layersToAdd") %>%
#        leaflet::addAwesomeMarkers(lng = -2.79545, lat = 54.04321,
#                                   layerId = "hospital",
#                                   label = "Hospital",
#                                   group = "layersToAdd")
#    })
#  
#  }
#  
#  shiny::shinyApp(ui, server)

