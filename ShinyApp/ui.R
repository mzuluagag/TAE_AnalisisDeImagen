library(shiny)
library(pixmap)
library(stringr)
library(e1071)
library(shinythemes)

load(file= "www/001",envir = .GlobalEnv,verbose = FALSE)

texto <- "La aplicación en cuestión buscar identificar a las personas con gafas de sol
a partir de técnicas de aprendizaje estadístico. Para el funcionamiento de la aplicación,
se optó por hacer uso de las máquinas de soporte vectorial, ya que la forma del problema
cumplía con las condiciones de una máquina de soporte vectorial estándar(para dos casos
de la variable respuesta). Para obtener las variables para el modelo"

shinyUI(fluidPage(
theme = "style.css",
fillRow(navbarPage("Detector de lentes",
                   tabPanel(class="wrapper", "Aplicacion",
                            fluidRow(column(10, align = "center", offset = 1, h2("Detector de lentes"))),
                            fluidRow(column(12, align = "center", selectInput("picture", "Seleccione...",
                                                                              choices = listaArchivos))),
                            fluidRow(column(12, align = "center", actionButton("apply", label = "Analizar imagen")))),
                   
                   tabPanel(class="wrapper", "Explicacion",
                            fluidRow(column(10, align = "center", offset = 1, h2("Funcionamiento del modelo"))),
                            hr(),
                            fluidRow(column(12, HTML(texto))))
                  )
)))