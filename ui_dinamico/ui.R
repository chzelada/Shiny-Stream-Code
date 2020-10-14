
library(shiny)


shinyUI(fluidPage(


    titlePanel("Ejemplos de UI Dinamicos"),
    tabsetPanel( tabPanel("Ejemplo 1",
                          numericInput("min","Limite inferior",
                                       value = 5),
                          numericInput("max","Limite superior",
                                       value = 10),
                          sliderInput("slider_eje1","Seleccione intervalo",
                                      min = 0,
                                      max= 15,
                                      value = 5)
                          ),
                 tabPanel("Ejemplo 2",
                          sliderInput('s1', 's1',value = 0,min=-5,max=5),
                          sliderInput('s2', 's2',value = 0,min=-5,max=5),
                          sliderInput('s3', 's3',value = 0,min=-5,max=5),
                          sliderInput('s4', 's4',value = 0,min=-5,max=5),
                          actionButton("clean","Limpiar")
                          ),
                 tabPanel("Ejemplo 3",
                          numericInput('n',"corridas",value=10),
                          actionButton('correr','correr')
                          ),
                 tabPanel("Ejemplo 4",
                          numericInput('nvalue','valor',value = 0)
                          ),
                 tabPanel('Ejemplo 5',
                          numericInput('celsius','Temperatura en Celcius',
                                       value=NA,step = 1),
                          numericInput('farenheit',"Temperatura en Farenheit",
                                       value=NA,step=1)
                          ),
                 tabPanel('Ejemplo 6',
                          selectInput('dist',"Distribucion",
                                      choices = c('normal','uniform','exponential')),
                          
                          numericInput('nrandom','Numero de muestras',100),
                          tabsetPanel(id="params",
                                      type = 'hidden',
                                      tabPanel('normal',
                                               numericInput('mean','Media', value=0),
                                               numericInput('sd','Desviacion',value=1)
                                      ),
                                      tabPanel('uniform',
                                               numericInput('min',"minimo",0),
                                               numericInput('max','maximo',1)
                                      ),
                                      tabPanel('exponential',
                                               numericInput('rate','razon',value=1,min=0))
                          ),
                          plotOutput('plot_dist')
                 )
                 
                 )

   
))
