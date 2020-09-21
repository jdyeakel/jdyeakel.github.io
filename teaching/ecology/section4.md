---
layout: pagetrimnobio
title: "Section 4 :: Evolution and data"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

[< Back to Course Page]({{ site.url }}/teaching/ecology)  
<br>

Natural selection is the process by which different traits exhibited by individuals within a population are selected *for* or *against* over time. Traits that benefit the individual's fitness are selected for, and traits that reduce the individual's fitness are selected against. ***Fitness is defined by an individual's ability to survive and reproduce.*** Individuals with traits that either benefit its ability to survive or produce viable offspring have greater fitness compared to those with lesser abilities within a given environment. Over generational timescales, it is the individuals with these *fitness-maximizing* traits that become more plentiful in the population. Evolution is defined by the change in trait distributions over this generational time-span. Importantly, natural selection is something that occurs at the *individual-level*; because evolution is defined with respect to changing trait distributions, it is something that occurs at the *population-level*.

> ### Evolution of a particular trait within a population requires  
> 1. Heritability (the trait is passed from parents to offspring)  
> 2. Variability in the population (different individuals have different trait values)  
> 3. That different trait values are linked to fitness differences

A *trait* can be any measurable characteristic of an individual... from anatomical or physiological characteristics such as body size or femur:tibia length ratios to the frequency of a particular behavior such as a mating vocalization. If the trait fulfills the above conditions, it is subject to selection and can evolve over time.

## Trait Distributions

If the trait is measured as a continuous variable (say height, length, or mass), it is often normally distributed within a population. That is, the frequencies of different trait values among individuals in the population follows a normal (or Gaussian) distribution. These types of distributions can be described by two statistics: the mean and the standard deviation. 

<figure>
<img src="{{ site.url }}/images/ecology/dist.jpg" width="700">
<figcaption> Frequency distribution of traits among indidviduals in a population. The **mean** is a statistic that describes the *central tendancy* of the distribution. The **standard deviation** is a statistic that describes the amount of variability of traits about the mean. Recall that it is this variability that fuels the selective process. Without variability there is nothing to select from.
</figcaption>
</figure>

Let's look at one of the most famous examples of natural selection that we have observed in the wild, which was documented within a population of finches on a small island in the Galapagos Archipelago.

<figure>
<img src="{{ site.url }}/images/ecology/galapagos.jpg" width="700">
<figcaption> The Galapagos islands, off the coast of Equador.
</figcaption>
</figure>

<figure>
<img src="{{ site.url }}/images/ecology/daphne.jpg" width="700">
<figcaption> Daphne Major is a barren and nearly treeless landscape.
</figcaption>
</figure>

> ***In the 1970s-80s, biologists Peter and Rosemary Grant caught and measured birds from more than 20 generations of finches on the Galapagos island of Daphne Major. In one of those years, 1977, a severe drought caused vegetation to wither, and the only remaining food source were large, tough, drought-resistant seeds, which the finches ordinarily ignored. Were the birds with larger and stronger beaks for opening these tough seeds more likely to survive that year, and did they tend to pass this characteristic to their offspring? The data are beak depths (height of the beak at its base) of 751 finches caught the year before the drought (1976) and 89 finches captured the year after the drought (1978). -Statistical Sleuth (3rd edition)***

Let's now look at the beak width data collected by Rosemary and Peter Grant on the 1976 and 1978 expedition. We will plot the frequencies of beak depth across individuals in population measured during 1976 and 1978. We will use the `hist()` function in `R`, which plots the frequency distribution. Because the number of individuals sampled in 1976 is very different (751 individuals in 1976 and 89 individuals in 1978), we have scaled the y-axis so that we are looking at the *proportion* of individuals with different trait values (this means the y-axis will range from $$ 0 \leftrightarrow 1 $$).


<figure>
<img src="{{ site.url }}/images/ecology/beakdepth.jpg" width="700">
<figcaption> Galapagos finch beak measurements from the Peter & Rosemary Grant expedition.
</figcaption>
</figure>

```R
    # We first import the Peter and Rosemary Grant data set
    library(Sleuth3)

    # Define the years as a vector
    year = ex0218$Year
    # Define the depth measures as a vector
    depth = ex0218$Depth

    # Select those measures taken in 1976
    depth_1976 = depth[which(year==1976)]

    # Select those measures taken in 1978
    depth_1978 = depth[which(year==1978)]

    # Histogram of 1976 measures (Black)
    hist(depth_1976,xlim=c(5,15),probability=TRUE,ylim=c(0,1),breaks=20,col='black',xlab='Beak depth',main='Beak depth 1976-1978',ylab='Proportion of individuals sampled')

    # Add on top histogram of 1978 measures (Gray)
    hist(depth_1978,add=TRUE,probability=TRUE,col='gray',breaks=20)

    # Legend to remind us which years the colors represent
    legend(6,0.8,c('1976','1978'),pch=15,col=c('black','gray'))

```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20code%20here' frameborder='0'></iframe>




> ### Discussion
> 1. Use the `mean()` and `sd()` functions to calculate the mean and standard deviation of depth measurements from 1976 (`depth_1976`) and 1978 (`depth_1978`). How does the mean and standard deviation change over time?  
> 2. As mentioned above, there is a large difference in the number of individuals sampled from 1976 to 1978. Why? Can we say something about the traits of the individuals who *weren't* sampled in 1978? In other words, which finches were selected against and why? 
> 3. Was this selection event caused directly or indirectly by the drought?


## Selection over time

```R
reps = 100
for (r in 1:reps) {
    N = 100
    x = rnorm(N,0.5,0.1)
    tmax = 20
    popsize = numeric(tmax)
    meantrait = numeric(tmax)
    for (t in 1:tmax) {
        if (N <= 0) {
            break()
        }
        # Reproduction
        # Roll a weighted dice
        # larger values of trait x produce more offspring
        offspring = round(runif(length(x))*x*5,0)
        
        # Assume that offspring have same trait as parents +/- some mutation
        for (i in 1:length(offspring)) {
            newx = rnorm(offspring[i],x/5,0.1)
            x = c(x,newx)
        }
        
        # Mortality
        # Roll a weighted dice
        # smaller values of trait x increase mortality
        prob_mort = rep(0.2,length(x)) #exp(-(2*x))
        d = which(runif(length(x),0,1) < prob_mort)

        # Remove dead individual traits
        x = x[-d]

        # How many are left?
        N = length(x)
        popsize[t] = N
        meantrait[t] = mean(x)
        # print(t)
    }
    if (r == 1) {
        plot(meantrait,type='l',lwd=2,ylim=c(0,1),col='#00000050')
    } else {
        lines(meantrait,lwd=2,col='#00000050')
    }
}
```



## Different types of selection
Directional, stabilizing, disruptive


## The effects of trophy hunting over time


## ?

