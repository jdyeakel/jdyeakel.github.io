# Declare variables
tmax <- 200;
# Critical energetic reserves
xmax <- 30;
xc <- 3;

# Declare patch-specific values for patch/activity i = 1, 2, 3
# Cost
c = c(1,1,1);
# MEAN reward
p = c(0,3,5);
# Prob(death)
d = c(0.0,0.004,0.02);


#Number of activities/patches
np <- length(d);

# Define survival matrix and Decision matrix
S = matrix(0,xmax,tmax);
D = matrix(0,xmax,tmax-1);

# Define the Terminal Survival Function
# S(x,t=tmax) = 0 for x<= xc and S(x,t=tmax) = 1 for x > xc
xbar <- 4;
for (x in 1:xmax) {
  if (x <= xc) {
    S[x,tmax] <- 0;
  } else {
    # S[x,tmax] <- 1;
    S[x,tmax] <- (x - xc)/(x-xc+xbar);
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

#The probability of different rewards per patch
Mmax = 15;
pmatrix = matrix(0,Mmax+1,np);
for (i in 1:np) {
  for (m in 1:(Mmax+1)) {
    M=m-1;
    pmatrix[m,i] = dpois(M,p[i]);
  }
}
#Normalize to the cutoff Mmax
totals = apply(pmatrix,2,sum)
for (i in 1:np) {
  pmatrix[,i] = pmatrix[,i]/totals[i]
}
plot(pmatrix[,1],xlim=c(0,15),type='l')
lines(pmatrix[,2],col='blue')
lines(pmatrix[,3],col='green')

# Begin backwards calculations Note that the t index is altered by -1
for (t in seq(tmax-1,1,-1)) {
  
  #Evaluate the survival-maximizing activity/patch for each energetic value
  for (x in (xc+1):xmax) {
    
    value <- numeric(np);
    #Calculate the survival probability for each patch
    for (i in 1:np) {
      
      value_m <- numeric(Mmax+1);
      
      xp = numeric(Mmax+1);
      
      #Cycle through different possible gain values (M)
      for (m in 1:(Mmax+1)) {
        M = m-1;
        # what is x if you find food
        xp[m] <- x - c[i] + M;
        
        #Boundary conditions!
        xp[m] <- bc(xp[m]);
        
        #Calculate the survival probability given the probability of M gain
        value_m[m] <- (1-d[i])*pmatrix[m,i]*S[xp[m],t+1];
      }
      
      value[i] = sum(value_m);
      
    }
    #Now that the values are calculate, which is the largest?
    maxvalue <- max(value);
    #which activity/patch maximizes survival?
    istar <- which(value==maxvalue);
    
    #Now fill in the survival probabilities and decision matrix:
    S[x,t] <- maxvalue;
    D[x,t] <- istar;
    
  }
  
}




#Individual Monte Carlo simulation with fitness-maximizing decision choices


#initalize vectors

n = 100;
X = matrix(0,n,tmax);
R = matrix(0,n,tmax);
#Initial state
X[,1] = xmax;
R[,1] = xmax;


for (t in 1:(tmax-1)) {
  for (i in 1:n) {
    
    state = X[i,t];
    
    rstate = R[i,t];
    
    #Only go through this if the individual is still alive
    if (state > xc) {
      
      #which activity do I choose?
      dec = D[state,t];
      # dec = sample(c(1,2,3),1);
      
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

plot(X[1,],type='l',ylim=c(0,10))
for (i in 2:n) {
  lines(X[i,])
}

# Individual Monte Carlo simulations with RANDOM activity choices

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

plot(R[1,],type='l',ylim=c(0,10))
for (i in 2:n) {
  lines(R[i,])
}
