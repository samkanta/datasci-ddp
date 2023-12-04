# ui.R

library(shiny)

navbarPage("MPG Scatter Plot Viewer",
           
           tabPanel("Choose this Tab",
                    fluidPage(
                      tags$div(
                        tags$img(src = "images/motortrend-logo.png", height = "50px"),
                        headerPanel("Welcome"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("model", "Select Vehicle Model", choices = sort(rownames(mtcars))),
                            # Use all row names of mtcars as choices, sorted alphabetically
                          ),
                          
                          mainPanel(
                            plotOutput("mpgPlot")
                          )
                        )
                      )
                    )
           ),
           
           selected = "Choose this Tab"
)
