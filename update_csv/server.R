

library(shiny)
library(readr)
data <- read_csv("data.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  observeEvent(input$refresh,{
    data <<- read_csv("data.csv")
  })
  
  
  output$file <- DT::renderDataTable({
    input$refresh
    DT::datatable(data)
  })  

})
