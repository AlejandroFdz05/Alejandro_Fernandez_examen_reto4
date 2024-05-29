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
miss_case_summary(datos)
miss_var_summary(datos)

sample_size <- nrow(datos)*0.01
sample_datos <- datos[sample(nrow(datos),size = sample_size),]
vis_miss(sample_datos, cluster = T)

miss_var_summary(sample_datos)
sample_datos <- kNN(sample_datos, variable = c("RDL","MDL","Value"),k = 3,dist_var = c("Area","Site.Type"))
miss_var_summary(sample_datos)

write.csv(sample_datos,file = "C:/Users/kemen/Downloads/Examen/DF_DC_na.csv" )
