library(shiny)
library(ggplot2)

dataset <- mtcars

shinyUI(pageWithSidebar(
    headerPanel("Motor Trend Car Road Tests Data Set Explorer"),
    sidebarPanel(
        selectInput('x', 'X Variable:', names(dataset)),
        selectInput('y', 'Y Variable:', names(dataset), names(dataset)[[2]]),
        selectInput('color', 'Color points w.r.t. Variable:', c('None', names(dataset))),
        
        checkboxInput('jitter', 'Jitter'),
        checkboxInput('smooth', 'Smooth'),
        
        selectInput('facet_row', 'Row Facet according to Variable:', c(None='.', names(dataset))),
        selectInput('facet_col', 'Column Facet according to Variable:', c(None='.', names(dataset))),
    
        h3("Variables:"),
        "mpg:   Miles/(US) gallon",br(),
        "cyl:   Number of cylinders",br(),
        "disp:  Displacement (cu.in.)",br(),
        "hp:    Gross horsepower",br(),
        "drat:  Rear axle ratio",br(),
        "wt:    Weight (lb/1000)",br(),
        "qsec:  1/4 mile time",br(),
        "vs:    V/S",br(),
        "am:    Transmission (0 = automatic, 1 = manual)",br(),
        "gear:  Number of forward gears",br(),
        "carb:  Number of carburetors"
    ),
    mainPanel(
        plotOutput('plot')
    )
))
