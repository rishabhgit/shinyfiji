# load shiny package
library(shiny)
# begin shiny UI
shinyUI(pageWithSidebar(
  headerPanel("Fiji Earthquake Profile"),
  sidebarPanel(
    textInput("name", "What is your name?", value=""),
    h4("Enter your localtion in Fiji"),
    sliderInput("ilat","Latitude:", min=-39, max=-10, value=-19, round=-1, step=0.1),
    sliderInput("ilong","Longitude:", min=165, max=189, value=169, round=-1, step=0.1),
    #numericInput("ilat", "Latitude (between -39 & -10)", value=-35, min = -39, max = -10),
    #numericInput("ilong", "Longitude (between 165 & 189)", value=175, min = 165, max = 189),
    actionButton("calculate","Closest Earthquake"),
    h3("Instructions"),
    tags$ul(
      tags$li("This app displays earthquake occurences in areas surrounding Fiji using quakes dataset"),
      tags$li("Select a set of latitudes and longitudes to specify a location"),
      tags$li("The slider values allow you to select only locations in Fiji region"),
      tags$li("The app then displays a map of historical earthquakes and the distance of closest earthquake from the location selected"),
      tags$li("The colour and size of the circles indicate the magnitude of the earthquake")
    )
  ),
  mainPanel(
    h3(textOutput("oname")),
    htmlOutput("gvis"),
    h4(textOutput("odist"))
    
  )
))