library(shiny)
library(dplyr)
library(MASS)
library(Hmisc)
library(lubridate)


shinyServer(function(input, output) {
  observeEvent(input$apply2, {
    showModal(modalDialog(
      title = "Resultados del analisis de imagen",
      footer = modalButton("Cerrar"),
      easyClose = TRUE,
      fluidRow(column(10, align = "center", offset = 1,
                      output$result <- renderText(
                        if(input$apply2){
                          FUNCNAME(input$picture)
                        }
                      )
      ))
    ))
  })
})
