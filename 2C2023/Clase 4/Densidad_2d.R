## Elección numero de bins 

## Dataset diamonds

df_diamantes<-diamonds

view(df_diamantes)

# Quiero ver como es la distribución de quilates.

ggplot(df_diamantes,aes(x=carat))+
  geom_histogram(aes(y=..density..),alpha=0.3,bins=10)+
  geom_density(bw=0.2)+
  scale_y_continuous(name=NULL)+
  labs(x="Quilates")

#Como elegir el numero de bins? reglas de Scott y Freedman–Diaconis.

numero_bins_scott<-nclass.scott(df_diamantes$carat) # 3.49 Sigma / n^(1/3), con los dedos: minimiza la diferencia (MSE) con la estimación de la densidad.

numero_bins_FD<-nclass.FD(df_diamantes$carat) # 2 IQR / n^(1/3), IQR menos sensible a outliers.

numero_bins_stur<-nclass.Sturges(df_diamantes$carat) # 1 + log_2(#data), distribución binomial.

### Con estos números...

ggplot(df_diamantes,aes(x=carat))+
  geom_histogram(alpha=0.3,bins=numero_bins_scott)+
  scale_y_continuous(name=NULL)+
  labs(x="Quilates")



### EJEMPLO DE DISTRIBUCIONES CONJUNTAS


# Quiero ver como es la distribución conjunta del precio y los quilates.

#Ideas?

# Momento wikipedia:  la distribución conjunta de X e Y es la distribución de la intersección de eventos de X e Y, esto es,
# de los eventos X e Y ocurriendo de forma simultánea.

ggplot(df_diamantes,aes(x=carat,y=price)) +
  geom_bin2d(bins =c(110,15)) +  #aes(fill=..density..)
 # geom_point(color="white",alpha=0.1)+
  scale_fill_continuous(type = "viridis") +
  theme_bw()+
  labs(x="Quilates",y="Precio")+
  scale_y_log10()+
  scale_x_log10()

#geom_hexbin

ggplot(df_diamantes,aes(x=carat,y=price)) +
  geom_hex(bins =142) +  #aes(fill=..density..)
  scale_fill_continuous(type = "viridis") +
  theme_bw()+
  labs(fill="Densidad",x="Quilates",y="Precio")

#Densidad en 2D
ggplot(df_diamantes,aes(x=carat,y=price))+
  #geom_point(alpha=0.1)+
  geom_density_2d(aes(color = ..level..))+ #aes(color = ..level..)
  scale_fill_continuous(type = "viridis") +
  scale_y_log10()+
  theme_bw()+
  labs(fill="Densidad",x="Quilates",y="Precio")




#con stat puedo rellenar con color

ggplot(df_diamantes,aes(x=carat,y=price))+
  #  geom_point()+
  stat_density_2d(aes(fill = ..level..), geom = "polygon", colour="white")
# scale_y_log10()
