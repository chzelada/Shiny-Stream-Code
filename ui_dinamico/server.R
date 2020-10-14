
library(shiny)


shinyServer(function(input, output, session) {

    observeEvent(input$min,{
        updateSliderInput(session,"slider_eje1",min=input$min)
    })
    
    observeEvent(input$max,{
        updateSliderInput(session,"slider_eje1",max=input$max)
    })
    
    observeEvent(input$clean,{
        updateSliderInput(session,'s1',value=0)
        updateSliderInput(session,'s2',value=0)
        updateSliderInput(session,'s3',value=0)
        updateSliderInput(session,'s4',value=0)
    })
    
    observeEvent(input$n,{
        texto_boton <- paste0('Correr ', input$n, ' veces')
        updateActionButton(session,'correr',label=texto_boton)
    })
    
    observeEvent(input$nvalue,{
        updateNumericInput(session,'nvalue',value=input$nvalue+1)
    })
    
    
    observeEvent(input$celsius,{
        f <- round( input$celsius*(9/5)+32 )
        updateNumericInput(session,'farenheit',value=f)
    })
    
    observeEvent(input$farenheit,{
        c <- round( (input$farenheit-32)*5/9 )
        updateNumericInput(session,'celsius',value=c)
    })
    
    
    observeEvent(input$dist,{
        updateTabsetPanel(session,'params',selected=input$dist)
    })
    
    sample <- reactive({
        switch(input$dist,
               normal = rnorm(input$nrandom,input$mean, input$sd),
               uniform = runif(input$nrandom,input$min,input$max),
               exponential = rexp(input$nrandom,input$rate)
        )
    })
    
    output$plot_dist <- renderPlot({
        hist(sample())
    })
    
    

})
