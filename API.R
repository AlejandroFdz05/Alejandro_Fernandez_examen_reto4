library(plumber)
library(dplyr)
library(readr)
datos <- read_csv("C:/Users/kemen/Downloads/Examen/water-quality-data.csv")
str(datos)
datos$Area <- as.factor(datos$Area)

#* @apiTitle API examen Alejandro Fernandez
#* @apiDescription   API que permite a los usuarios buscar áreas que cumplan cierto criterio de calidad del agua
#* @param  calidad
#* @get /Water_q

function(calidad){
  calidad <- as.numeric(calidad)
  resultado <- datos %>% 
    filter(calidad <= Value) %>% 
    select(Value ,Area ,Site )
  
  return(resultado)
}



