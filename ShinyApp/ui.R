library(shiny)
library(MASS)
library(dplyr)
library(Hmisc)
library(lubridate)
library(shinythemes)
shinyUI(fluidPage(
theme = "style.css",
fillRow(navbarPage("Detector de lentes",
                   tabPanel(class="wrapper", "Aplicacion",
                            fluidRow(column(10, align = "center", offset = 1, h2("Detector de lentes"))),
                            fluidRow(column(12, align = "center", fileInput("picture", "Selecciona un archivo(PNG/JPEG)",
                                                                            accept = c('image/png', 'image/jpeg'),
                                                                            width = '60%'))),
                            fluidRow(column(12, align = "center", actionButton("apply", label = "Analizar imagen")))),
                   
                   tabPanel(class="wrapper", "Explicacion",
                            fluidRow(column(10, align = "center", offset = 1,
                           h2("Funcionamiento del modelo"))))
                  )
)))