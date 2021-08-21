#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


shinyUI(fluidPage(

    titlePanel("Predict Next Word"),
    p("Please input a phrase less than 4 words in the text box. Next word will be predicted."),
    p("If next word could not be predicted, <Sorry! Not idea!> will be shown."),
    p("If more than 4 words are input, <Sorry! Too many words!> will be shown."),
    sidebarLayout(
        sidebarPanel(
            textInput("string_input",
                      h4("Please Input:"),
                      value = ""),
            br(),
            submitButton("Submit"),
        ),

        mainPanel(
            h3("Your next word maybe ..."),
            
            span(textOutput("string_output"), style="color:red;font-size:20px;font-style:italic;font-weight:bold;"),
            
        )
    )
))
