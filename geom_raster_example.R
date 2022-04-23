library(tidyverse)

Var1 <- 1:1000
Var2 <- 1:1000
df<-expand_grid(Var1,Var2)
df<-df %>% mutate(value=Var1+Var2)


Var1<-sample(1:1000, 20, replace=T)
Var2<-sample(1:1000, 20, replace=T)
points<-tibble(Var1,Var2)
points<-points %>% mutate(value=as.character(seq.int(nrow(points)) ))

ggplot() +
  geom_raster(data=df,aes(Var1, Var2,fill=value)) +
  labs(x="Innovation Score",
       y="Invention Score",
       title = "Chart Title")+
  theme(#panel.grid = element_blank(),
    #axis.title = element_blank(),
    #axis.text = element_blank(),
    #axis.ticks = element_blank(),
    legend.position='none',
    panel.background = element_blank()) +
  geom_vline(xintercept = (1:5)*200,color="white",alpha=0.1)+
  geom_hline(yintercept = (1:5)*200,color="white",alpha=0.1)+
  geom_point(data=points,aes(Var1,Var2),color="white")+
  geom_text(data=points,aes(Var1,Var2,label=value),hjust=-0.3)
#geom_text_repel(data=points,aes(Var1,Var2,label=value),hjust=-0.2,min.segment.length = Inf)