###########################
library("apyramid")
library("ggplot2")
library(pyramid)
library(readxl)
# piramid <- read_excel("D:/RSTUDIO/piram22.xlsx")
piramid <- read.csv("./piram22.csv", sep=";")
head(piramid)


gedad <- piramid$GEDAD
hombres <- piramid$HOMBRES
mujeres <- piramid$MUJERES

data <- data.frame(hombres,mujeres,gedad)

pyramid(data,Llab="Hombres",Rlab="Mujeres",Clab="",
        Laxis=seq(0,25000,len=5), AxisFM="d", AxisBM=",", Csize=1.2,
        Cstep=1, main="PIRAMIDE POBLACIONAL DE LA PROVINCIA DE CAJAMARCA 2022 
        \n (Fuente: INEI, MINSA)")
class(piramid)


py.Males <- c(80,40,30,20,10)
names(py.Males) <- c('0-9','10-19','20-29','30-39','40-')
py.Females <- c(60,50,40,30,5)
names(py.Females) <- names(py.Males)
py.df <- data.frame(py.Females,py.Males)
pyramid(py.df,Llab="Females",Rlab="Males",Lcol="Cyan", Ldens=-1, Rcol="Pink", 
        Rdens=-1, GL=FALSE,main="An example of population pyramid\n with auto-axis")
########################################################################################
#POBLACION RURAL
gredad <- read_excel("D:/RSTUDIO/pobgedad.xlsx")
View(gredad)

pgedad <- gredad$GEdad
phombres <- gredad$RHombres
pmujeres <- gredad$RMujeres

datap <- data.frame(phombres,pmujeres,pgedad)

pyramid(datap,Llab="Hombres",Rlab="Mujeres",Clab="",
        Laxis=seq(0,10000,len=5), AxisFM="d", AxisBM=",", Csize=0.9,
        Cstep=1, main="PIRAMIDE POBLACIONAL RURAL DE LA PROVINCIA DE CAJAMARCA 2017 
        \n (Fuente: INEI, Censo 2017)")
############################################################################
# POBLACION URBANA
gredad <- read_excel("D:/RSTUDIO/pobgedad.xlsx")
View(gredad)

pgedad <- gredad$GEdad
phombres <- gredad$UHombres
pmujeres <- gredad$UMujeres

datap <- data.frame(phombres,pmujeres,pgedad)

pyramid(datap,Llab="Hombres",Rlab="Mujeres",Clab="",
        Laxis=seq(0,10000,len=5), AxisFM="d", AxisBM=",", Csize=0.9,
        Cstep=1, main="PIRAMIDE POBLACIONAL URBANA DE LA PROVINCIA DE CAJAMARCA 2017 
        \n (Fuente: INEI, Censo 2017)")

##############################################################################
## PIRAMIDE POR CURSO DE VIDA

gredad <- read_excel("D:/RSTUDIO/CVIDA.xlsx")
View(gredad)

cvida <- gredad$CVIDA
chombres <- gredad$PROV
cmujeres <- gredad$PROVM

datap <- data.frame(chombres,cmujeres,cvida)

pyramid(datap,Llab="Hombres",Rlab="Mujeres",Clab="",
        Laxis=seq(0,70000,len=5), AxisFM="d", AxisBM=",", Csize=0.8,Cgap=0.4,
        Cstep=1, main="PIRAMIDE POR CURSO DE VIDA DE LA PROVINCIA DE CAJAMARCA 2022 
        \n (Fuente: INEI, MINSA)")
