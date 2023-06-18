tmax <- 1000;

xc <- 3;

xmax <- 50;

#cost
c = c(1,1,1);
p = c(0,3,5);
f = c(1,0.4,0.6);
d = c(0,0.004,0.02);
r = c(0.6, 1.1, 0.21);

np = length(c);

S = matrix(0,xmax,tmax);
D = matrix(0,xmax,tmax);

S_r = matrix(0,xmax,tmax);
D_r = matrix(0,xmax,tmax);


xbar <- 6.5;
for (x in 1:xmax) {
  if (x <= xc) {
    S[x,tmax] <- 0;
  } else {
    # S[x,tmax] <- 1;
    S[x,tmax] <- (x - xc)/(x-xc+xbar);
    S_r[x,tmax] <- max(r*x)
  }
}

#boundary condition function
bc <- function(xvalue) {
  if (xvalue <= xc) {
    xvalue <- xc;
  }
  if (xvalue > xmax) {
    xvalue <- xmax;
  }
  return(xvalue)
}


for (t in seq(tmax-1,1,-1)) {
  
  for (x in (xc+1):xmax) {
    
    value = numeric(np)
    value_r = numeric(np)
    
    for (i in 1:np) {
      
      # what is x if you find food?
      xp <- x - c[i] + p[i];
      
      # what is x if you don't find food?
      xpp <- x - c[i];
      
      xp <- bc(xp);
      
      xpp <- bc(xpp);
      
      value[i] <- (1-d[i])*f[i]*S[xp,t+1] + (1-d[i])*(1-f[i])*S[xpp,t+1];
      value_r[i] <- r[i]*x + (1-d[i])*f[i]*S_r[xp,t+1] + (1-d[i])*(1-f[i])*S_r[xpp,t+1];
      
    } # end i loop
    
    maxvalue <- max(value);
    maxvalue_r <- max(value_r)
    istar <- which(value == maxvalue);
    
    S[x,t] <- maxvalue;
    D[x,t] <- istar;
    
  }
  
  
}


n = 100;
X = matrix(0,n,tmax);
R = matrix(0,n,tmax);
#Initial state
X[,1] = xmax;
R[,1] = xmax;


for (t in 1:(tmax-1)) {
  for (i in 1:n) {
    state = X[i,t];
    
    #Only go through this if the individual is still alive
    if (state > xc) {
      #which activity do I choose?
      dec = D[state,t];
      #Do I die during this activity?
      d_draw = runif(1);
      
      #IF you survive, look for food
      if (d_draw > d[dec]) {
        
        #Do I find food during this activity?
        f_draw = runif(1);
        
        if (f_draw < f[dec]) {
          #Do find food
          newstate = state + p[dec] -c[dec];
        } else {
          #Don't find food
          newstate = state - c[dec];
          
        }
        
        #Apply boundary conditions
        newstate = bc(newstate);
        
      } else {
        newstate = xc;
      }
      
      #update state for next time interval
      X[i,t+1] = newstate;
    }
  }
}


plot(X[1,],type='l',ylim=c(0,xmax))
for (i in 2:n) {
  lines(X[i,])
}


n = 100;
R = matrix(0,n,tmax);
#Initial state
R[,1] = xmax;


for (t in 1:(tmax-1)) {
  for (i in 1:n) {
    
    state = R[i,t];
    
    #Only go through this if the individual is still alive
    if (state > xc) {
      
      #which activity do I choose?
      # dec = D[state,t];
      dec = sample(c(1,2,3),1);
      
      #Do I die during this activity?
      d_draw = runif(1);
      
      #IF you survive, look for food
      if (d_draw > d[dec]) {
        
        #Do I find food during this activity?
        f_draw = runif(1);
        
        if (f_draw < f[dec]) {
          #Do find food
          newstate = state + p[dec] -c[dec];
        } else {
          #Don't find food
          newstate = state - c[dec];
          
        }
        
        #Apply boundary conditions
        newstate = bc(newstate);
        
      } else {
        newstate = xc;
      }
      
      #update state for next time interval
      R[i,t+1] = newstate;
    }
  }
}

plot(R[1,],type='l',ylim=c(0,xmax))
for (i in 2:n) {
  lines(R[i,])
}
