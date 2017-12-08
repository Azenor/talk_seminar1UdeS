##### Figure Metabolic Theory #####
###################################
setwd("~/GitHub/Talk_seminar1UdeS/figuresAz")
### Temperature dependence of biological rates ###

## BA unimodal model
rBAU=function(temp,par_br,uni=1) {
  #input: temp=temperature range
  #       par_br=parameter vector
  #parameters:
  r0=par_br[[1]]  #scaling coefficient
  m=par_br[[2]]   #body-mass
  b=par_br[[3]]   #allometric scaling coefficient
  tpk=par_br[[4]] #optimal temperature
  E=par_br[[5]]   #activation energy
  Ed=par_br[[6]]  #deactivaiton energy
  k=8.617*10^-5   #Boltzmann constant
  # uni : specify if unimodal or exponential BA model

  if (uni==0) {
    l=1
  } else {
    l=1/(1+exp(-1/(k*temp)*(Ed-(Ed/tpk+k*log(E/(Ed-E)))*temp))) #decline phase
  }
  return(BR=r0*m^b*exp(-E/(k*temp))*l)
}


### Interaction strength per capita, per population, net ###
########## Plots according to temperature ##################
############################################################

## Temperature

temp_seq=seq(285,315,length.out=50)

## Body mass

mH=1.34*10^-2 # herbivore body-mass


### Parameters temperature dependent

par_aPH=c(aPH0=2*10^11,mH,baPH=0.05,topt=298,E=0.65,E2=1.15)
aPH_seq=rBAU(temp=temp_seq,par_br=par_aPH)


pdf("MTE.pdf",width=5,height=5)
par(xaxs='i',yaxs='i')

par(mgp = c(1.5, 0.3, 0), tck = -.015, family = 'sans')

plot(temp_seq,aPH_seq,lwd=2,axes=F,ann=F,type='l')
axis(1,at=seq(min(temp_seq),max(temp_seq),10))
axis(2,at=round(seq(min(aPH_seq),max(aPH_seq),length.out=4),2),
     labels=round(seq(min(aPH_seq),max(aPH_seq),length.out=4),2),las=2)

mtext(text="Taux biologique",side=2,line=2,font=1,cex=1)
mtext(text='Température',side=1,line=1.5,font=1,cex=1)

mtext(expression(T[opt]), side = 1, at=299,line = 0.6, outer = FALSE,cex=1.1)

coord.x=c(min(temp_seq),temp_seq[which(temp_seq<=298)],298)

coord.y=c(0,aPH_seq[which(temp_seq<=298)],min(aPH_seq))

polygon(x=coord.x, y=coord.y,col="#E0E0E080",border=NA)
abline(v=298,col='red',lwd=2)

text(293,0.55,"GTP",font=2,cex=1.5)
abline(v=min(temp_seq))
abline(h=min(aPH_seq))
lines(temp_seq,aPH_seq)

dev.off()
