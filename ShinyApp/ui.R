library(shiny)
library(pixmap)
library(stringr)
library(e1071)
library(shinythemes)

load(file= "www/001",envir = .GlobalEnv,verbose = FALSE)

texto<-"La aplicación en cuestión busca identificar a las personas con gafas de sol
a partir de técnicas de aprendizaje estadístico. Para el funcionamiento de la aplicación,
            se optó por hacer uso de las máquinas de soporte vectorial, ya que la forma del problema
            cumplía con las condiciones de una máquina de soporte vectorial estándar(para dos casos
            de la variable respuesta).<br><br>
            Inicialmente se procedió a solo usar las imágenes de mayor resolución porque son las que mayor información poseen(para esto, se utilizó algoritmo en Python).
            Para obtener las variables para el modelo, se hizo lo siguiente: 
            Se usó la librería pixmap para cargar las imágenes en formato .pgm con la función read.pnm,
            luego de esto, se le extrajo a cada imagen una matriz de 120x128 dónde cada entrada de esta era 
            el color de cada pixel en donde cada entrada era entre 0 y 1(0 era negro y 1 era blanco(escala de grises)), se le calculó la media
            a la matriz, ya que se observó que las gafas de sol al ser negras dan muchos entradas de la matriz en 0, 
            por lo tanto cómo primer supuesto se dedujo que al tener gafas de sol, la media de la matriz iba a ser menor
            en comparación a la matriz de una foto sin gafas. También al agrupar todas las medias de las fotos en
            un dataframe y extraer del nombre la palabara 'open' o 'sunglasses', se notó que entre personas
            no podía ser generalizable un solo modelo, ya que no todas las personas tienen el mismo tono de piel, cantidad de cabello,
            color de cabello, el tamaño de la cabeza, entre otros factores. Dado lo anterior, se optó por calcular un modelo
            estadístico para cada individuo.<br><br>

            Cómo se mencionó anteriormente, se calcularon 20 máquinas de soporte vectorial estándar, una por cada persona
            en la base de datos; la aplicación funciona de la siguiente manera: La persona escoge una imagen del menú desplegable(se excluyeron las imágenes corruptas(.bad)).
            Luego de esto, se le ingresa el nombre de la imagen cómo una cadena de texo a una función alojada en una imagen de R, la cuál
            verifica quién es la persona en cuestión. Al verificar, carga las predicciones hechas para esa persona y devuelve la de la imagen escogida.
            La función retorna un 1 o un 0, pero en la aplicación se le transformó a un texto más amigable al usuario final.<br><br>
            Al calcular todas las predicciones, en resumen se obtuvo:<br><br>
            <hb>
            <table>"
              
            texto2<-"Del total de predicciones se obtuvieron 146 fallos, en otras palabras: Se obtuvo un 76.6% de éxito en las predicciones
            de la aplicación.<br><br><br><br><br><br>"


shinyUI(fluidPage(
theme = "style.css",
fillRow(navbarPage("Detector de lentes",
                   tabPanel(class="wrapper", "Aplicacion",
                            fluidRow(column(10, align = "center", offset = 1, h2("Detector de lentes"))),
                            fluidRow(column(12, align = "center", selectInput("picture", "Seleccione una imagen de la",
                                                                              choices = listaArchivos))),
                            fluidRow(column(12, align = "center", actionButton("apply", label = "Analizar imagen")))),
                   
                   tabPanel(class="wrapper", "Explicacion",
                            fluidRow(column(10, align = "center", offset = 1, h2("Funcionamiento del modelo"))),
                            hr(),
                            fluidRow(column(12, HTML(texto)))),
                            column(12,align="center",
                                   helpText("Resumen de la predicción"),
                                   tableOutput("table1")),
                            column(12,HTML(texto2)),
                            fluidRow(column(12,align="center",dataTableOutput("table")))
                            
                  )
                ))
)