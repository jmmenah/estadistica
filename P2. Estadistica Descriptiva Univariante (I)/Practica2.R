#Cambiar directorio
setwd("Downloads")
#Cargar datos
load("Downloads/P2.Estadistica Descriptiva Univariante (I)/DatosAndalucia2013.RData")
#Crear subconjunto de datos
DatosJaen2013 <- subset(DatosAndalucia, subset=PROVINCIA=="JAEN")
DatosGranada2013 <- subset(DatosAndalucia, subset=PROVINCIA=="GRANADA")
#Crear tabla de frecuencias por Provincia
local({
  .Table <- with(DatosAndalucia, table(PROVINCIA))
  cat("\ncounts:\n")
  print(.Table)
  cat("\npercentages:\n")
  print(round(100*.Table/sum(.Table), 2))
})
#Crear tabla de frecuencias por Renta
local({
  .Table <- with(DatosAndalucia, table(RENTA))
  cat("\ncounts:\n")
  print(.Table)
  cat("\npercentages:\n")
  print(round(100*.Table/sum(.Table), 2))
})
#Crear graficas de barras
with(DatosAndalucia, Barplot(PROVINCIA, xlab="PROVINCIA", ylab="Frequency", label.bars=TRUE))
with(DatosAndalucia, Barplot(RENTA, xlab="RENTA", ylab="Frequency", label.bars=TRUE))
library(colorspace, pos=16)
#Crear grafica de sectores
with(DatosAndalucia, piechart(PROVINCIA, xlab="", ylab="", main="PROVINCIA", col=rainbow_hcl(8), scale="percent"))
with(DatosAndalucia, piechart(RENTA, xlab="", ylab="", main="RENTA", col=rainbow_hcl(7), scale="percent"))
with(DatosAndalucia, piechart(PROVINCIA, xlab="", ylab="", main="PROVINCIA", col=rainbow_hcl(8), 
  scale="frequency"))
library(abind, pos=17)
library(e1071, pos=18)
#Calcular informacion de Tasa de lineas de ADSL
numSummary(DatosAndalucia[,"TASA.DE.LINEAS.ADSL", drop=FALSE], statistics=c("mean", "sd", "IQR", "quantiles"), 
  quantiles=c(0,.25,.5,.75,1))
#Crear subconjuto de datos
MunicipiosEstudio <- subset(DatosAndalucia, subset=TASA.DE.LINEAS.ADSL>8.715819)
#Crear histograma
with(MunicipiosEstudio, Hist(TASA.DE.LINEAS.ADSL, scale="frequency", breaks="Sturges", col="darkgray"))
#Calcular informacion de Tasa de lineas de ADSL
numSummary(MunicipiosEstudio[,"TASA.DE.LINEAS.ADSL", drop=FALSE], statistics=c("mean", "sd", "IQR", "quantiles", 
  "skewness", "kurtosis"), quantiles=c(0,.25,.5,.75,1), type="3")
#Crear grafica de cajas y bigotes
Boxplot( ~ TASA.DE.LINEAS.ADSL, data=DatosAndalucia, id=list(method="identify"))
with(DatosAndalucia, Hist(TASA.DE.LINEAS.ADSL, scale="frequency", breaks=seq(-0.5,41.5,by=1.5), col="darkgray"))

