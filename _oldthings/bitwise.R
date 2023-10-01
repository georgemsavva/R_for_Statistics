library(ggplot2)
z=\(x,y,n)bitwAnd(bitwAnd(x,y),bitwXor(x,y)%%n)>0
expand.grid(x=0:140,y=0:150)|>
ggplot(aes(x,y,fill=z(x+y,y-x,41+(x>y)*18)+2*z(x+y,y-x,7)))+
geom_raster()+theme_void()+coord_fixed()+
scale_fill_viridis_c(option="A",guide=NULL)

