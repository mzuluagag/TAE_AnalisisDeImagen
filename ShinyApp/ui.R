library(shiny)
library(pixmap)
library(stringr)
library(e1071)
library(shinythemes)
library(DT)

load(file= "www/001",envir = .GlobalEnv,verbose = FALSE)

texto<-"La aplicación en cuestión busca identificar a las personas con gafas de sol
a partir de técnicas de aprendizaje estadístico. Para el funcionamiento de la aplicación,
            se optó por hacer uso de las máquinas de soporte vectorial, ya que la forma del problema
            cumplía con las condiciones de una máquina de soporte vectorial estándar(para dos casos
            de la variable respuesta).<br>
            Para obtener las variables para el modelo, se hizo lo siguiente: <br>
            Se usó la librería pixmap para cargar las imágenes en formato .pgm con la función read.pnm.<br>
            Luego de esto, se le extrajo a cada imagen una matriz de 120x128 dónde cada entrada de esta era 
            el color de cada pixel en donde 0 era negro y 1 era blanco(escala de grises), se le calculó la media
            a la matriz, ya que se observó que las gafas de sol al ser negras dan muchos entradas de la matriz en 0, 
            por lo tanto cómo primer supuesto se dedujo que al tener gafas de sol, la media de la matriz iba a ser menor
            en comparación a la matriz de una foto sin gafas. También al agrupar todas las medias de las fotos en
            una dataframe y extraer del nombre la palabara open o sunglasses(comillas), se notó que entre personas
            no podía ser generalizable un solo modelo, ya que no todas las personas tienen el mismo tono de piel, cantidad de cabello,
            color de cabello y tampoco tienen la cabeza del mismo tamaño, entre otros factores. Dado lo anterior, se optó por calcular un modelo
            estadístico para cada individuo.<br>
            
            Cómo se mencionó anteriormente, se calcularon 20 máquinas de soporte vectorial estándar, una por cada persona
            en la base de datos. Al calcular las predicciones, en resumen se obtuvo:<br>
            <hb>
            <table>
              <tr>
                <th>Persona</th>
                <th>Fallos</th>
                <th>Total</th>
                <th>Proporción</th>
              </tr>
              <tr>
                <td>an2i</td>
                <td>9</td>
                <td>32</td>
                <td>0.72</td>
              </tr>
            "

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
                            fluidRow(column(12, HTML(texto)))),
                            fluidRow(column(12,dataTableOutput("table")))
                            
                  )
                ))
)