library(shiny)
library(pixmap)
library(stringr)
library(e1071)
library(shinythemes)


shinyServer(function(input, output) {
  observeEvent(input$apply, {
    showModal(modalDialog(
      title = "Resultados del analisis de imagen",
      footer = modalButton("Cerrar"),
      easyClose = TRUE,
      fluidRow(column(10, align = "center", offset = 1,
                      output$result <- renderText(
                        if(input$apply){
                          DetectorGafas(input$picture)
                        }
                      ),
                      output$result <- renderPlot(
                        if(input$apply){
                          GrafiGafas(input$picture)
                        }
                      )
      ))
    ))
  })
})
