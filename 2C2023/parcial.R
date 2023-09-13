library(tidyverse)

df_house<-read_csv('/home/lucaspalma/ICD/2C2023/Clase 4/housing.csv')
df_diamonds<-diamonds

#Ej 4 A
df_house %>%  
  ggplot(aes(y=median_house_value,x=ocean_proximity)) +
  geom_boxplot( fill='darksalmon')+
  labs(y="Valor medio de la casa (USD)",x="Proximidad al océano")

df_house %>% 
  ggplot(aes(y=median_house_value,fill=ocean_proximity))+
  geom_boxplot()+
  labs(y="Valor medio de la casa ($USD)",x="Proximidad al océano")

df_house %>% 
  ggplot(aes(y=median_house_value,x=ocean_proximity))+
  geom_point()+
  labs(y="Valor medio de la casa ($USD)",x="Proximidad al océano")


df_house %>%  
  ggplot(aes(x=fct_infreq(ocean_proximity))) +
  geom_bar()+
  labs(y="Cantidad",x="Proximidad al océano")

df_house %>%
  ggplot(aes(x=median_house_value)) +
  geom_histogram(aes(y=..density..),bins=10)+
  labs(x="Valor medio de la casa ($USD)")


df_house %>%
  ggplot(aes(x=median_house_value)) +
  geom_histogram(bins=10, 
                 fill='darkgreen')+
  labs(x="Valor medio de la casa ($USD)")

#Ej 4 B Completar:

df_house %>%
  ggplot(aes(x=median_house_value)) + #median_house_value
  geom_histogram(aes(y=..density..),bins=10, #..density..
                 fill='darkgreen', color='transparent')+
  geom_density() +
  labs(x="Valor medio de la casa ($USD)")


library(ggridges)
df_house %>% 
  ggplot(aes(x=median_house_value, height =stat(density))) +
  geom_density_ridges(aes(y=ocean_proximity), alpha=0.5,scale=0.9,stat="density") +
  labs(y='Proximidad al océano', x='Valor medio de una casa [USD]')

df_diamonds %>% ggplot()+
  geom_bar(aes(x=cut, fill=color), position='fill') #cut, color, fill


#Ej 8
library(tidyverse)

titanic_df <- read_csv("/home/lucaspalma/ICD/2C2023/Clase 2/guia_2_Titanic.csv", locale = locale(decimal_mark = ","))
#glimpse(titanic_df)
df_titanic<- rename(titanic_df, 'Puerto' = 'Port of Embarkation', "padres_hijos"="parents / children aboard the Titanic", "hermanos"="siblings of the passenger")


ggplot(data = df_titanic) +
  geom_bar(mapping = aes(x=sex,fill=alone), position="fill")

#“Hay más mujeres que viajas solas que hombres que viajan solos” F

#“Hay más mueres que viajan acompañadas que las que viajan solas” V

#“Dentro del grupo de gente que viaja acompañado hay más proporción de mujeres que de hombres” F

#“De los hombres, más de la mitad viajo solo” V

library(ggridges)

ggplot(data = df_titanic, aes(x=age,fill=survived,height = stat(density))) +
  geom_density_ridges(aes(y=class),scale=0.9,alpha=0.3,stat='density')
#“Entre las edades de 60 a 80 años hay más personas de primera clase que de tercera clase” F

#“Para la segunda clase, la proporción de niños que sobrevivieron es mayor a la de los niños que no sobrevivieron” 

#“Para la tercera clase, entre las edades de 40 a 50 años hay más gente que no sobrevivió que gente que sobrevivió.”


#(ej 8 B)
#Para que rango de tarifa puedo afirmar que....

