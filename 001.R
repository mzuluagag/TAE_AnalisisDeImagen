library(pixmap)
library(stringr)
library(keras)
setwd("~/GitHub/TAE_AnalisisDeImagen/faces")
listaArchivos<-list.files(pattern=".pgm$")


data<-NULL
images <- list()
for (i in 1:length(listaArchivos)){
  images[[i]] <- read.pnm(listaArchivos[i],cellres=1)
  data<-rbind(data,as.vector(images[[i]]@grey))
}
resp<-c()
for (i in 1:length(listaArchivos)){
  if (!is.na((str_extract(listaArchivos[i],"open")=="open"))){
    resp[i]<-"open"
  }
  else if (!is.na((str_extract(listaArchivos[i],"sunglasses")=="sunglasses"))){
    resp[i]<-"sunglasses"
  }
}


resp=gsub("open",0,resp)
resp=gsub("sunglasses",1,resp)


train <-to_categorical(resp)
model <- keras_model_sequential()
model %>%
  layer_dense(units = 256, activation = 'relu', input_shape = c(960)) %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dense(units = 2, activation = 'softmax')

#compile
model %>%
  compile(loss = 'binary_crossentropy',
          optimizer = optimizer_rmsprop(),
          metrics = c('accuracy'))

# Fit Model
history <- model %>%
  fit(data,
      train,
      epochs = 30,
      batch_size = 32)

model %>% evaluate(data, train)
pred<-model%>%predict_classes(data)
z<-table(Predicted = pred, Actual = train[,2])
tablaRes<-as.data.frame(z)
# a<-array_reshape(data[2,],c(1,960))
# predict_classes(model,a)
# 
# model %>% save_model_hdf5("my_model.h5")
# model<-load_model_hdf5("red")

DetectorGafas<-function(x){
  img<-read.pnm(x,cellres=1)
  calc<-array_reshape(as.vector(img@grey),c(1,960))
  total<-predict_classes(modelof,calc)
  return(total)
}
