##############################################
# THE NICHE MODEL (Williams & Martinez 2000)
##############################################

nichemodel_function = function(S,b) {

#How many species?
S = S;

#Build a list of random niche values between zero and one
n = runif(S,0,1);
#Now just sort the species, so that species 1 has lowest n, and species S has highest n
n = sort(n)

#Define beta distribution parameters
a=1;
b=beta;

#What is the range of each species?
r = numeric(S);
for (i in 1:S) {
  x = rbeta(1,a,b);
  r[i] = n[i]*x;
}

#Plot the prey range vs. niche value of each species
plot(n,r,xlab='Niche Value',ylab='Diet range')

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
  p_i = which(prey[[i]]==i)
  #Remove it from the list o prey
  prey[[i]][-p_i];
  numprey[i] = length(prey[[i]])
  
}
#Plot number of prey as a function of niche value
plot(n,numprey)
#Histogram of number of prey
hist(numprey)

adj_matrix = matrix(0,S,S)
for (i in 1:S) {
  ones_vec = prey[[i]]
  adj_matrix[i,ones_vec] = 1;
  adj_matrix[ones_vec,i] = 1;
}

return(adj_matrix)
}
