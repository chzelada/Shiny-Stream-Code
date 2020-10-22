#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    
filtered_data <- reactive({
    drv <- dbDriver("MySQL")
    con <- dbConnect(drv, 
                     dbname = "flights",
                     host = 'academatica-stream-db.cmbfasu2mejl.us-east-2.rds.amazonaws.com', 
                     port = 3306,
                     user = 'academatica_student', 
                     password = 'BR43xe6ohn')
    query1 <- 'select x.*, y.name
    from (select distinct origin
    from flights.flights) x left join airports y on x.origin=y.faa;'
    
    query2 <- 'select x.*, y.name
    from (select distinct dest
    from flights.flights) x left join airports y on x.dest=y.faa
    where y.name is not null;'
    
    origen <-dbGetQuery(con,query1)
    destino <-dbGetQuery(con,query2)
    
    origen_sml <- origen %>% filter(name %in% input$origen) %>% pull(origin)
    destino_sml <- destino %>% filter(name %in% input$destino) %>% pull(dest)
    
    origen_tag <- paste0("'",origen_sml,"'",collapse = ",")
    destino_tag <- paste0("'",destino_sml,"'",collapse = ",")
    
    query <- 'select *
              from flights
              where origin in (<origenes>)
                    and dest in (<destinos>);'
    
    query <- gsub('<origenes>',origen_tag,query)
    query <- gsub('<destinos>',destino_tag,query)
    
    out<-dbGetQuery(con,query)
    
    dbDisconnect(con)
    
    return(out)
    
})

output$vuelos_tbl <- DT::renderDataTable({
    filtered_data() %>% DT::datatable()
})
    

})
