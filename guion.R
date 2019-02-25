library(pixmap)
library(stringr)
#library(openxlsx)
setwd("~/GitHub/TAE_AnalisisDeImagen/faces")
listaArchivos<-list.files(pattern=".pgm$")
datos<-as.data.frame((listaArchivos))

for (i in 1:length(listaArchivos)){
  a<-read.pnm(listaArchivos[i])
  datamat<-as.matrix(a@grey)
  datos[i,2]<-mean(datamat)
  if (!is.na((str_extract(listaArchivos[i],"open")=="open"))){
    datos[i,3]<-"open"
  }
  else if (!is.na((str_extract(listaArchivos[i],"sunglasses")=="sunglasses"))){
    datos[i,3]<-"sunglasses"
  }
}
datos$V3=gsub("open","0",datos$V3)
datos$V3=gsub("sunglasses","1",datos$V3)


