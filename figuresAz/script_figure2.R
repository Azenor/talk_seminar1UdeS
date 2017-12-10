setwd("~/GitHub/Talk_seminar1UdeS/figuresAz")

## Logistic equation
funLog=function(P,r,K){
  dP=r*P*(1-(P/K))
}

r=0.1
K=25
P=seq(0,100,10)
res=funLog(r,K,P)
plot(res)

## Solution of Logistic equation
temp=seq(0,100,1)

solLog=function(P0,r,K,t){
  Pt=(K*P0*exp(r*t))/(K+(P0*(exp(r*t)-1)))
}

P0=1
res2=solLog(P0,r,K,t=temp)
plot(temp,res2,type='l')

pdf("logistic.pdf",width=5,height=5)
par(xaxs='i',yaxs='i')

par(mgp = c(1.5, 0.3, 0), tck = 0, family = 'sans')
plot(temp,res2,ann=F,type='n',axes='F')
abline(v=0)
abline(h=min(res2))
mtext(text="Densité de bactéries",side=2,line=1,font=1,cex=1,family="sans")
mtext(text='Temps',side=1,line=1,font=1,cex=1,family="sans")
lines(temp,res2)
text(27,12,"r",font=2,cex=1)
mtext("K",side=3,font=2,cex=1,at=90)
dev.off()

### Functional response

funcR=function(a,R,h){
  fR=(a*R)/(1+a*h*R)
}

a=0.2
h=0.5
R=seq(1,100,1)

resFR=funcR(a,R,h)

pdf("repfonc.pdf",width=5,height=5)
par(xaxs='i',yaxs='i')
par(mgp = c(1.5, 0.3, 0), tck = 0, family = 'sans')
plot(R,resFR,ann=F,type='n',axes='F')
abline(h=min(resFR))
abline(v=min(R))
mtext(text="Nombre de bactéries consommées",side=2,line=1,font=1,cex=1,family="sans")
mtext(text='Densité de bactéries',side=1,line=1,font=1,cex=1,family="sans")
lines(R,resFR)
dev.off()


### Plot distance to equilibrium
a=0.5
t=seq(0,10,0.1)
dis=exp(-a*t)

pdf("disequ2.pdf",width=5,height=5)
par(xaxs='i',yaxs='i')
par(mgp = c(1.5, 0.3, 0), tck = 0, family = 'sans')
plot(t,dis,ann=F,type='n',axes='F')
axis(2,at=c(min(dis),1),labels=c(0,1),las=2)
abline(h=min(dis))
abline(v=min(t))
mtext(text="Distance à l'équilibre",side=2,line=1,font=1,cex=1,family="sans")
mtext(text='Temps',side=1,line=1,font=1,cex=1,family="sans")
lines(t,dis)
dev.off()

# 2 espèces
A=matrix(c(-1,-4,0,-2),byrow=T,ncol=2)
u=c(0.9,0.4)

t=seq(0,1,0.01)

X1=matrix(0,ncol=length(t),nrow=2)

for (i in 1:length(t)) {
  X1[,i]=expm(t[i]*A)%*%u
}

xt1=sqrt(X1[1,]^2+X1[2,]^2)

plot(t,X1[1,],type='l')
lines(t,X1[2,],type='l')
plot(t,log(xt1),ylab="Distance to equilibrium",xlab="Time",type="l",main='',col='red',lwd=2,xaxt='n',yaxt='n')

## Observés-attendus

y=seq(0,10,0.1)
stoch=rnorm(y,y,0.7)
color=rgb(0,0,0,alpha=0.20) 

pdf("yx.pdf",width=5,height=5)
par(xaxs='i',yaxs='i')
par(mgp = c(1.5, 0.3, 0), tck = 0, family = 'sans')
plot(y,y,ann=F,type='n',axes='F')
abline(h=min(y))
abline(v=min(y))
mtext(text="Observés",side=2,line=0.5,font=1,cex=1,family="sans")
mtext(text='Prédis',side=1,line=0.5,font=1,cex=1,family="sans")
lines(y,y,lwd=2)
points(stoch,y,col=color,pch=16)
dev.off()
