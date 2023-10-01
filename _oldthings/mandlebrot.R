options(locatorBell=F)
m=\(x,y){n=z=0
for(i in 1:100){
z=z^2+x+1i*y;
n[Mod(z)<5]=i}
n}
N=600;x=y=0
i=1;
A=(-N:N)/N*2
x11(w=10,h=10)
par(mar=rep(0,4))
repeat{
image(R<-A+x[i],I<-A+y[i],outer(R,I,m),u=T,c=hcl.colors(100,"Inf"))
i=identify(x<-rep(R,e=N),y<-rep(I,N),n=1)
A=A/2}

gifski::gifski(Sys.glob("plot*.png"),w=910,h=910)


options(locatorBell=F)
m=\(x,y){n=z=0
for(i in 1:100){
  z=z^2+x+1i*y;
  n[Mod(z)<5]=i}
n}
N=600;x=y=0
i=1;
#j=0
A=(-N:N)/N*2
x11(w=10,h=10,type="cairo")
par(mar=rep(0,4))
repeat{
  image(R<-A+x[i],I<-A+y[i],outer(R,I,m),u=T,c=hcl.colors(100,"PuOr"))
  savePlot(sprintf("plot%02d.png",j<-j+1),type="png")
  i=identify(x<-rep(R,e=N),y<-rep(I,N),n=1)
  A=A/2}

gifski::gifski(Sys.glob("plot*.png"),w=910,h=910)
