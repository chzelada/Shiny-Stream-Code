
library(shiny)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output) {

output$tabla_1 <- DT::renderDataTable({
    mtcars %>% DT::datatable(rownames = FALSE,
                             filter = 'top',
                             extensions = 'Buttons',
                             options = list(
                                 pageLength = 5,
                                 lengthMenu = c(5, 10, 15),
                                 dom = 'Bfrtip',
                                 buttons = c('csv')
                                 
                             ) )
})

output$tabla_2 <- DT::renderDataTable({
    diamonds %>% DT::datatable(filter = 'top')
})

})
