#===============================================#
#           Importación de librerías 
#===============================================#
# Instalación y carga de paquetes necesarios
install.packages("forecast")
install.packages("TTR")
install.packages("tseries")
install.packages("mFilter")
library(forecast)
library(TTR)
library(tseries)
library(mFilter)


#===============================================#
#             Carga de dataset
#===============================================# 
#Serie Temporal
Souvenir <- read.csv("https://raw.githubusercontent.com/mandyhpnguyen/MS-Data-Analytics-Datasets/main/Time%20Series/SouvenirSales.csv")
Souvenir <- Souvenir[, -c(3, 4)]
colnames(Souvenir)[1]<- "Month"
Souvenir.ts <- ts(Souvenir[, 2], start = c(1995, 1), end = c(2001, 12), freq = 12)
str(Souvenir)

#Figura 1
plot(Souvenir.ts / 1000, ylim = c(0, 120),
     ylab = "Ventas (en miles)",
     xlab = "Tiempo",
     main = "Serie de tiempo Souvenir",
     bty = "l",
     col = "#1f77b4",   # Azul 
     lwd = 2)           # Línea un poco más gruesa para mejor visibilidad
     abline(h = seq(0, 120, 20), col = "gray90", lty = "dotted")


#===============================================#
#             Análisis de la serie
#===============================================#

#======= 1. Análisis de tendencia y periodicidad ========#
     
plot(aggregate(Souvenir.ts),
     main = "Tendencia agregada de ventas de souvenirs",
     xlab = "Año",
     ylab = "Suma de ventas totales",
     col = "#1f77b4",     # color
     lwd = 2,             # grosor de la linea
     type = "l",          # tipo de linea (normal)
     bty = "o")           # caja de gráfico (recuadro)

#lo siguiente que buscamos es ver cómo es la periodicidad,
#miramos cada año, para ésto revisamos el boxplot por año

#Figura 3
boxplot(Souvenir.ts ~ cycle(Souvenir.ts),
        main = "Estacionalidad mensual en ventas de souvenirs",
        xlab = "Mes",
        ylab = "Ventas",
        col = "#ffb347",           # color naranjo suave
        border = "gray40",         # Bordes del boxplot
        names = month.abb)         # Etiquetas mensuales "Ene", "Feb", etc.

