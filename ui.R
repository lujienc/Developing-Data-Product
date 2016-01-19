library(shiny)

## Define UI for getting FH tatings of specificed country-year
shinyUI(navbarPage("Country Specific Freedom House Ratings, 1990-2014",
        tabPanel("About",
                 includeHTML("Documentation.html")
                 ),
        tabPanel("Application",
                 sidebarPanel(
                         uiOutput("countrySelect"),
                         uiOutput("yearSelect"),
                         submitButton("Submit")
                 ),
                 mainPanel(
                         textOutput("choice1"),
                         textOutput("choice2"),
                         textOutput("outcome1"),
                         textOutput("outcome2"),
                         textOutput("outcome3")
                 ))
))