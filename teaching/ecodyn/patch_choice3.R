tmax <- 100;

xc <- 3;

xmax <- 50;

#cost
c = c(1,1,1);
p = c(0,3,5);
f = c(1,0.4,0.6);
d = c(0,0.004,0.02);

np = length(c);

S = matrix(0,xmax,tmax);
D = matrix(0,xmax,tmax);

for (x in 1:xmax) {
  if (x <= xc) {
    S[x,tmax] <- 0;
  } else {
    # S[x,tmax] <- 1;
    S[x,tmax] <- 1;
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
    
    for (i in 1:np) {
      
      # what is x if you find food?
      xp <- x - c[i] + p[i];
      
      # what is x if you don't find food?
      xpp <- x - c[i];
      
      xp <- bc(xp);
      
      xpp <- bc(xpp);
      
      value[i] <- (1-d[i])*f[i]*S[xp,t+1] + (1-d[i])*(1-f[i])*S[xpp,t+1];
      
    } # end i loop
    
    maxvalue <- max(value);
    istar <- which(value == maxvalue);
    
    S[x,t] <- maxvalue;
    D[x,t] <- istar;
    
  }
  
  
}

