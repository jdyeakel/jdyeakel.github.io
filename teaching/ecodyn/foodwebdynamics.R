#Build a food web from the niche model
#Import the niche model function
#You will need to modify the file path for the location of the file on your own computer
# source("~/Dropbox/jdyeakel.github.io/teaching/ecodyn/nichemodel_function.R")
nichemodel_function = function(S,C) {
  #How many species?
  S = S;
  #Build a list of random niche values between zero and one
  n = runif(S,0,1);
  #Now just sort the species, so that species 1 has lowest n, and species S has highest n
  n = sort(n)
  #Define beta distribution parameters
  a=1;
  b=((1/(2*C)) - 1);
  #What is the range of each species?
  r = numeric(S);
  for (i in 1:S) {
    x = rbeta(1,a,b);
    r[i] = n[i]*x;
  }
  #Plot the prey range vs. niche value of each species
  # plot(n,r,xlab='Niche Value',ylab='Diet range')
  #What is the center of the range for each consumer?
  c = numeric(S);
  for (i in 1:S) {
    c[i] = runif(1,r[i]/2,n[i]);
  }
  #Now determine which prey each consumer eats
  prey = list(S)
  numprey = numeric(S)
  for (i in 1:S) {
    #Niche range for consumer i
    nmin = c[i] - (r[i]/2);
    nmax = c[i] + (r[i]/2);
    #Find species greater than niche min
    prey1 = which(n>nmin);
    #Find species lower than niche max
    prey2 = which(n<nmax);
    #The prey are those that are in both lists!
    prey[[i]] = intersect(prey1,prey2);
    #find ith species (focal species)
    # p_i = which(prey[[i]]==i)
    # #Remove it from the list o prey
    # prey[[i]][-p_i];
    numprey[i] = length(prey[[i]])
  }
  #Plot number of prey as a function of niche value
  # plot(n,numprey)
  # #Histogram of number of prey
  # hist(numprey)
  adj_matrix = matrix(0,S,S)
  for (i in 1:S) {
    ones_vec = prey[[i]]
    adj_matrix[i,ones_vec] = 1;
    # adj_matrix[ones_vec,i] = 1;
  }
  return(adj_matrix)
}

S = 100
C = 0.1
Cmatrix = nichemodel_function(S,C);
c = sum(Cmatrix)/S
#Plot prey distribution
hist(apply(Cmatrix,1,sum),col="gray")

#Build a SxS empty matrix
J = matrix(0,S,S)


for (i in 1:S) {
  for (j in 1:S) {
    #An interaction occurs:
    if (Cmatrix[i,j] == 1) {
      int_value = rnorm(1,0,sigma)
      int_value_rev = rnorm(1,0,sigma)
      J[i,j] = int_value
      J[j,i] = int_value_rev
    }
  }
}
#Set diagonal = -1
for (i in 1:S) {
  J[i,i] = -1
}


#see the matrix
# image(J,col=c(heat.colors(20)))
#Calculate eigenvalues
e = eigen(J)
plot(Re(e$value),Im(e$value),xlab="Real part",ylab="Imaginary Part",xlim=c(-10,10),ylim=c(-10,10))
lines(rep(0,41),seq(-20,20))
lines(seq(-20,20),rep(0,41))



#####################################################
#What if they are specifically pred-prey interactions?


for (i in 1:S) {
  for (j in 1:S) {
    #An interaction occurs:
    if (Cmatrix[i,j] == 1) {
      int_value = abs(rnorm(1,0,sigma))
      # int_value_rev = -abs(rnorm(1,0,sigma))
      int_value_rev = rnorm(1,-int_value,sigma)
      J[i,j] = int_value
      J[j,i] = int_value_rev
    }
  }
}
#Set diagonal = -1
for (i in 1:S) {
  J[i,i] = -1
}


#see the matrix
# image(J,col=c(heat.colors(20)))
#Calculate eigenvalues
e = eigen(J)
plot(Re(e$value),Im(e$value),xlab="Real part",ylab="Imaginary Part",xlim=c(-10,10),ylim=c(-10,10))
lines(rep(0,41),seq(-20,20))
lines(seq(-20,20),rep(0,41))



#For a given food web, let's analyze the PROPORTION OF STABLE WEBS

S = 100
C = 0.015
sigma = 0.85
Cmatrix = nichemodel_function(S,beta);
c = sum(Cmatrix)/S
#Plot prey distribution
hist(apply(Cmatrix,1,sum),col="gray")


