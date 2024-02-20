#Instalamos la libreria
install.packages("classInt")

#Cargamos la libreria
library(classInt)

#La funcion classIntervals establece los intervalos (igual que la funcion cut), pero tiene la ventaja
#de que realiza directamente el recuento.
#Considera intervalos abiertos a la izquierda y cerrados a la derecha, excepto el primero,
#que siempre lo considera cerrado, por lo que el primer extremo puede ser el minimo.
#La opcion fixedBreaks permite establecer los extremos de los intervalos.
#Si en lugar de utilizar la opcion fixedBreaks usamos n=28, la funcion divide en 28 intervalos, todos 
#de la misma amplitud, pero determinada por la propia funcion.
#Mas informacion acerca de la funcion en: https://cran.r-project.org/web/packages/classInt/classInt.pdf

classIntervals(DatosAndalucia$TASA.DE.LINEAS.ADSL,style="fixed",fixedBreaks=c(-0.5,1,2.5,4,5.5,7,8.5,10,11.5,13,14.5,16,17.5,19,20.5,22,23.5,25,26.5,28,29.5,31,32.5,34,35.5,37,38.5,40,41.5),intervalClosure=c("right"))

