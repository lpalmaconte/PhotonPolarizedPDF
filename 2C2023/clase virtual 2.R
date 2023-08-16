

##Repaso clase del lunes 14/08

library(tidyverse)

titanic_df <- read_csv("/home/lucas/ICD/2C2023/Clase 2/guia_2_Titanic.csv", locale = locale(decimal_mark = ","))
#glimpse(titanic_df)
new_titanic_df <- rename(titanic_df, 'Puerto' = 'Port of Embarkation', "padres_hijos"="parents / children aboard the Titanic", "hermanos"="siblings of the passenger")

#¿Hay mas hombres o mujeres viajando solos?

ggplot(data = new_titanic_df) +
  geom_bar(mapping = aes(x=sex, fill=alone))

#¿De las personas que viajan solas qué proporción son mujeres?
# Para poder ver esto hay que agregar position = "fill" al geom:

ggplot(data = new_titanic_df) +
  geom_bar(mapping = aes(x=sex,fill=alone), position="fill")


##Analisis sobrevivientes del titanic

#cantidad de sobrevivientes de cada clase.
titanic_sobrevivientes<-filter(new_titanic_df, survived=="yes")
ggplot(data=titanic_sobrevivientes)+
  geom_bar(aes(x=class))

###¿Con este gráfico se puede concluir que la segunda clase fue la que más pérdidas sufrió?

#Inlcuyo los que no sobrevivieron
ggplot(data=new_titanic_df)+
  geom_bar(aes(x=class,fill=survived))

#¿se puede afirmar que la tercera clase fue la más perjudicada? 
#¿Puede ser que la tercera clase tuvo más fallecidos sólo porque era la más numerosa?
#¿qué gráfico permitiría explorar esta pregunta?