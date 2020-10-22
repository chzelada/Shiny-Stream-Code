
library(shiny)
library(RMySQL)
library(DT)



drv <- dbDriver("MySQL")
con <- dbConnect(drv, 
                 dbname = "flights",
                 host = '<HOST>', 
                 port = 3306,
                 user = 'academatica_student', 
                 password = '<password>')

query1 <- 'select x.*, y.name
    from (select distinct origin
from flights.flights) x left join airports y on x.origin=y.faa;'

query2 <- 'select x.*, y.name
    from (select distinct dest
from flights.flights) x left join airports y on x.dest=y.faa
where y.name is not null;'

origen <-dbGetQuery(con,query1)
destino <-dbGetQuery(con,query2)
dbDisconnect(con)


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Dashboard Flights"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput('origen', "Seleccione origen:",
                        choices = origen$name,
                        selected = 'John F Kennedy Intl', 
                        multiple = TRUE ),
            selectInput('destino', "Seleccione destino:",
                        choices = destino$name,
                        selected = 'Chicago Ohare Intl',
                        multiple = TRUE )
        ),

        # Show a plot of the generated distribution
        mainPanel(
            DT::dataTableOutput('vuelos_tbl')
        )
    )
))
