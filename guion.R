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
datos_an2i$V3<-as.numeric(datos_an2i$V3)
an2i_svm<-svm(datos_an2i$V3~datos_an2i$V2)
an2iPredict<-predict(an2i_svm,datos_an2i)
an2iro<-round(an2iPredict)
vecfallos<-c(length(which(datos_an2i$V3!=an2iro)))
vecEx<-c(1-length(which(datos_an2i$V3!=an2iro))/nrow(datos_an2i))

datos_at33<-datos[which(datos$nombre=='at33'),]
datos_at33$V3<-as.numeric(datos_at33$V3)
at33_svm<-svm(datos_at33$V3~datos_at33$V2)
at33Predict<-predict(at33_svm,datos_at33)
at33ro<-round(at33Predict)
vecfallos<-append(vecfallos,length(which(datos_at33$V3!=at33ro)))
vecEx<-append(vecEx,1-(length(which(datos_at33$V3!=at33ro))/nrow(datos_at33)))

datos_boland<-datos[which(datos$nombre=='boland'),]
datos_boland$V3<-as.numeric(datos_boland$V3)
boland_svm<-svm(datos_boland$V3~datos_boland$V2)
bolandPredict<-predict(boland_svm,datos_boland)
bolandro<-round(bolandPredict)
vecfallos<-append(vecfallos,length(which(datos_boland$V3!=bolandro)))
vecEx<-append(vecEx,1-(length(which(datos_boland$V3!=bolandro))/nrow(datos_boland)))

datos_bpm<-datos[which(datos$nombre=='bpm'),]
datos_bpm$V3<-as.numeric(datos_bpm$V3)
bpm_svm<-svm(datos_bpm$V3~datos_bpm$V2)
bpmPredict<-predict(bpm_svm,datos_bpm)
bpmro<-round(bpmPredict)
vecfallos<-append(vecfallos,length(which(datos_bpm$V3!=bpmro)))
vecEx<-append(vecEx,1-(length(which(datos_bpm$V3!=bpmro))/nrow(datos_bpm)))

datos_ch4f<-datos[which(datos$nombre=='ch4f'),]
datos_ch4f$V3<-as.numeric(datos_ch4f$V3)
ch4f_svm<-svm(datos_ch4f$V3~datos_ch4f$V2)
ch4fPredict<-predict(ch4f_svm,datos_ch4f)
ch4fro<-round(ch4fPredict)
vecfallos<-append(vecfallos,length(which(datos_ch4f$V3!=ch4fro)))
vecEx<-append(vecEx,1-(length(which(datos_ch4f$V3!=ch4fro))/nrow(datos_ch4f)))

datos_cheyer<-datos[which(datos$nombre=='cheyer'),]
datos_cheyer$V3<-as.numeric(datos_cheyer$V3)
cheyer_svm<-svm(datos_cheyer$V3~datos_cheyer$V2)
cheyerPredict<-predict(cheyer_svm,datos_cheyer)
cheyerro<-round(cheyerPredict)
vecfallos<-append(vecfallos,length(which(datos_cheyer$V3!=cheyerro)))
vecEx<-append(vecEx,1-(length(which(datos_cheyer$V3!=cheyerro))/nrow(datos_cheyer)))

datos_choon<-datos[which(datos$nombre=='choon'),]
datos_choon$V3<-as.numeric(datos_choon$V3)
choon_svm<-svm(datos_choon$V3~datos_choon$V2)
choonPredict<-predict(choon_svm,datos_choon)
choonro<-round(choonPredict)
vecfallos<-append(vecfallos,length(which(datos_at33$V3!=at33ro)))
vecEx<-append(vecEx,1-(length(which(datos_choon$V3!=choonro))/nrow(datos_choon)))

datos_danieln<-datos[which(datos$nombre=='danieln'),]
datos_danieln$V3<-as.numeric(datos_danieln$V3)
danieln_svm<-svm(datos_danieln$V3~datos_danieln$V2)
danielnPredict<-predict(danieln_svm,datos_danieln)
danielnro<-round(danielnPredict)
vecfallos<-append(vecfallos,length(which(datos_danieln$V3!=danielnro)))
vecEx<-append(vecEx,1-(length(which(datos_danieln$V3!=danielnro))/nrow(datos_danieln)))

datos_glickman<-datos[which(datos$nombre=='glickman'),]
datos_glickman$V3<-as.numeric(datos_glickman$V3)
glickman_svm<-svm(datos_glickman$V3~datos_glickman$V2)
glickmanPredict<-predict(glickman_svm,datos_glickman)
glickmanro<-round(glickmanPredict)
vecfallos<-append(vecfallos,length(which(datos_glickman$V3!=glickmanro)))
vecEx<-append(vecEx,1-(length(which(datos_glickman$V3!=glickmanro))/nrow(datos_glickman)))

datos_karyadi<-datos[which(datos$nombre=='karyadi'),]
datos_karyadi$V3<-as.numeric(datos_karyadi$V3)
karyadi_svm<-svm(datos_karyadi$V3~datos_karyadi$V2)
karyadiPredict<-predict(karyadi_svm,datos_karyadi)
karyadiro<-round(karyadiPredict)
vecfallos<-append(vecfallos,length(which(datos_karyadi$V3!=karyadiro)))
vecEx<-append(vecEx,1-(length(which(datos_karyadi$V3!=karyadiro))/nrow(datos_karyadi)))

