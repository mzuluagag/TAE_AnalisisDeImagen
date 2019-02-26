library(shiny)
library(pixmap)
library(stringr)
library(e1071)
library(shinythemes)

tablaRes$Total<-as.integer(tablaRes$Total)
shinyServer(function(input, output) {
  
  output$table1=renderTable({
    tablaRes
  })
  observeEvent(input$apply, {
    showModal(modalDialog(
      title = "Resultados del analisis de imagen",
      footer = modalButton("Cerrar"),
      easyClose = TRUE,
      fluidRow(column(10, align = "center", offset = 1,... = 2,
                      output$result <- renderText(
                        if(input$apply){
                          if(DetectorGafas(input$picture) == 1){
                            "Tiene gafas"
                          }
                          else{
                            "No tiene gafas"
                          }
                        }
                      ),
                      output$result <- renderPlot(
                        if(input$apply){
                          aux<-paste("./www/",input$picture,sep="")
                          img<-read.pnm(aux)
                          plot(img)
                        }
                      )
      ))
    ))
  })
})
