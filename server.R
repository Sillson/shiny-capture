
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(dplyr)
library(ggplot2)
library(rgdal)
library(RColorBrewer)
library(shiny)

shinyServer(function(input, output) {
  
  output$textDisplay <- renderText({
    paste0("You have searched for ", input$search)
  })

  output$distPlot <- renderPlot({
    
    damData <- runData[runData$dam_id == input$damSelection, ]

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = sum(strtoi(input$salmonCheck)) + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })

})
