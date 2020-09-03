
library(shiny)
library(readr)
library(DT)

shinyServer(function(input, output) {

archivo_cargado <- reactive({
    contenido_archivo<-input$file_upload
    if(is.null(contenido_archivo)){
        return(NULL)
    }
     out <- read_csv(contenido_archivo$datapath)
     return(out)
})


output$contenido_archivo <- DT::renderDataTable({
    DT::datatable(archivo_cargado())
    
})

})
