#Cambiar directorio
setwd("Downloads")
#Guardar Conjunto de Datos
save("Placas", file="/P1.Introduccion a RCommander/Placas.RData")
#Importar Conjunto de datos desde .txt
DatosAndalucia <- 
  read.table("/P1.Introduccion a RCommander/DatosAndalucia2013.txt", 
  header=TRUE, stringsAsFactors=TRUE, sep="\t", na.strings="..", dec=",", strip.white=TRUE)
#Refactorizar Codigo INE en Provincias
DatosAndalucia <- within(DatosAndalucia, {
  PROVINCIA <- Recode(CODIGO.INE, 
  '4000:4999="ALMERÍA"; 11000:11999="CÁDIZ"; 14000:14999="CÓRDOBA"; 18000:18999="GRANADA"; 21000:21999="HUELVA"; 23000:23999="JÁEN"; 29000:29999="MÁLAGA"; 41000:41999="SEVILLA"',
   as.factor=TRUE, to.value="=", interval=":", separator=";")
})
#Crear variable Tasa de Lineas ADSL
DatosAndalucia$TASA.LINEAS.ADSL <- with(DatosAndalucia, ADSL/POBLACION*100)
#Crear variable Renta Neta por Habitante
DatosAndalucia$RENTA.NETA.HABITANTE <- with(DatosAndalucia, RENTAS.NETAS.DECLARADAS/POBLACION)
#Refactorizar Renta por Habitante en Renta
DatosAndalucia <- within(DatosAndalucia, {
  RENTA <- Recode(RENTA.NETA.HABITANTE, 
  '0:1199.99="HASTA 1.200"; 1200:3299.99="ENTRE 1.200 Y 3.300"; 3300:5299.99="ENTRE 3.300 Y 5.300"; 5300:7199.99="ENTRE 5.300 Y 7.200"; 7200:9299.99="ENTRE 7.200 Y 9.300"; 9300:11099.99="ENTRE 9.300 Y 11.100"; 11100:13699.99="ENTRE 11.100 Y 13.700"; 13700:9999999999="MÁS DE 13700"',
   as.factor=TRUE, to.value="=", interval=":", separator=";")
})

