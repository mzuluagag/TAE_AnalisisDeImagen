library(shiny)
library(pixmap)
library(stringr)
library(keras)
library(shinythemes)



modelof<-load_model_hdf5("www/red")
DetectorGafas<-function(x){
  img<-read.pnm(x,cellres=1)
  calc<-array_reshape(as.vector(img@grey),c(1,960))
  total<-predict_classes(modelof,calc)
  return(total)
}
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
                          modelof<-load_model_hdf5("www/red")
                          if(DetectorGafas(paste("./www/",input$picture,sep="")) == 1){
                            "Tiene gafas de sol"
                          }
                          else{
                            "No tiene gafas de sol"
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
