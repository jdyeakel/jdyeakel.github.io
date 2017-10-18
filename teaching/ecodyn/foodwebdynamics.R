#Build a food web from the niche model
#Import the niche model function
source("~/Dropbox/jdyeakel.github.io/teaching/ecodyn/nichemodel_function.R")

S = 100
beta = 30
Cmatrix = nichemodel_function(S,beta);
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
beta = 20
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
DeltaPSW = numeric(S);

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