#Repetitions
reps = 10
de = numeric(reps)

for (r in 1:reps) {
  
  #Build a SxS empty matrix
  J = matrix(0,S,S)


  for (i in 1:S) {
    for (j in 1:S) {
      #An interaction occurs:
      if (Cmatrix[i,j] == 1) {
        # int_value = rnorm(1,0,sigma)
        # int_value_rev = rnorm(1,0,sigma)
        
        int_value = abs(rnorm(1,0,sigma))
        int_value_rev = rnorm(1,-int_value,sigma)
        J[i,j] = int_value
        J[j,i] = int_value_rev
      }
    }
  }
  #Set diagonal = -1
  for (i in 1:S) {
    J[i,i] = -1
  }


  #see the matrix
  # image(J,col=c(heat.colors(20)))
  #Calculate eigenvalues
  e = eigen(J)
  
  #what is the DOMINANT EIGENVALUE?
  de[r] = max(Re(e$value))
  
}

PSW_full = length(which(de<0))/reps

# How do we test species-specific influences on stability?
# We could march through the Jacobian, remove a species (row & column), and record influence on the eigenvalue distribution


#First build a Jacobian...
S = 100
C = 0.1
sigma = 0.2
Cmatrix = nichemodel_function(S,C);
c = sum(Cmatrix)/S
#Plot prey distribution
hist(apply(Cmatrix,1,sum),col="gray")

#Build a SxS empty matrix
J = matrix(0,S,S)


for (i in 1:S) {
  for (j in 1:S) {
    #An interaction occurs:
    if (Cmatrix[i,j] == 1) {
      int_value = rnorm(1,0,sigma)
      int_value_rev = rnorm(1,0,sigma)
      J[i,j] = int_value
      J[j,i] = int_value_rev
    }
  }
}
#Set diagonal = -1
for (i in 1:S) {
  J[i,i] = -1
}
e = eigen(J)
#what is the DOMINANT EIGENVALUE?
de = max(Re(e$value))

#Now test effect on each species
# Deltaeigen = numeric(S);
de_ext = numeric(S);
for (s in 1:S) {
  # nS = S-1
  
  #Eliminate the species s!
  J_ext = J;
  J_ext = J_ext[-s,];
  J_ext = J_ext[,-s];
  e_ext = eigen(J_ext)
  #what is the DOMINANT EIGENVALUE?
  de_ext[s] = max(Re(e_ext$value))
  
  # Deltaeigen[s] = de_ext[s] - de;
}

plot(de_ext)
lines(seq(1,S),rep(de,S),lty=2)

stabilizingspecies = which(de_ext<0)

par(mfrow=c(1,2))
image(Cmatrix)
for (i in 1:length(stabilizingspecies)) {
  lines((rep(stabilizingspecies[i],10)/S)+(1/(2*S)),seq(0,1,length.out=10))
  lines(seq(0,1,length.out=10),(rep(stabilizingspecies[i],10)/S)+(1/(2*S)))
}
points(rep(0.1,length(stabilizingspecies)),stabilizingspecies,pch=16,cex=2)
image(J)


barplot(DeltaPSW)
































for (s in 1:S) {
  nS = S-1
  
  #Eliminate the species s!
  Cmatrix_ext = Cmatrix[-s,];
  Cmatrix_ext = Cmatrix[,-s];
  
  de = numeric(reps)
  for (r in 1:reps) {
    #Build a SxS empty matrix
    J = matrix(0,nS,nS)
    
    for (i in 1:nS) {
      for (j in 1:nS) {
        #An interaction occurs:
        if (Cmatrix_ext[i,j] == 1) {
          # int_value = rnorm(1,0,sigma)
          # int_value_rev = rnorm(1,0,sigma)
          
          int_value = abs(rnorm(1,0,sigma))
          int_value_rev = rnorm(1,-int_value,sigma)
          J[i,j] = int_value
          J[j,i] = int_value_rev
        }
      }
    }
    
    
    #Set diagonal = -1
    for (i in 1:nS) {
      J[i,i] = -1
    }
    
    #see the matrix
    # image(J,col=c(heat.colors(20)))
    #Calculate eigenvalues
    e = eigen(J)
    
    #what is the DOMINANT EIGENVALUE?
    de[r] = max(Re(e$value))
  }
  PSW = length(which(de<0))/reps
  DeltaPSW[s] = PSW_full - PSW
}

barplot(DeltaPSW)
