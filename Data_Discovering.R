library(readr)
library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)
datos <- read_csv("C:/Users/kemen/Downloads/Examen/water-quality-data.csv")
summary(datos)
sd(datos$Value, na.rm = T)
sd(datos$MDL, na.rm = T)
sd(datos$RDL, na.rm = T)

datos %>% 
  group_by(Area) %>% 
  summarise(media = mean(Value, na.rm = T))

df <- datos %>% 
  group_by(Area) %>% 
  summarise(media = mean(Value, na.rm = T))  
df$Area <- sort(df$Area, na.last = F)  #haciendo esto podemos obserbar que da la casualidad que ya estan ordenados

df[c(5,20,33),]

