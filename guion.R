library(pixmap)
library(stringr)
library(e1071)
#library(openxlsx)
setwd("~/GitHub/TAE_AnalisisDeImagen/faces")
listaArchivos<-list.files(pattern=".pgm$")
datos<-as.data.frame((listaArchivos))
names(datos)[1]<-"nombre"
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
datos$nombre<-str_extract(datos$nombre, ".+?(?=_)")
datos$V3=gsub("open","0",datos$V3)
datos$V3=gsub("sunglasses","1",datos$V3)
personCod<-unique(str_extract(listaArchivos, ".+?(?=_)"))


datos_an2i<-datos[which(datos$nombre=='an2i'),]
an2i_svm<-svm(datos_an2i$v3~datos_an2i$v2)
