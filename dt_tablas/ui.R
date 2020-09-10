
library(shiny)
library(DT)


shinyUI(fluidPage(

    titlePanel("Todo sobre tablas en shiny"),

    tabsetPanel(
        tabPanel("Tablas en DT",
                 h1('Vista Basica'),
                 fluidRow(
                     column(12,DT::dataTableOutput("tabla_1"))
                     ),
                 h1("Agregar filtros"),
                 fluidRow( column(12, DT::dataTableOutput("tabla_2")))
                 ),
        tabPanel("click en tablas",'2')
    )

))
