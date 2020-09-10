
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
        tabPanel("click en tablas",
                 fluidRow(column(6,
                                 h2('Single Select row'),
                                 DT::dataTableOutput('tabla_3'),
                                 verbatimTextOutput('output_1')),
                          column(6,
                                 h2('Multiple Select rows'),
                                 DT::dataTableOutput('tabla_4'),
                                 verbatimTextOutput('output_2')
                                 )
                          ),
                 fluidRow(column(6,
                                 h2('Single Select cols'),
                                 DT::dataTableOutput('tabla_5'),
                                 verbatimTextOutput('output_3')
                                 ),
                          column(6,
                                 h2('Multiple Select cols'),
                                 DT::dataTableOutput('tabla_6'),
                                 verbatimTextOutput('output_4')
                                 )
                          ),
                 fluidRow(column(6,
                                 DT::dataTableOutput('tabla_7'),
                                 verbatimTextOutput('output_5')
                                 ),
                          column(6,
                                 DT::dataTableOutput('tabla_8'),
                                 verbatimTextOutput('output_6')
                                 )
                          )
                 )
    )

))
