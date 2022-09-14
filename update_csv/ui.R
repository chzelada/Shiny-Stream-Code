
library(shiny)


shinyUI(fluidPage(


    titlePanel("Refresh CSV Example"),


    sidebarLayout(
        sidebarPanel(
            actionButton('refresh','Refresh')
        ),

        mainPanel(
            DT::dataTableOutput('file')
        )
    )
))
