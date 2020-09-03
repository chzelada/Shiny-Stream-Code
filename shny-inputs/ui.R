### https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
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
            dateRangeInput("date_range_input", 
                           "Seleccione el rango de fechas:",
                           start = today()-30,
                           end = today(),
                           format = 'dd/mm/yyyy', 
                           language = 'es',separator = "a"),
            checkboxInput("single_chk_box","Desea recibir informacion:",
                          value = FALSE ),
            checkboxGroupInput("chck_Box_group","Seleccione tipo:",
                               choices = c("Carro","Camioneta","Moto","tractor"),
                               selected = NULL  ),
            radioButtons("radio_input", "Seleccione uno",
                         choices = c("primaria","secundaria","universidad"),
                         selected = NULL ),
            actionButton("btn_ok","Refrescar"),
            actionButton("btn_salir","Salir"),
            actionLink("link_seguir","siguiente"),
            submitButton("Ejecutar")
        ),


        mainPanel(
            h1("Salidas de los inputs de shiny"),
            h2("slider IO"),
            verbatimTextOutput("single_slider_io"),
            h2("slider con rango"),
            verbatimTextOutput("range_slider_io"),
            h2("Salida Numeric Input"),
            verbatimTextOutput("numeric_io"),
            h2("Salida Date Input"),
            verbatimTextOutput("date_io"),
            h2("Salida Range Date Input"),
            verbatimTextOutput("range_date_io"),
            h2("Salida Check Box"),
            verbatimTextOutput("chk_box_io"),
            h2("salido del check box group"),
            verbatimTextOutput("chk_box_group_io"),
            h2("Salida del radio button"),
            verbatimTextOutput("radio_io"),
            h2("Salido Actin Button"),
            verbatimTextOutput("ab_io")
            )
    )
))
