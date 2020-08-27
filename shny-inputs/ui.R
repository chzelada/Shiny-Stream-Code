
library(shiny)
library(lubridate)


shinyUI(fluidPage(


    titlePanel("Catalogo de Inputs de Shiny"),


    sidebarLayout(
        sidebarPanel(
            sliderInput("slider_input","Seleccione un valor:",
                        min = 0,
                        max = 100,
                        value = 25,
                        step = 1,
                        animate= TRUE,
                        post = '%'),
            sliderInput("range_slider","Sleccione rango:",
                        min = 0,
                        max=100,
                        value = c(0,100)),
            numericInput("numeric_input","Seleccio edad:",
                         value = 10,min=0,max=150),
            dateInput("single_date_input","Ingrese la fecha:", 
                      value = today(),
                      min = today()-365,
                      max=today(),
                      language = "es",
                      weekstart = 1,),
            dateRangeInput("date_range_input", "Seleccione el rango de fechas:",
                           start = today()-30,
                           end = today(),
                           format = 'dd/mm/yyyy', 
                           language = 'es',separator = "a")
        ),


        mainPanel(
            h1("Salidas de los inputs de shiny"),
            h2("slider IO"),
            verbatimTextOutput("single_slider_io"),
            h2("slider con rango"),
            verbatimTextOutput("range_slider_io"),
            h2("Salida Numeric Input"),
            verbatimTextOutput("numeric_io"),
            ("Salida Date Input"),
            verbatimTextOutput("date_io"),
            ("Salida Range Date Input"),
            verbatimTextOutput("range_date_io")
        )
    )
))
