library(tidyverse)
library(ggridges)

titanic_df <- read_csv("/home/lucas/ICD/2C2023/Clase 2/guia_2_Titanic.csv", locale = locale(decimal_mark = ","))
glimpse(titanic_df)
view(titanic_df)

#Análisis de precios del titanic

# Box-plot
titanic_df %>%  
  ggplot(aes(x=fare)) +
  geom_jitter(aes(y=1), width=0) +
  geom_boxplot(aes(y=0), fill='darksalmon')+
  #geom_violin(aes(y=0),alpha=0.4)+
  labs(x="Tarifa")+
  scale_y_continuous(name=NULL)

# Armo un histograma
titanic_df %>%  
  ggplot(aes(x=fare)) +
  geom_histogram()+
  labs(x="Tarifa")+
  scale_y_continuous(name=NULL)

## Densidad del costo del pasaje

titanic_df %>%ggplot(aes(x=fare)) +
  geom_histogram(aes(y=..density..),alpha=0.3)+
  geom_density(alpha=0.5,bw=15)

## Veamos algunos otros gráficos y que podemos decir de ellos...

##Densidades del costo del pasaje por supervivencia

titanic_df %>%ggplot(aes(x=fare,fill=survived)) +
  geom_density(alpha=0.5)+
  coord_cartesian(xlim = c(0, 200))+
  labs(x="Tarifa")

#"A medida que el costo del pasaje aumenta hay mas sobrevivientes que no sobrevivientes" 

#"A medida que el costo del pasaje aumenta hay mas chances de sobrevivir" 

#"Puedo hablar de como son las distribuciones de cada clase
# y en un rango de tarifas cual tiene mayor densidad"


## Otro ejemplo para discutir...

titanic_df %>% 
  ggplot(aes(x=age, fill=survived)) +
  geom_density( alpha=0.5, stat='density',scale = 0.9) 

#"La mayoría de las personas que NO sobrevivieron tenían entre 20 y 35 años"
#"En el rango de edad de 0 a 5 años el grupo de sobrevivientes tiene mayor proporción"

##Otro...

titanic_df %>% 
  ggplot(aes(x=age, fill=survived, height = stat(density))) +
  geom_density_ridges(aes(y=class), alpha=0.5, stat='density',scale = 0.9) 
  #facet_wrap(~survived)

##"la primera clase es la que menor densidad de muertes presentó"

## No puedo comparar toda el área de la curva.


## Numero de bins 

## Dataset diamonds

df_diamantes<-diamonds

view(df_diamantes)

# Quiero ver como es la distribución de quilates.

ggplot(df_diamantes,aes(x=carat))+
  geom_histogram(aes(y=..density..),alpha=0.3,bins=6)+
  geom_density(bw=0.2)+
  scale_y_continuous(name=NULL)+
  labs(x="Quilates")

#Como elegir el numero de bins? reglas de Scott y Freedman–Diaconis.

nclass.scott(df_diamantes$carat) # 3.49 Sigma / n^(1/3), con los dedos: minimiza la diferencia con la densidad

nclass.FD(df_diamantes$carat) # 2 IQR / n^(1/3), IQR menos sensible a outliers.

nclass.Sturges(df_diamantes$carat) # 1 + log_2(#data)

ggplot(df_diamantes,aes(x=carat))+
  geom_histogram(aes(y=..density..),alpha=0.3,bins=17)+
  geom_density(bw=0.2)+
  scale_y_continuous(name=NULL)+
  labs(x="Quilates")



### EJEMPLO DE DISTRIBUCIONES CONJUNTAS


# Quiero ver como es la distribución conjunta del precio y los quilates.

#Ideas?

# Momento wikipedia:  la distribución conjunta de X e Y es la distribución de 
# de la intersección de eventos de X e Y, esto es,
# de los eventos X e Y ocurriendo de forma simultánea.

ggplot(df_diamantes,aes(x=carat,y=price)) +
  geom_bin2d(bins =142) +  #aes(fill=..density..)
  scale_fill_continuous(type = "viridis") +
  theme_bw()+
  labs(fill="Densidad",x="Quilates",y="Precio")



#Densidad en 2D
ggplot(df_diamantes,aes(x=carat,y=price))+
  geom_density_2d(aes(color = ..level..))+ 
  scale_fill_continuous(type = "viridis") +
  theme_bw()+
  labs(fill="Densidad",x="Quilates",y="Precio")

#con stat puedo rellenar con color

ggplot(df_diamantes,aes(x=carat,y=price))+
#  geom_point()+
  stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white")
 # scale_y_log10()



