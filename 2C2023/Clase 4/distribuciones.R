# El código en este archivo está pensando como guía para el trabajo de laboratorio. El código tal cuál está escrito no funciona, tienen que completar donde aparecen signos de interrogación.

library(tidyverse)

# Leemos los datos
df <- read_csv('insurance.csv')

# Punto 5 de la guía
df %>% 
  # Filtrar solo fumadores varones
  filter(smoker==???, ???) %>%
  ggplot(aes(x=???)) +
  geom_jitter(aes(y=2.0), width=0) +
  geom_boxplot(aes(y = 3.0), fill='darksalmon') +
  geom_dotplot(binwidth=????, 
               fill='salmon', color='transparent',
               dotsize=0.7) +
  # Para sacar las etiquetas del eje y, que no indican nada
  scale_y_continuous(name=NULL, labels=NULL) +
  labs(x=???,
       title='Costo del seguro de salud',
       subtitle='Varones fumadores de EEUU') +
  theme(axis.title = element_text(size=14))

# Punto 8
???

## Punto 10.
bw <- ???
df %>% 
  filter(smoker=='yes', sex=='male') %>%
  ggplot(aes(x=???)) +
  # Grafica el histograma
  geom_histogram(binwidth=bw, 
                 fill='darkgreen', color='transparent') +
  stat_bin(aes(y=..count.., label=..count..), binwidth=bw,
           geom='text', vjust=-.5) +
  labs(y=???, x='Costo del seguro [USD]')

# Punto 11
bw <- ???
df %>% 
  filter(sex=='male') %>%
  ggplot(aes(x=???, fill=???)) +
  # Completen la posición. Vean la diferencia entre 'stack' y 'identity'
  geom_histogram(binwidth=bw, color='transparent', position='identity',
                 alpha=0.5) +
  labs(y='Cuentas', x='Costo del seguro [USD]')

# Punto 13
bw <- 2000
df %>% 
  filter(sex=='male') %>%
  ggplot(aes(x=???, fill=???)) +
  # Completen el mapeo usando la densidad ('density').
  #Vean cómo se referencian las variables calculadas por el geom en el punto 10
  geom_histogram(aes(y=???), position='identity', binwidth=bw, 
                 color='transparent', alpha=0.5) +
  labs(y='Cuentas', x='Costo del seguro [USD]')

# Punto 14
??? + geom_density()

# Punto 16
bw <- 2000
df %>% 
  filter(sex=='male') %>%
  ggplot(aes(x=charges, fill=region)) +
  # Después de probar, cambiar esta línea para usar freqpoly
  geom_histogram(aes(y=..density..), position='identity', binwidth=bw, 
                 color='transparent', alpha=0.5) +
  labs(y='Cuentas', x='Costo del seguro [USD]')

# Punto 17; Violin
  df %>% 
    filter(sex=='male') %>%
    ggplot(aes(x=???, y=charges)) +
    geom_violin() +
    labs(x=???, y='Costo del seguro [USD]')
  

# Punto 19; ggridges
install.packages('ggridges')
library(ggridges)
  df %>% 
    filter(sex=='male') %>%
    ggplot(aes(x=charges, fill=smoker, height = stat(density))) +
    # Prueben sacar "stat='density'". Cómo cambia el gráfico?
    geom_density_ridges(aes(y=region), alpha=0.5, stat='density') +
    labs(y='Region', x='Costo del seguro [USD]')
  
# Punto 20; geom_density2d
  df %>% 
    filter(sex=='male') %>%
    ggplot(aes(x=charges, y=bmi, color=smoker)) +
    geom_density_2d() +
    scale_color_discrete(name='Fumador', labels=c('No', 'Sí')) +
    labs(y='Índice de masa corporal', x='Costo del seguro [USD]',
         title='Distribución de BMI y costos del seguro médico',
         subtitle='Varones de EEUU') +
    theme(axis.title = element_text(size=12),
          axis.text = element_text(size=12),
          title = element_text(size=14),
          legend.title = element_text(size=12)) 
  