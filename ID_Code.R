#Código para crear ID

#Fijar el directorio de trabajo
setwd("/Users/andreasb/Desktop/SII/PP_Impulso a cuidadoras/enut_2019_bd_csv/enut_2019")

#Librerias 
library(tidyverse)
library(dplyr)

#Cargamos la base de datos de interes
TMODULO0 <- read.csv("/Users/andreasb/Desktop/SII/PP_Impulso a cuidadoras/enut_2019_bd_csv/enut_2019/TMODULO.csv")
TSDMEM0 <- read.csv("/Users/andreasb/Desktop/SII/PP_Impulso a cuidadoras/enut_2019_bd_csv/enut_2019/TSDEM.csv")

#Crear código para base TMODULO0 
###################################
#Crear la columna donde irá el ID para base T_Modulo 
ID_list <- data.frame(matrix(ncol = 1, nrow = 71404))
nombres_columnas <- c("ID")
colnames(ID_list) <- nombres_columnas
colnames(TMODULO0)
TMODULO<-cbind(TMODULO0,ID_list)

i=0
while (i <= 71404){
  TMODULO$ID=paste(TMODULO$UPM,
                   TMODULO$VIV_SEL,
                   TMODULO$HOGAR,
                   TMODULO$N_REN,
                   sep = "_")
  i<-i+1
}                 

View(TMODULO)
write.csv(TMODULO,"MODULO_ID.csv")

###################################

#Crear la columna donde irá el ID para base T_SDMEM0
ID_list <- data.frame(matrix(ncol = 1, nrow = 93485))
nombres_columnas <- c("ID")
colnames(ID_list) <- nombres_columnas
TSDMEM<-cbind(TSDMEM0,ID_list)

i=0
while (i <= 93485){
  TSDMEM$ID=paste(TSDMEM$UPM,
                  TSDMEM$VIV_SEL,
                  TSDMEM$HOGAR,
                  TSDMEM$N_REN,
                   sep = "_")
  i<-i+1
}                 

write.csv(TSDMEM,"TSDMEM_ID.csv")





