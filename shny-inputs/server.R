
library(shiny)


shinyServer(function(input, output) {

    output$single_slider_io <- renderPrint({
        print(input$slider_input)
        print(str(input$slider_input))
    })
    
    output$range_slider_io <- renderPrint({
        input$range_slider
    })
    
    output$numeric_io <- renderPrint({
        input$numeric_input
    })
    
    output$date_io <- renderPrint({
        input$single_date_input
    })
    
    output$range_date_io <- renderPrint({
        input$date_range_input
    })

})
