# First define number of species
S = 100;
# And the connectance
C = 0.001
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
  J[i,i] = -1
}

#see the matrix
# image(J,col=c(heat.colors(20)))
#Calculate eigenvalues
e = eigen(J)
plot(Re(e$value),Im(e$value),xlab="Real part",ylab="Imaginary Part",xlim=c(-10,10),ylim=c(-10,10),pch=16)
lines(rep(0,41),seq(-20,20))
lines(seq(-20,20),rep(0,41))


#Build a food web from the niche model
#Import the niche model function
#You will need to modify the file path for the location of the file on your own computer
source("~/Dropbox/jdyeakel.github.io/teaching/ecodyn/nichemodel_function.R")

S = 1000
beta = 30
sigma = 0.8
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