datos_kawamura<-datos[which(datos$nombre=='kawamura'),]
datos_kawamura$V3<-as.numeric(datos_kawamura$V3)
kawamura_svm<-svm(datos_kawamura$V3~datos_kawamura$V2)
kawamuraPredict<-predict(kawamura_svm,datos_kawamura)
kawamuraro<-round(kawamuraPredict)
vecfallos<-append(vecfallos,length(which(datos_kawamura$V3!=kawamuraro)))
vecEx<-append(vecEx,1-(length(which(datos_kawamura$V3!=kawamuraro))/nrow(datos_kawamura)))

datos_kk49<-datos[which(datos$nombre=='kk49'),]
datos_kk49$V3<-as.numeric(datos_kk49$V3)
kk49_svm<-svm(datos_kk49$V3~datos_kk49$V2)
kk49Predict<-predict(kk49_svm,datos_kk49)
kk49ro<-round(kk49Predict)
vecfallos<-append(vecfallos,length(which(datos_kk49$V3!=kk49ro)))
vecEx<-append(vecEx,1-(length(which(datos_kk49$V3!=kk49ro))/nrow(datos_kk49)))

datos_megak<-datos[which(datos$nombre=='megak'),]
datos_megak$V3<-as.numeric(datos_megak$V3)
megak_svm<-svm(datos_megak$V3~datos_megak$V2)
megakPredict<-predict(megak_svm,datos_megak)
megakro<-round(megakPredict)
vecfallos<-append(vecfallos,length(which(datos_megak$V3!=megakro)))
vecEx<-append(vecEx,1-(length(which(datos_megak$V3!=megakro))/nrow(datos_megak)))

datos_mitchell<-datos[which(datos$nombre=='mitchell'),]
datos_mitchell$V3<-as.numeric(datos_mitchell$V3)
mitchell_svm<-svm(datos_mitchell$V3~datos_mitchell$V2)
mitchellPredict<-predict(mitchell_svm,datos_mitchell)
mitchellro<-round(mitchellPredict)
vecfallos<-append(vecfallos,length(which(datos_mitchell$V3!=mitchellro)))
vecEx<-append(vecEx,1-(length(which(datos_mitchell$V3!=mitchellro))/nrow(datos_mitchell)))

datos_night<-datos[which(datos$nombre=='night'),]
datos_night$V3<-as.numeric(datos_night$V3)
night_svm<-svm(datos_night$V3~datos_night$V2)
nightPredict<-predict(night_svm,datos_night)
nightro<-round(nightPredict)
vecfallos<-append(vecfallos,length(which(datos_night$V3!=nightro)))
vecEx<-append(vecEx,1-(length(which(datos_night$V3!=nightro))/nrow(datos_night)))

datos_phoebe<-datos[which(datos$nombre=='phoebe'),]
datos_phoebe$V3<-as.numeric(datos_phoebe$V3)
phoebe_svm<-svm(datos_phoebe$V3~datos_phoebe$V2)
phoebePredict<-predict(phoebe_svm,datos_phoebe)
phoebero<-round(phoebePredict)
vecfallos<-append(vecfallos,length(which(datos_phoebe$V3!=phoebero)))
vecEx<-append(vecEx,1-(length(which(datos_phoebe$V3!=phoebero))/nrow(datos_phoebe)))

datos_saavik<-datos[which(datos$nombre=='saavik'),]
datos_saavik$V3<-as.numeric(datos_saavik$V3)
saavik_svm<-svm(datos_saavik$V3~datos_saavik$V2)
saavikPredict<-predict(saavik_svm,datos_saavik)
saavikro<-round(saavikPredict)
vecfallos<-append(vecfallos,length(which(datos_saavik$V3!=saavikro)))
vecEx<-append(vecEx,1-(length(which(datos_saavik$V3!=saavikro))/nrow(datos_saavik)))

datos_steffi<-datos[which(datos$nombre=='steffi'),]
datos_steffi$V3<-as.numeric(datos_steffi$V3)
steffi_svm<-svm(datos_steffi$V3~datos_steffi$V2)
steffiPredict<-predict(steffi_svm,datos_steffi)
steffiro<-round(steffiPredict)
vecfallos<-append(vecfallos,length(which(datos_steffi$V3!=steffiro)))
vecEx<-append(vecEx,1-(length(which(datos_steffi$V3!=steffiro))/nrow(datos_steffi)))

datos_sz24<-datos[which(datos$nombre=='sz24'),]
datos_sz24$V3<-as.numeric(datos_sz24$V3)
sz24_svm<-svm(datos_sz24$V3~datos_sz24$V2)
sz24Predict<-predict(sz24_svm,datos_sz24)
sz24ro<-round(sz24Predict)
vecfallos<-append(vecfallos,length(which(datos_sz24$V3!=sz24ro)))
vecEx<-append(vecEx,1-(length(which(datos_sz24$V3!=sz24ro))/nrow(datos_sz24)))

datos_tammo<-datos[which(datos$nombre=='tammo'),]
datos_tammo$V3<-as.numeric(datos_tammo$V3)
tammo_svm<-svm(datos_tammo$V3~datos_tammo$V2)
tammoPredict<-predict(tammo_svm,datos_tammo)
tammoro<-round(tammoPredict)
vecfallos<-append(vecfallos,length(which(datos_tammo$V3!=tammoro)))
vecEx<-append(vecEx,1-(length(which(datos_tammo$V3!=tammoro))/nrow(datos_tammo)))

DetectorGafas<-function(x){
  aux<-str_extract(x, ".+?(?=_)")
  if (aux=="an2i"){
    ind<-which(datos_an2i==x)
    res<-as.numeric(an2iro[ind])
  }
}