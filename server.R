library(shiny)
library(tidyr)

## Reading data
fhall <- read.csv("FH_ALL_19902014.csv", na.strings=c("..",""), skip=2)
names(fhall)[1] <- "CT"

## Reshaping data
fhall_PR <- fhall[, c("CT", grep("PR", names(fhall), value=TRUE))] 
fhall_CL <- fhall[, c("CT", grep("CL", names(fhall), value=TRUE))]
fhall_ST <- fhall[, c("CT", grep("Status", names(fhall), value=TRUE))]

fhall_PRL <- gather(fhall_PR, yrs, prights, PR:PR.24)
fhall_CLL <- gather(fhall_CL, yrs, cliberty, CL:CL.24)
fhall_STL <- gather(fhall_ST, yrs, status, Status:Status.24)

levels(fhall_PRL$yrs) <- c(1990:2014)
levels(fhall_CLL$yrs) <- c(1990:2014)
levels(fhall_STL$yrs) <- c(1990:2014)

fhall_temp <- merge(fhall_PRL, fhall_CLL, by=c("CT", "yrs"))
fhall_final <- merge(fhall_temp, fhall_STL, by=c("CT", "yrs"))
names(fhall_final) <-c("Country", "Years", "Rights", "Liberty", "Status")
fhall_final$Years <- 1989 + as.numeric(fhall_final$Years)
fhall_final$Country <- as.character(fhall_final$Country)

# Get value range for inputs
yrs <- unique(fhall_final$Years)
cts <- unique(fhall_final$Country)

# Server codes
shinyServer(
        function(input, output) {
                output$countrySelect <- renderUI({
                        selectInput("countries", "Select country of interest:", cts) 
                })
                output$yearSelect <- renderUI({
                        selectInput("years", "Select year of interest:", yrs)
                })
                output$choice1 <- renderText({
                        paste("You have selected: ", input$countries)
                })
                output$choice2 <- renderText({
                        paste("You have chosen year: ", input$years)
                })
                output$outcome1 <- renderText({
                        paste("FH rating for its political rights is: ", fhall_final[(fhall_final$Country==input$countries)&(fhall_final$Years==input$years), 3])
                })
                output$outcome2 <- renderText({
                        paste("FH rating for its civil liberty is: ", fhall_final[(fhall_final$Country==input$countries)&(fhall_final$Years==input$years), 4])
                })
                output$outcome3 <- renderText({
                        paste("FH rating for its overall status of freedom is: ", fhall_final[(fhall_final$Country==input$countries)&(fhall_final$Years==input$years), 5])
                })
        })