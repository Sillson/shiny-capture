
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(dplyr)
library(tidyr)
library(ggplot2)
library(rgdal)
library(RColorBrewer)
library(shiny)

shinyServer(function(input, output) {
  
  output$textDisplay <- renderText({
    paste0("You have searched for ", input$search)
  })

  output$distPlot <- renderPlot({
    
    damData <- filter(runData, dam_id == input$damSelection)
    damData <- filter(damData, count_date > input$dateRange[1] & count_date < input$dateRange[2])

    ggplot(damData, aes(count_date)) +
      geom_line(data=damData[damData$fish_id==strtoi(input$salmonCheck), ], aes(y = count))

  })

})
