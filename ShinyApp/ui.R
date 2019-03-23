library(shiny)
library(pixmap)
library(stringr)
library(keras)
library(shinythemes)


load(file= "www/funcion",envir = .GlobalEnv,verbose = FALSE)
modelof<-load_model_hdf5("www/red")
texto<-"La aplicación en cuestión busca identificar a las personas con gafas de sol
a partir de técnicas de aprendizaje estadístico. Para el funcionamiento de la aplicación,
            se optó por hacer uso de redes neuronales a partir del paquete 'keras' de R.<br><br>
            Inicialmente se procedió a solo usar las imágenes de menor resolución porque son las que menos carga representan para la máquina, 
            se intentó con las de mayor resolución pero fue imposible(para el filtrado se utilizó un algoritmo en Python).
            Para obtener el modelo, se hizo lo siguiente: 
            Se usó la librería pixmap para cargar las imágenes en formato .pgm con la función read.pnm,
            luego de esto, se le extrajo a cada imagen una matriz de 30x32 dónde cada entrada de esta era 
            el color de cada pixel en donde cada entrada era entre 0 y 1(0 era negro y 1 era blanco(escala de grises)),
            luego se volvió un vector fila y se agregó a un dataframe para entrenar el modelo.
            <br><br>

            Cómo se mencionó anteriormente, se calculó un modelo secuencial de redes neuronales a partir de Keras para
            datos categóricos con 2 posibles valores(0 o 1, el tener gafas o no). La aplicación funciona de la siguiente manera: La persona escoge una imagen del menú desplegable(se excluyeron las imágenes corruptas(.bad)).
            Luego de esto, se le ingresa el nombre de la imagen cómo una cadena de texto, se convierte la cadena en una ruta y esta se ingresa a una función, la cuál
            busca el archivo, redimensiona la imagen en las dimensiones(shape) del modelo, lo ingresa y hace la predicción.
<br>
            La función retorna un 1 o un 0, pero en la aplicación se le transformó a un texto más amigable al usuario final.<br><br>
            Al calcular todas las predicciones, en resumen se obtuvo:<br><br>
            <hb>
            <table>"
              
            texto2<-"Del total de predicciones se obtuvieron 3 fallos de un total de 624 imágenes, en otras palabras: Se obtuvo un 99.519% de éxito en las predicciones
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