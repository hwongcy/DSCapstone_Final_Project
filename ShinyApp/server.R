#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
suppressPackageStartupMessages({
    library(stringr)
    library(dplyr)
    library(tidyr)
    library(tidytext)
})

source("ngrams.R")

shinyServer(function(input, output) {


    output$string_output <- renderText({

        #string_output <- input$string_input
        
        string_output <- guess_next_word(input$string_input)
        
        return(string_output)

    })

})
