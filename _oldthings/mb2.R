options(locatorBell=F)
m=\(x,y){n=z=0
for(i in 1:10){z=(x+1i*y)^z+x+1i*y;n[Mod(z)<5]=i};n}
N=300;x=y=0;i=1;
A=(-N:N)/N*2
x11()
repeat{image(R<-A+x[i],I<-A+y[i],outer(R,I,m),u=T,c=hcl.colors(99,"Inf"))
  i=identify(x<-rep(R,e=N),y<-rep(I,N),n=1)
  A=A/2}