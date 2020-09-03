
library(shiny)


shinyUI(fluidPage(


    titlePanel("Ejemplo de carga de archivo"),


    sidebarLayout(
        sidebarPanel(
            fileInput("file_upload","Cargar Archivo")
        ),


        mainPanel(
            DT::dataTableOutput("contenido_archivo")
        )
    )
))
