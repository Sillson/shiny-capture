
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
                  choices=c("Willamette Falls" = "Willamette Falls",
                            "Little Goose Dam" = "Little Goose Dam",
                            "Lower Granite Dam" = "Lower Granite Dam",
                            "Priest Rapids Dam" = "Priest Rapids Dam",
                            "Wanapum Dam" = "Wanapum Dam",
                            "Rock Island Dam" = "Rock Island Dam",
                            "Rocky Reach Dam" = "Rocky Reach Dam",
                            "Wells Dam" = "Wells Dam",
                            "Bonneville Dam" = "Bonneville Dam",
                            "The Dalles Dam" = "The Dalles Dam",
                            "John Day Dam" = "John Day Dam",
                            "McNary Dam" = "McNary Dam",
                            "Ice Harbor Dam" = "Ice Harbor Dam",
                            "Lower Monumental Dam" = "Lower Monumental Dam")),
      hr(),
      checkboxGroupInput("salmonCheck",
                   label="Fish",
                   choices= c("Chinook Adult" = 1,
                              "Chinook Jack" = 2,
                              "Steelhead" = 3,
                              "Wild Steelhead" = 4,
                              "Shad" = 5,
                              "Sockeye" = 6,
                              "Lamprey" = 7,
                              "Coho Adult" = 8,
                              "Coho Jack" = 9)),
      hr(),
      textInput(inputId = "search",
                label = "Search By City",
                value = ""),
      hr(),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      textOutput("textDisplay")
    )
  )
))
