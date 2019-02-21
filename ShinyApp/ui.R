library(shiny)
library(MASS)
library(dplyr)
library(Hmisc)
library(lubridate)
library(shinythemes)
shinyUI(fluidPage(
  theme = "style.css",
  absolutePanel(class = "wrapper", 
                fluidRow(column(10, align = "center", offset = 1,  
                                h2("Sunglasses Detector")
                )),
                fluidRow(column(12, align = "center", fileInput("picture", "Choose a file (PNG or JPEG)", 
                                   accept = c('image/png', 'image/jpeg'), width = '60%'))
  )
)))