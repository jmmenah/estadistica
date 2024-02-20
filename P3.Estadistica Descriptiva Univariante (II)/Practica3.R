#Cambiar directorio
setwd("Downloads")
#Cargar datos
load("/Downloads/P3.Estadistica Descriptiva Univariante (II)/DatosAndalucia2013.RData")
#Crear subcojunto de datos
DatosJaen <- subset(DatosAndalucia, subset=PROVINCIA=="JAEN")
#Crear tabla de frecuencias por Renta
local({
  .Table <- with(DatosJaen, table(RENTA))
  cat("\ncounts:\n")
  print(.Table)
  cat("\npercentages:\n")
  print(round(100*.Table/sum(.Table), 2))
})
#Crear grafica de barras
with(DatosJaen, Barplot(RENTA, xlab="RENTA", ylab="Frequency", label.bars=TRUE))
library(colorspace, pos=16)
#Crear grafica de barras agrupada por Provincia
with(DatosAndalucia, Barplot(RENTA, by=PROVINCIA, style="divided", legend.pos="above", xlab="RENTA", 
  ylab="Frequency", label.bars=TRUE))
library(abind, pos=17)
library(e1071, pos=18)
#Calcular datos sobre Tasa de lineas ADSL
numSummary(DatosAndalucia[,"TASA.DE.LINEAS.ADSL", drop=FALSE], groups=DatosAndalucia$PROVINCIA, 
  statistics=c("mean", "quantiles", "CV", "skewness", "kurtosis"), quantiles=c(0,.25,.5,.75,1), type="3")
#Crear grafica de cajas y bigotes agrupada por Provincia
Boxplot(TASA.DE.LINEAS.ADSL ~ PROVINCIA, data=DatosAndalucia, id=list(method="y"))
#Calcular minimo y maximo de un dato
min(DatosJaen$TASA.DE.LINEAS.ADSL)
max(DatosJaen$TASA.DE.LINEAS.ADSL)
#Crear tabla de intervalos de un dato con la libreria class intervals
classIntervals(DatosJaen$TASA.DE.LINEAS.ADSL,style="fixed",fixedBreaks=seq(0,20,2),intervalClosure=c("right"))
#Crear histogramas
with(DatosJaen, Hist(TASA.DE.LINEAS.ADSL, scale="frequency", breaks="Sturges", col="darkgray"))
with(DatosJaen, Hist(TASA.DE.LINEAS.ADSL, scale="frequency", breaks=seq(0,20,2), col="darkgray"))

