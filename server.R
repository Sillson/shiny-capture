
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
    damData <- filter(damData, fish_id %in% input$salmonCheck)
    
    damData$fish_id[damData$fish_id == 1] <- "Chinook Adult"
    damData$fish_id[damData$fish_id == 2] <- "Chinook Jack"
    damData$fish_id[damData$fish_id == 3] <- "Steelhead"
    damData$fish_id[damData$fish_id == 4] <- "Wild Steelhead"
    damData$fish_id[damData$fish_id == 5] <- "Shad"
    damData$fish_id[damData$fish_id == 6] <- "Sockeye"
    damData$fish_id[damData$fish_id == 7] <- "Lamprey"
    damData$fish_id[damData$fish_id == 8] <- "Coho Adult"
    damData$fish_id[damData$fish_id == 9] <- "Coho Jack"
    
    damTable <- data.table(damData)
    
 
    
    aggrSet <- damTable[, .(count=sum(count)), by=.(count_date, fish_id)]
    
    ggplot(data=aggrSet, aes(x=count_date, y=count, group=fish_id, colour=fish_id)) + 
      geom_line()

  })

})
