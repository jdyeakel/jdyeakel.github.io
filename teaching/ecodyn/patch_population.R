tmax <- 200

xc <- 2 

xmax <- 10 

K = 150 
nmax = K*2 

#cost
c = c(1,1) 
p = c(0,3)*K 
f = c(1,0.5) 
d = c(0.01,0.02) 
r = c(1,0) 

rscale = 0.5;

np = length(c) 

W = array(0,dim=c(xmax,nmax,tmax))
D = array(0,dim=c(xmax,nmax,tmax))


for (x in 1:xmax) {
  for (n in 1:nmax) {
    if (x <= xc) {
      W[x,n,tmax] <- 0 
    } else {
      # W[x,tmax] <- 1 
      W[x,n,tmax] <- max(r*((x*rscale)/xmax))
    }
  }
}

#boundary condition function
bc <- function(xvalue) {
  if (xvalue <= xc) {
    xvalue <- xc 
  }
  if (xvalue > xmax) {
    xvalue <- xmax 
  }
  return(xvalue)
}

interpolate <- function(xvalue,nvalue,W,t) {
  lowx <- floor(xvalue)
  highx <- lowx+1
  px <- highx-xvalue
  lown <- floor(nvalue)
  highn <- lown+1
  pn <- highn-nvalue
  Winterp <- 0
  if (pn < 1 && px == 1) {
    Winterp <- px*pn*W[lowx,lown,t+1] + px*(1-pn)*W[lowx,highn,t+1]
  }
  if (pn == 1 && px < 1) {
    Winterp <- px*pn*W[lowx,lown,t+1] + (1-px)*pn*W[highx,lown,t+1]
  }
  if (pn == 1 && px == 1) {
    Winterp <- px*pn*W[lowx,lown,t+1]
  }
  if (pn < 1 && px < 1) {
    Winterp <- px*pn*W[lowx,lown,t+1] + px*(1-pn)*W[lowx,highn,t+1] + (1-px)*pn*W[highx,lown,t+1] + (1-px)*(1-pn)*W[highx,highn,t+1]
  }
  return(Winterp) 
}


for (t in seq(tmax-1,1,-1)) {
  
  for (n in 1:nmax) {
  
    for (x in (xc+1):xmax) {
      
      value = numeric(np)
      
      for (i in 1:np) {
        
        # what is x if you find food?
        xp <- x - c[i] + p[i]/n 
        
        # what is x if you don't find food?
        xpp <- x - c[i] 
        
        xp <- bc(xp) 
        
        xpp <- bc(xpp) 
        
        Wxp <- interpolate(xp,n,W,t)
        Wxpp <- interpolate(xpp,n,W,t)

        value[i] <- (r[i]*((x*rscale)/xmax)) + (1-d[i])*f[i]*Wxp + (1-d[i])*(1-f[i])*Wxpp 
        
      } # end i loop
      
      maxvalue <- max(value) 
      istar <- which(value == maxvalue) 
      
      W[x,n,t] <- maxvalue 
      D[x,n,t] <- istar 
      
    }
  
  }

}


pop0 = 5
X = rep(floor(xmax/2),pop0) 
pop = numeric(tmax-1)

for (t in 1:(tmax-1)) {
  pop[t] = length(X)
  
  offspring <- 0 
  
  if (pop[t] > 0) {
  
    for (i in 1:length(X)) {
      
      state <- X[i] 
        
      #which activity do I choose?
      dec <- D[floor(state),pop[t],t] 
      
      #Reproduce
      r_draw = runif(1)
      if (r_draw > (1 - (state*rscale)/xmax)) {
        offspring <- offspring + 1
      }
      
      #Do I die during this activity?
      d_draw = runif(1) 
      
      #IF you survive, look for food
      if (d_draw > d[dec]) {
        
        #Do I find food during this activity?
        f_draw = runif(1) 
        
        if (f_draw < f[dec]) {
          #Do find food
          newstate = state + p[dec]/pop[t] - c[dec] 
        } else {
          #Don't find food
          newstate = state - c[dec] 
          
        }
        
        #Apply boundary conditions
        newstate = bc(newstate) 
        
      } else {
        newstate = xc 
      }
      
      #update state for next time interval
      X[i] = newstate 
    }
    
    #remove the dead
    stayalive <- which(X >= xc+1)
    X <- X[stayalive]
    
    #add offspring
    Xadd = floor(offspring)
    offspringstart = floor(xmax/2.5)
    if ((length(X) + Xadd) > nmax) {
      newX = rep(offspringstart,nmax)
      newX[1:length(X)] = X
      X = newX
    } else {
      newX = rep(offspringstart,Xadd)
      X = c(X,newX)
    }
    
  }
  
}

par(mfrow=c(1,2))
plot(pop,type='l',xlab = 'Time',ylab='N(t)')
plot(pop[1:(tmax-2)],pop[2:(tmax-1)],xlim=c(0,300),ylim=c(0,300),type='l',xlab='N(t)',ylab='N(t+1)')
lines(seq(0,300),seq(0,300),type='l',lty=3)

