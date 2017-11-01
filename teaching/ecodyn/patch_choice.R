# Declare variables
tmax <- 50;
# Critical energetic reserves
xmax <- 50;
xc <- 3;




# Declare patch-specific values for patch/activity i = 1, 2, 3
# Cost
c = c(1,1,1);
# Reward
p = c(0,3,5);
# Prob(death)
d = c(0.0,0.004,0.02);
# Prob(find food)
f = c(1,0.4,0.6);

#Number of activities/patches
np <- length(f);

# Define survival matrix and Decision matrix
S = matrix(0,xmax,tmax);
D = matrix(0,xmax,tmax-1);

# Define the Terminal Survival Function
# S(x,t=tmax) = 0 for x<= xc and S(x,t=tmax) = 1 for x > xc
for (x in 1:xmax) {
  if (x <= xc) {
    S[x,tmax] <- 0;
  } else {
    S[x,tmax] <- 1;
    # S[x,tmax] <- 1 - (40/exp(x));
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

# Begin backwards calculations Note that the t index is altered by -1
for (t in seq(tmax-1,1,-1)) {
  
  #Evaluate the survival-maximizing activity/patch for each energetic value
  for (x in (xc+1):xmax) {
    
    value <- numeric(np);
    #Calculate the survival probability for each patch
    for (i in 1:np) {
      
      # what is x if you find food
      xp <- x - c[i] + p[i];
      # what is x if you don't find food
      xpp <- x - c[i];
      
      #Boundary conditions!
      xp <- bc(xp);
      xpp <- bc(xpp);
      
      #Calculate the survival probability
      value[i] <- (1-d[i])*f[i]*S[xp,t+1] + (1-d[i])*(1-f[i])*S[xpp,t+1];
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
