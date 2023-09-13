library("tidyverse")
### https://es.r4ds.hadley.nz/15-factors.html
#Los factores son una calse de R que nos permite manejar variables categóricas, es decir, variables que tienen un conjunto fijo y conocido de valores posibles.
#Veamos un ejemplo sencillo del manejo de factores

#Armo una variable que registra meses

x1 <- c("Dic", "Abr", "Ene", "Mar")

#Puedo intentar ordenar esta variable con la funcion sort()
sort(x1)

#No ordena los meses como nos gustaria... 

#Defino un vector que contenga los niveles de los factores 

niveles_meses <- c(
  "Ene", "Feb", "Mar", "Abr", "May", "Jun",
  "Jul", "Ago", "Sep", "Oct", "Nov", "Dic")

#Armo el factor
y1<-factor(x1, levels=niveles_meses)

sort(y1)

#· otra ventaja: incluso si hay un error de tipeo te avisa
x2 <- c("Dic", "Abr", "Eme", "Mar")
y2 <- parse_factor(x2, levels = niveles_meses)
sort(y2)


# Otra aplicación útil

# Crear un vector de colores como factor
meses <- factor(c("Dic", "Abr", "Ene", "Mar"))

# Recodificar los niveles del factor usando fct_recode()
meses_estaciones <- fct_recode(meses,"verano"="Ene","verano"="Mar","verano"="Feb",
                                    "otoño"="May","otoño"="Abr","otoño"="Jun",
                                    "primavera"="Oct","primavera"="Nov","primavera"="Dic",
                                    "invierno"="Jul","invierno"="Ago","invierno"="Sep")

frecuencias <- data.frame(estaciones=meses_estaciones) %>%
  count(estaciones)
frecuencias


#Otra forma

Data_meses<- data.frame(meses=c("Dic", "Abr", "Ene", "Mar"))

Data_meses %>%
  mutate(meses = fct_recode(meses,"verano"="Ene","verano"="Mar","verano"="Feb",
                                  "otoño"="May","otoño"="Abr","otoño"="Jun",
                                  "primavera"="Oct","primavera"="Nov","primavera"="Dic",
                                  "invierno"="Jul","invierno"="Ago","invierno"="Sep")) %>%
  count(meses)

#Otra forma

Data_meses %>%
  mutate(meses = fct_collapse(meses,verano= c("Ene", "Feb","Mar")
                                   ,otoño= c("May", "Abr","Jun")
                                   ,invierno= c("Jul", "Ago","Sep")
                                   ,primavera= c("Oct", "Nov","Dic"))) %>%
  count(meses)


#Funcion "fct_infreq"


#Volviendo a nuestro datasets
titanic_df <- read_csv("/home/lucaspalma/ICD/2C2023/Clase 2/guia_2_Titanic.csv", locale = locale(decimal_mark = ","))

#Una de las herramientas que nos da este paquete es "fct_infreq":

ggplot(data = titanic_df) +
  geom_bar(mapping = aes(x=fct_infreq(who), fill=alone))+
  ylab("Cantidad de personas")+
  xlab("Sexo")+
  scale_fill_discrete(name = "Viaje Solo?")

#Otra forma
titanic_df %>% mutate(who=who %>% fct_infreq() ) %>% ggplot() + geom_bar(aes(x=who,fill=alone))
