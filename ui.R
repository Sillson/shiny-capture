
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Columbia River Salmon Runs"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      dateRangeInput(inputId="dateRange",
                     label="Dates Between",
                     min = as.Date("2015-07-15"), max = Sys.Date()),
      hr(),
      selectInput(inputId="damSelection",
                  label="Dam",
                  choices=c("Bonneville Dam"=4,
                            "Ice Harbor Dam"=8,
                            "John Day Dam"=6,
                            "Little Goose Dam"=10,
                            "Lower Granite Dam"=11,
                            "Lower Monumental Dam"=9,
                            "McNary Dam"=7,
                            "Priest Rapids Dam"=12,
                            "Rock Island Dam"=14,
                            "Rocky Reach Dam"=15,
                            "The Dalles Dam"=5,
                            "Wanapum Dam"=13,
                            "Wells Dam"=16,
                            "Willamette Falls"=3)),
      hr(),
      checkboxGroupInput("salmonCheck",
                         label="Fish",
                         selected = 1,
                         choices= c("Chinook Adult" = 1,
                                    "Chinook Jack" = 2,
                                    "Steelhead" = 3,
                                    "Wild Steelhead" = 4,
                                    "Shad" = 5,
                                    "Sockeye" = 6,
                                    "Lamprey" = 7,
                                    "Coho Adult" = 8,
                                    "Coho Jack" = 9))
     
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      textOutput("textDisplay")
    )
  )
))
