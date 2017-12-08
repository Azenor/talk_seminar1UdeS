######## FIGURE NET INTERACTION STRENGTH ########
#################################################
setwd("~/GitHub/Talk_seminar1UdeS/figuresAz")
#### Functions to compute net strength of trophic cascade ####
###  log(Heff3), log(Peff2) & log(Peff3)   ###

logPHeff=function(para)  {
  with(as.list(para),{

    ## Equilibrial biomasses

    # NP
    Pequ=((q*d*Nin)/(zP+d))-(d/mu)

    ## NPH
    Pequ2=(zH+d)/(effPH*aPH*APH)
    Nequ2=(d*Nin)/(d+mu*Pequ2)
    Hequ2=(q*mu*Nequ2-zP-d)/(aPH*APH)

    ## NPHC
    Hequ3=(zC+d)/(effHC*aHC*AHC)
    Nequ3=(zP+d+(aPH*APH*Hequ3))/(q*mu)
    Pequ3=(d*Nin-d*Nequ3)/(mu*Nequ3)
    Cequ3=((effPH*aPH*APH*Pequ3)-zH-d)/(aHC*AHC)


    ## Strength of trophic cascade
    StrP2=log(Pequ/Pequ2)
    StrP3=log(Pequ2/Pequ3)
    StrH3=log(Hequ2/Hequ3)

    return(list(lPeff2=StrP2,lPeff3=StrP3,lHeff3=StrH3))

  })
}

## Temperature

temp_seq=seq(285,315,length.out=50)

## Body mass

mP=1.34*10^-4 # primary producer body-mass
mH=1.34*10^-2 # herbivore body-mass
mC=1.34       # carnivore body-mass

### Parameters temperature dependent

par_aPH=c(aPH0=2*10^11,mH,baPH=0.05,topt=298,E=0.65,E2=1.15)
aPH_seq=rBAU(temp=temp_seq,par_br=par_aPH)

par_aHC=c(aHC0=2*10^11,mC,baHC=0.05,topt=298,E=0.65,E2=1.15)
aHC_seq=rBAU(temp=temp_seq,par_br=par_aHC)

# Fixed parameters
D=0.8   # dilution rate
Nin=15  # nutrient input concentrations
ePH=0.45 # conversion efficieny
q=6     # C:N ratio
APH=0.7 # attack success probability
ks=0.8  # half saturation constant

AHC=0.8 # attack success probability herbivore-carnivore
eHC=0.85 # conversion efficieny herbivore-carnivore

topt=298
# Parameters temperature dependent
par_mu_max=c(mu0=3*10^10,mP,bmu=-0.25,topt=298,E=0.65,E2=1.15)
mu_seq=rBAU(temp=temp_seq,par_br=par_mu_max)

par_zP=c(zP0=0.8*10^10,mP,bzP=-0.25,topt=298,E=0.65,E2=1.15)
zP_seq=rBAU(temp=temp_seq,par_br=par_zP)

par_zH=c(zH0=10^10,mH,bzH=-0.25,topt=298,E=0.65,E2=1.15)
zH_seq=rBAU(temp=temp_seq,par_br=par_zH)

par_zC=c(zC0=0.6*10^11,mC,bzC=-0.25,topt=298,E=0.65,E2=1.15)
zC_seq=rBAU(temp=temp_seq,par_br=par_zC)

param=list(d=D,Nin=Nin,q=q,effPH=ePH,APH=APH,effHC=eHC,
           AHC=AHC,mu=mu_seq,zP=zP_seq,zH=zH_seq,aPH=aPH_seq,zC=zC_seq,aHC=aHC_seq)


## Net interaction strength

resNIS=logPHeff(param)

NIS_P2=resNIS$lPeff2
NIS_P3=resNIS$lPeff3
NIS_H3=resNIS$lHeff3

pdf("NetIS.pdf",width=5,height=5)

par(xaxs='i',yaxs='i')

par(mgp = c(1.5, 0.3, 0), tck = -.015, family = 'sans')

plot(temp_seq,NIS_P2,lwd=2,axes=F,ann=F,type='n')
axis(1,at=seq(min(temp_seq),max(temp_seq),10),labels=seq(min(temp_seq),max(temp_seq),10))
axis(2,at=round(seq(min(NIS_P2),max(NIS_P2),length.out=4),3),
labels=round(seq(min(NIS_P2),max(NIS_P2),length.out=4),1),las=2)

mtext(text="Force nette d'interaction",side=2,line=2,font=1,cex=1)
mtext(text='Température',side=1,line=1.5,font=1,cex=1)

lines(temp_seq,NIS_P2)
abline(v=topt,col='darkgray',lwd=2)
abline(v=min(temp_seq))
dev.off()
