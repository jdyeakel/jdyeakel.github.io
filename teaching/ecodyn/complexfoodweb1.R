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

