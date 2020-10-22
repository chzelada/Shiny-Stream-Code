library(RMySQL)
library(dplyr)


drv <- dbDriver("MySQL")
con <- dbConnect(drv, 
                 dbname = "flights",
                 host = 'academatica-stream-db.cmbfasu2mejl.us-east-2.rds.amazonaws.com', 
                 port = 3306,
                 user = 'academatica_student', 
                 password = 'BR43xe6ohn')



query <- 'select * from flights.flights limit 100'


test<-dbGetQuery(con,query)

dbDisconnect(con)


test %>% View()


test1 <- c("a","b","c")
test3<-paste0("'",test1,"'",collapse = ",")

test2 <- "Hola <nombre>!"

gsub('<nombre>',test3,test2)


