require(deSolve)
# library(deSolve)

#Parameters

e1 <- 0.5
e2 <- 0.5
r1 <- 0.2
r2 <- 0.1
k <- 500
d <- 0.5
theta1 <- -0.2
theta2 <- 0.2
alpha <- 0.02
tau <- 0.1
sigma <- 0.2 #(0.1, 0.2)
heritability <- 0.25
sigmaG <- sqrt(heritability*(sigma^2))

#Set initial values
yini = c(P=5,N1=1,N2=140,xbar=0.2)

ecoevo = function (t, y, params) {
  with(as.list(y), {
    dP <- e1*(((alpha*tau)/sqrt(sigma^2+tau^2))*exp(-((xbar-theta1)^2)/(2*(sigma^2+tau^2))))*N1*P + e2*(((alpha*tau)/sqrt(sigma^2+tau^2))*exp(-((xbar-theta2)^2)/(2*(sigma^2+tau^2))))*N2*P - d*P
    
    dN1 <- r1*N1*(1-(N1/k)) - (((alpha*tau)/sqrt(sigma^2+tau^2))*exp(-((xbar-theta1)^2)/(2*(sigma^2+tau^2))))*N1*P
    
    dN2 <- r2*N2*(1-(N2/k)) - (((alpha*tau)/sqrt(sigma^2+tau^2))*exp(-((xbar-theta2)^2)/(2*(sigma^2+tau^2))))*N2*P
    
    dxbar <- sigmaG^2*(((e1*N1*tau*alpha*(theta1-xbar)/((tau^2+sigma^2)^(3/2)))*exp(-(xbar-theta1)^2/(2*(tau^2+sigma^2))))+((e2*N2*tau*alpha*(theta2-xbar)/((tau^2+sigma^2)^(3/2)))*exp(-(xbar-theta2)^2/(2*(tau^2+sigma^2)))))
    
    list(c(dP,dN1,dN2,dxbar))
    })
}




times <- seq(from=0, to=1000, by = 0.1)
out <- ode(y=yini, times=times,func=ecoevo,parms = NULL)

library(RColorBrewer)
pal = brewer.pal(4,"Set1")
par(mfrow=c(2,1))
maxvalue = max(out[,2:4])
plot(out[,1],out[,2],col=pal[1],type='l',lty=2,ylim=c(0,maxvalue),lwd=2,xlab="Time",ylab="Predator and prey densities")
lines(out[,1],out[,3],col=pal[2],lwd=2)
lines(out[,1],out[,4],col=pal[3],lwd=2)
plot(out[,1],out[,5],col='black',type='l',lwd=2,xlab="Time",ylab="Trait value")

par(mfrow=c(1,1))
plot(out[,2],out[,3],type='l',xlab="Predator density",ylab="Prey1 density")
