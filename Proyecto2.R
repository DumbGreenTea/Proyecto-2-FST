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
