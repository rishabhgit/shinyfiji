library(shiny)
library(datasets)
library(googleVis)
data(quakes)
source("fiji_quakes.R")

shinyServer(
  function(input, output) {
    
    
      
    observeEvent(input$calculate, {
      usr_lat <- input$ilat
      usr_long <- input$ilong
      quakes$latlong <- paste(quakes$lat, quakes$long, sep=":")
      g <- gvisGeoChart(quakes, locationvar='latlong', colorvar='mag', 
                        options=list(region='FJ', displayMode='markers',
                                     colorAxis="{values:[4.00,4.30,4.60,6.40],
                                    colors:[\'green', \'orange\', \'pink',\'red']}",
                                     backgroundColor="lightblue")) 
      dist <- near.quake(usr_lat, usr_long)
      output$oname <- renderText({paste("Hi,",input$name, sep=" ")})
      output$odist <- renderText({paste("Distance to nearest earthquake from your location is"
                                        ,dist[1],"kms with a magnitude"
                                        ,quakes$mag[dist[2]],  sep=" ")}) 
      output$gvis <- renderGvis({g})
      
    })  
      
  
    
    
      
      
      
}


)
    
   
  
