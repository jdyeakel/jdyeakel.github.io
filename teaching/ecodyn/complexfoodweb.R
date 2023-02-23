# First define number of species
S = 100;
# And the connectance
C = 0.04
# And the interaction variability
sigma = 1

#Build a SxS empty matrix
J = matrix(0,S,S)

#Now with probability C, draw a random number from a normal distribution with mean 0 and stdev = sigma
#With probability 1-C, the interaction is zero

for (i in 1:S) {
  for (j in 1:S) {
    #draw random value from uniform
    rv = runif(1,0,1)
    #An interaction occurs:
    if (rv < C) {
      int_value = rnorm(1,0,sigma)
      J[i,j] = int_value
    }
    #An interaction DOESNT occur
    if (rv > C) {
      J[i,j] = 0
    }
  }
}

sum(J != 0)/S^2

#Set diagonal = -1
for (i in 1:S) {
  for (j in 1:S) {
    if (i == j) {
      J[i,j] = -1
    }
  }
}

#see the matrix
# image(J,col=c(heat.colors(20)))
#Calculate eigenvalues
e = eigen(J)
# rmin = min(Re(e$value))
# rmax= max(Re(e$value))
# imin = min(Im(e$value))
# imax= max(Im(e$value))

plot(Re(e$value),Im(e$value),xlab="Real part",ylab="Imaginary Part",xlim=c(-10,10),ylim=c(-10,10),pch=16)
lines(rep(0,41),seq(-20,20))
lines(seq(-20,20),rep(0,41))


#Vary S or C and calculate the probability of stability

Cvec = seq(0.001,0.02,0.0001)
reps = 10
stable = matrix(0,length(Cvec),reps)

for (c in 1:length(Cvec)) {
  for (r in 1:reps) {
    # First define number of species
    S = 100;
    # And the connectance
    C = Cvec[c]
    # And the interaction variability
    sigma = 1

    #Build a SxS empty matrix
    J = matrix(0,S,S)

    #Now with probability C, draw a random number from a normal distribution with mean 0 and stdev = sigma
    #With probability 1-C, the interaction is zero

    for (i in 1:S) {
      for (j in 1:S) {
        #draw random value from uniform
        rv = runif(1,0,1)
        #An interaction occurs:
        if (rv < C) {
          int_value = rnorm(1,0,sigma)
          J[i,j] = int_value
        }
        #An interaction DOESNT occur
        if (rv > C) {
          J[i,j] = 0
        }
      }
    }

    #Set diagonal = -1
    for (i in 1:S) {
      for (j in 1:S) {
        if (i == j) {
          J[i,j] = -1
        }
      }
    }

    #see the matrix
    # image(J,col=c(heat.colors(20)))
    #Calculate eigenvalues
    e = eigen(J)
    if (any(Re(e$value) > 0)) {
      stable[c,r] = 0
    } else {
      stable[c,r] = 1
    }

  }


}

plot(Cvec,apply(stable,1,sum)/reps)




#Build a food web from the niche model
#Import the niche model function
#You will need to modify the file path for the location of the file on your own computer
source("~/Dropbox/jdyeakel.github.io/teaching/ecodyn/nichemodel_function.R")

S = 100
C= 0.02
beta = (1/(C)) - 1
sigma = 1
Cmatrix = nichemodel_function(S,beta);
c = sum(Cmatrix)/S^2
#Plot prey distribution
# hist(apply(Cmatrix,1,sum),col="gray")

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

sum(J != 0)/S^2

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
      int_value_rev = -abs(rnorm(1,0,sigma))
      # int_value_rev = rnorm(1,-int_value,sigma)
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
