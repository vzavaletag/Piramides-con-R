---
title: "Piramides"
author: "Victor Zavaleta"
date: "2022-08-18"
output:
    html_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

### Para hacer diferentes tipos de piramides, se activaran las diferentes librerias que se necesitaran.

```{r}
library(tidyverse)
library(apyramid)
library(ggplot2)
library(gganimate)
library(scales)
library(ggrepel)
library(lemon)
library(pyramid)
library(readxl)
```

### Se cargara la primera base de datos
```{r}
piramid <- read.csv("./piram22.csv", sep=";")
head(piramid)
```

```{r}
gedad <- piramid$GEDAD
hombres <- piramid$HOMBRES
mujeres <- piramid$MUJERES

data <- data.frame(hombres,mujeres,gedad)

pyramid(data,Llab="Hombres",Rlab="Mujeres",Clab="",
        Laxis=seq(0,25000,len=5), AxisFM="d", AxisBM=",", Csize=0.8,
        Cstep=1, main="PIRAMIDE POBLACIONAL DE LA PROVINCIA DE CAJAMARCA 2022 
        \n (Fuente: INEI, MINSA)")
class(piramid)
```


```{r}
py.Hombres <- c(80,40,30,20,10)
names(py.Hombres) <- c('0-9','10-19','20-29','30-39','40-')
py.Mujeres <- c(60,50,40,30,5)
names(py.Mujeres) <- names(py.Hombres)
py.df <- data.frame(py.Mujeres,py.Hombres)
pyramid(py.df,Llab="Mujeres",Rlab="Hombres",Lcol="Cyan", Ldens=-1, Rcol="Pink", 
        Rdens=-1, GL=FALSE,main="Un ejemplo de piramide de población con auto-ejes")
```

```{r}
gredad <- read_excel("D:/RSTUDIO/pobgedad.xlsx")
head(gredad)

pgedad <- gredad$GEdad
phombres <- gredad$RHombres
pmujeres <- gredad$RMujeres

datap <- data.frame(phombres,pmujeres,pgedad)

pyramid(datap,Llab="Hombres",Rlab="Mujeres",Clab="",
        Laxis=seq(0,10000,len=5), AxisFM="d", AxisBM=",", Csize=0.9,
        Cstep=1, main="PIRAMIDE POBLACIONAL RURAL DE LA PROVINCIA DE CAJAMARCA 
        \n (Fuente: INEI, Censo 2017)")
```

```{r}
gredad <- read_excel("D:/RSTUDIO/CVIDA.xlsx")
head(gredad)

cvida <- gredad$CVIDA
chombres <- gredad$PROV
cmujeres <- gredad$PROVM

datap <- data.frame(chombres,cmujeres,cvida)

pyramid(datap,Llab="Hombres",Rlab="Mujeres",Clab="",
        Laxis=seq(0,70000,len=5), AxisFM="d", AxisBM=",", Csize=0.8,Cgap=0.5,
        Cstep=1, main="PIRAMIDE POR CURSO DE VIDA DE LA PROVINCIA DE CAJAMARCA 2022 
        \n (Fuente: INEI, MINSA)")
```


```{r}
pp2007 <- read_excel("D:/RSTUDIO/PIRAMIDES0717.xlsx")
View(pp2007)

pp<-ggplot(data=pp2007,
             mapping = aes(
               x=ifelse(test = SEXO == "HOMBRE", yes = -POBLACION, no =POBLACION),
               y=GEDAD, fill = SEXO)) +
  geom_col()+
  theme(plot.caption=element_text(vjust = 1,hjust=0,size=8),
        plot.title=element_text(hjust=0.5, size=14,face="bold"),
        plot.subtitle =element_text(hjust=0.5, size=12,face="bold"))+
  scale_fill_manual(values = c("#00AFBB","#FC4E07"))+
  scale_x_symmetric(labels = abs) +
  facet_wrap (~ AÑO)+
  ylab("Edades")+
  xlab("Miles de personas")+
  labs(title="Pirámide poblacional 2007 y 2017",
      # subtitle = "Año 2007",
       caption="Fuente: ORE-DIRESA: Censo de Población y Vivienda 2007, 2017, INEI.")

pp

```

```{r}
ur <- read_excel("D:/RSTUDIO/urban_rural.xlsx")
head(ur)

provincia <- ur$Provincia
urbana <- ur$Urbana
rural <- ur$Rural

ppur <- data.frame(urbana,rural,provincia)

pyramid(ppur,Llab="URBANA",Rlab="RURAL",Clab="",
        Laxis=seq(0,220000,len=5), AxisFM="d", AxisBM=",", Csize=0.7,
        Cstep=1, Cadj=-0.01,
        main="PIRAMIDE POBLACIONAL URBANA Y RURAL DE LA REGION CAJAMARCA 2017 
        \n (Fuente: INEI, Censo 2017)")

```

```{r}
pp1921 <- read_excel("D:/RSTUDIO/pir1921.xlsx")
View(pp1921)

ppp<-ggplot(data=pp1921,
           mapping = aes(
             x=ifelse(test = SEXO == "HOMBRES", yes = -POBLACION, no =POBLACION),
             y=GEDAD, fill = SEXO)) +
  geom_col()+
  theme(plot.caption=element_text(vjust = 1,hjust=0,size=8),
        plot.title=element_text(hjust=0.5, size=14,face="bold"),
        plot.subtitle =element_text(hjust=0.5, size=12,face="bold"))+
  scale_fill_manual(values = c("#00AFBB","#FC4E07"))+
  scale_x_symmetric(labels = abs) +
  facet_wrap (~ AÑO)+
  ylab("Edades")+
  xlab("Miles de personas")+
  labs(title="Pirámide poblacional 2019, 2020 y 2021",
       # subtitle = "Año 2007",
       caption="Fuente: ORE-DIRESA: Censo de Población y Vivienda 2019,2020, 2021, INEI.")

ppp
```


Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
