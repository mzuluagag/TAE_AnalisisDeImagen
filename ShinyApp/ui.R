library(shiny)
library(MASS)
library(dplyr)
library(Hmisc)
library(lubridate)
library(shinythemes)
texto <- "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Ut ac ligula fermentum, elementum felis a, hendrerit metus.
Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
Donec sagittis mattis enim, vel hendrerit libero rhoncus a. </br>

Praesent id purus pharetra, accumsan ante id, ullamcorper sapien.
Aenean auctor leo mauris, nec consectetur sapien vehicula sit amet.
Vivamus in nulla at tortor ullamcorper tincidunt.</br>

Donec leo purus, dapibus nec eros sed, ornare efficitur augue.
Praesent pretium tempor elit, eu iaculis neque feugiat sed.
Curabitur turpis massa, ultrices eget elit quis, molestie accumsan metus.
In hendrerit euismod molestie. Nulla et ex vitae magna lobortis pellentesque dapibus at dui.
Vivamus mattis diam sit amet tellus euismod, non accumsan tellus faucibus.</br>

Pellentesque eu tempus diam. Donec a lacus non quam elementum rhoncus at sit amet tellus.
Maecenas vestibulum gravida pretium. Nam malesuada risus sapien, eget consectetur enim fringilla eu.
Integer luctus, est id porta scelerisque, sapien libero ultrices tellus, at tristique erat mauris at erat.
Sed et efficitur nisl. Etiam suscipit ac diam vitae viverra. Proin id mauris nec leo tincidunt placerat molestie non enim. </br>

Vestibulum finibus aliquet ligula sed luctus. Nulla et diam sit amet lorem fermentum iaculis nec a tortor. 
Duis sit amet felis ac nisi pulvinar dictum. Sed porttitor nisi quis erat tincidunt, ac maximus massa facilisis.</br>

Nulla vel scelerisque tortor, eget suscipit mi. Vivamus elementum magna risus. Nam dapibus hendrerit tristique. 
Curabitur euismod turpis id egestas tempor. Aliquam tortor mi, sodales sed venenatis sit amet, sodales eget felis.
Donec enim tellus, pharetra ut accumsan vitae, porta sed justo."

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
                            fluidRow(column(10, align = "center", offset = 1, h2("Funcionamiento del modelo"))),
                            hr(),
                            fluidRow(column(12, HTML(texto))))
                  )
)))