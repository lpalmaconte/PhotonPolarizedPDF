library(tidyverse)

df_house<-read_csv('/home/lucaspalma/ICD/2C2023/Clase 4/housing.csv')

df<-diamonds

ggplot(df, aes(x = price, y = carat)) +
  geom_point()+
  geom_density_2d()

titanic_df <- read_csv("/home/lucaspalma/ICD/2C2023/Clase 2/guia_2_Titanic.csv", locale = locale(decimal_mark = ","))
glimpse(titanic_df)
view(titanic_df)

titanic_df %>%  
  ggplot(aes(x=fare)) +
  geom_jitter(aes(y=320.0), width=0) +
  geom_boxplot(aes(y = 300.0), fill='darksalmon')+
  geom_histogram(bins=100, 
                 fill='darkgreen', color='transparent')

## DENSIDAD del costo del pasaje
titanic_df %>%ggplot(aes(x=fare)) +
  geom_histogram(aes(y=..density..),bins=1000, 
               fill='darkgreen', color='transparent')+
  geom_density(alpha=0.5,bw=10)

##Densidades del costo del pasaje por supervivencia

titanic_df %>%ggplot(aes(x=fare,fill=survived)) +
  geom_density(alpha=0.5,bw=10)

##Otro ejemplo para discutir 
install.packages('ggridges')
library(ggridges)
titanic_df %>% 
  filter(sex=='male') %>%
  ggplot(aes(x=age, fill=survived, height = stat(density))) +
  # Prueben sacar "stat='density'". Cómo cambia el gráfico?
  geom_density_ridges(aes(y=class), alpha=0.5, stat='density',scale = 0.9) +
  #facet_wrap(~survived)+
  labs(y='Region', x='Costo del seguro [USD]')

