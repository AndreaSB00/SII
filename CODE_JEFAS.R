#Librerías a utilizar 
library(tidyverse)
library(dplyr)

#Fijar el directorio de trabajo
setwd("/Users/andreasb/Desktop/SII/JEFAS/CODE_Poblacion")

#Cargar la base de datos 
#Fuente: Censo de población y vivienda 2020 INEGI 
base_datos<-read.csv("Personas19.CSV")

#Total de mujeres reportadas como jefas de hogar con una edad de 17 a 64 años.
filtro_no_edocivil<-base_datos%>%filter(SEXO==3)%>%
  filter(EDAD>=17&EDAD<=64)%>%
  filter(PARENTESCO==101)%>%filter(ENT==19)

TOTAL_NO_EDOCIVIL<- colSums (select(filtro_no_edocivil, contains ("FACTOR")))
TOTAL_NO_EDOCIVIL

##Total de mujeres reportadas como jefas de hogar con una edad de 17 a 64 años, 
#y situación conyugal diferente a casada. o unión libre
filtro_edocivil<-base_datos%>%filter(SEXO==3)%>%
  filter(EDAD>=17&EDAD<=64)%>%
  filter(PARENTESCO==101)%>%
  filter(SITUA_CONYUGAL==2|
           SITUA_CONYUGAL==3|
           SITUA_CONYUGAL==4|
           SITUA_CONYUGAL==8)%>%
  filter(ENT==19)

TOTAL_EDO_CIVIL <- colSums (select(filtro_edocivil, contains ("FACTOR")))
TOTAL_EDO_CIVIL

#Total de mujeres reportadas como jefas de hogar con una edad de 17 a 64 años y que viven con personas que tienen menos o 15 años.
#incluyendo todas las situaciones conyugales
ID_Hogares_NO_EDOCIVIL<-c(filtro_no_edocivil$ID_VIV)

filtro_HIJOS<-base_datos%>%
  filter(base_datos$ID_VIV%in%ID_Hogares_NO_EDOCIVIL)%>%
  filter(EDAD<=14)

#Obtener de la base las JEFAS que cumplen los requisitos y que también tienen en la vivienda
#una persona menor o igual a 15 años
HIJOS_HOAGRES<-c(filtro_HIJOS$ID_VIV)
JEFAS_NO_EDOCIVIL<-filtro_no_edocivil%>%
  filter(filtro_no_edocivil$ID_VIV%in%HIJOS_HOAGRES)

#Obtener el total de viviendas con mujeres jefas de hogar y con menores de 15 años en la vivienda
TOTAL_JEFAS_NO_EDOCIVIL<- colSums (select(JEFAS_NO_EDOCIVIL, contains ("FACTOR")))
TOTAL_JEFAS_NO_EDOCIVIL

#Filtrar por: hay integrante menor o con 15 años y  EDO CIVIL
vector_ID_EDO_CIVIL<-c(filtro_edocivil$ID_VIV)
filtro_HIJOS1<-base_datos%>%
  filter(base_datos$ID_VIV%in%vector_ID_EDO_CIVIL)%>%
  filter(EDAD<=14)

#Obtener de la base las JEFAS que cumplen los requisitos y que también tienen en la vivienda
#una persona menor o igual a 15 años
vector_HIJOS_EDOCIVIL<- c(filtro_HIJOS1$ID_VIV)
HOGARES_2<-filtro_edocivil%>%
  filter(filtro_edocivil$ID_VIV%in%vector_HIJOS_EDOCIVIL)

#Obtener el total de viviendas con mujeres jefas de hogar y con menores de 15 años en la vivienda
TOTAL_HOGARES_EDOCIVIL_2<-colSums (select(HOGARES_2, contains ("FACTOR")))
TOTAL_HOGARES_EDOCIVIL_2

#Revisar el parentesco de la persona <=14 años 
parentesco_menor<-filtro_HIJOS1%>%count(PARENTESCO)

#Desagregar por parentesco de la persona <=14 años  
TOTAL_Parentesco<-filtro_HIJOS1%>%filter(PARENTESCO==301)
TOTAL<- colSums (select(TOTAL_Parentesco, contains ("FACTOR")))
TOTAL






