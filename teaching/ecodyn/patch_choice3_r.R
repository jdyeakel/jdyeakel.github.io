tmax <- 100;

xc <- 3;

xmax <- 50;

#cost
c = c(1,1,1);
p = c(0,3,5);
f = c(1,0.4,0.6);
d = c(0,0.004,0.02);
r = c(0.6, 0.6, 0.8);

np = length(c);

#Without per period fitness
S = matrix(0,xmax,tmax);
D = matrix(0,xmax,tmax);

#Per period fitness
W = matrix(0,xmax,tmax);
D_r = matrix(0,xmax,tmax);

#Maximizing reproduction alone
Q = matrix(0,xmax,tmax);
D_q = matrix(0,xmax,tmax);

#Random choices
R = matrix(0,xmax,tmax);

xbar <- 6.5;
for (x in 1:xmax) {
  if (x <= xc) {
    S[x,tmax] <- 0;
    W[x,tmax] <- 0;
    Q[x,tmax] <- 0;
    R[x,tmax] <- 0;
  } else {
    # S[x,tmax] <- 1;
    S[x,tmax] <- (x - xc)/(x-xc+xbar);
    W[x,tmax] <- (x - xc)/(x-xc+xbar); #max(r)
    Q[x,tmax] <- (x - xc)/(x-xc+xbar); #max(r)
    R[x,tmax] <- (x - xc)/(x-xc+xbar); #(1/3)*sum(r)
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
    value_q = numeric(np)
    value_R = numeric(np)
    
    for (i in 1:np) {
      
      # what is x if you find food?
      xp <- x - c[i] + p[i];
      
      # what is x if you don't find food?
      xpp <- x - c[i];
      
      xp <- bc(xp);
      
      xpp <- bc(xpp);
      
      value[i] <- (1-d[i])*f[i]*S[xp,t+1] + (1-d[i])*(1-f[i])*S[xpp,t+1];
      value_r[i] <- r[i] + (1-d[i])*f[i]*W[xp,t+1] + (1-d[i])*(1-f[i])*W[xpp,t+1];
      value_q[i] <- r[i] + (1-d[i])*f[i]*Q[xp,t+1] + (1-d[i])*(1-f[i])*Q[xpp,t+1];
      value_R[i] <- r[i] + (1-d[i])*f[i]*R[xp,t+1] + (1-d[i])*(1-f[i])*R[xpp,t+1];
      
    } # end i loop
    
    maxvalue <- max(value);
    maxvalue_r <- max(value_r)
   
    maxvalue_R <- mean(value_R);
    
    istar <- which(value == maxvalue);
    istar_r <- which(value_r == maxvalue_r);
    
    istar_q <- which(r == max(r));
    maxvalue_q <- value_q[istar_q];
    
    S[x,t] <- maxvalue;
    D[x,t] <- istar;
    
    W[x,t] <- maxvalue_r;
    D_r[x,t] <- istar_r;
    
    Q[x,t] <- maxvalue_q;
    D_q[x,t] <- istar_q;
    
    R[x,t] <- maxvalue_R;
    
  }
  
  
}







n = 100;
X = matrix(0,n,tmax);
X_r = matrix(0,n,tmax);
R = matrix(0,n,tmax);
#Initial state
X[,1] = xmax;
X_r[,1] = xmax;
offspring_r = matrix(0,n,tmax);

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
    
    }
    #update state for next time interval
    X[i,t+1] = newstate;

    state_r = X_r[i,t];

    if (state_r > xc) {
      
      dec_r = D_r[state_r,t];
      offspring_r[i,t] = W[state_r,t];
      
      #Do I die during this activity?
      d_draw = runif(1);

        #IF you survive, look for food
      if (d_draw > d[dec_r]) {
        
        #Do I find food during this activity?
        f_draw = runif(1);
        
        if (f_draw < f[dec_r]) {
          #Do find food
          newstate_r = state_r + p[dec_r] - c[dec_r];

        } else {
          #Don't find food
          newstate_r = state_r - c[dec_r];
          
        }
        
        #Apply boundary conditions
        newstate_r = bc(newstate_r);
        
      } else {
        newstate_r = xc;
      }
      
    }

    X_r[i,t+1] = newstate_r;

  }
}





par(mfrow=c(1,2))
plot(X[1,],type='l',ylim=c(0,xmax))
for (i in 2:n) {
  lines(X[i,])
}

plot(X_r[1,],type='l',ylim=c(0,xmax))
for (i in 2:n) {
  lines(X_r[i,])
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

#How many survive in
#1) when accounting for the probability of survival
#2) when accounting for accumulative reproduction
#3) when accounting for Random Choices
sum(X[,tmax]>xc)
sum(X_r[,tmax]>xc)
sum(R[,tmax]>xc)


