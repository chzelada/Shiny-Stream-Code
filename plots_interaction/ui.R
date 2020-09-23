
library(shiny)


shinyUI(fluidPage(

    # Application title
    titlePanel("Graficas y mas"),

    # Sidebar with a slider input for number of bins
    shiny::tabsetPanel(
        tabPanel("Plot",
                 "1"
                 ),
        tabPanel("Plot Interactions",
                 "2"
                 )
    )
))
