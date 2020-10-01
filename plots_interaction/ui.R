
library(shiny)


shinyUI(fluidPage(

    # Application title
    titlePanel("Graficas y mas"),

    # Sidebar with a slider input for number of bins
    shiny::tabsetPanel(
        tabPanel("Plot Interactions",
                 plotOutput("plot_click_options",
                            click = "clk",
                            dblclick = "dclk",
                            hover = 'mhover',
                            brush = 'mbrush' ),
                 verbatimTextOutput("click_data"),
                 tableOutput("mtcars_tbl")
        ),
        tabPanel("Plot",
                 h1("Graficas en Shiny"),
                 plotOutput("grafica_base_r"),
                 plotOutput("grafica_ggplot")
                 )
        
    )
))
