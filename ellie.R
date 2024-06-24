
library(data.table)
library(ggplot2)

dat <- fread("u:/personalz/ellie.csv")

ggplot(dat, aes(x=Description, t=))

dat[ , .(total= -sum(`+ / -`)), by=Description] |> remove_missing() |> 
  ggplot() + aes(x=reorder(Description, total), y=total) + 
  geom_col(fill="red") + coord_flip() + 
  theme_bw() + labs(x=NULL, y="Total (£)") + lims(y=c(0,50))+
  geom_text(aes(label=sprintf("£%0.2f",total)), hjust=-0.1)


dat[, Date:=as.Date(Date,format = "%d-%m-%Y-%H:%M:%S")]
dat[ , .(total= -sum(`+ / -`)), by=Date] |> remove_missing() |> 
  ggplot() + aes(x=Date, y=total) + 
  geom_col(fill="red") 


  theme_bw() + labs(x=NULL, y="Total (£)") + lims(y=c(0,50))+
  geom_text(aes(label=sprintf("£%0.2f",total)), hjust=-0.1)

  
  