---
layout: pagetrimnobio
title: "Section 4 :: Evolution and data"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

[< Back to Course Page]({{ site.url }}/teaching/ecology)  
<br>

Natural selection is the process by which different traits are selected *for* or *against* over time. Traits that benefit the organism's fitness are selected for, and traits that reduce the organism's fitness are selected against. ***Fitness is defined by an individual's ability to survive and reproduce.*** Individuals with traits that either benefit its ability to survive or produce viable offspring have greater fitness. Over generational timescales, it is the individuals with these traits that become more plentiful in a population. Evolution is defined by the change in trait distributions over this generational time-span. Importantly, natural selection is something that occurs at the *individual-level*; because evolution is defined with respect to changing trait distributions, it is something that occurs at the *population-level*.

> ### Evolution of a particular trait within a population requires  
> 1. Heritability (the trait is passed from parents to offspring)  
> 2. Variability in the population (different individuals have different trait values)  
> 3. That different traits are linked to fitness differences

A *trait* can be any measurable characteristic of an individual... from anatomical or physiological characteristics such as body size or femur:tibia length ratios to the frequency of a particular behavior such as a mating vocalization. If the trait fulfills the above conditions, it is subject to selection and can evolve over time.

## Trait Distributions

If the trait is measured as a continuous variable (say height, length, or mass), it is often normally distributed within a population. That is, the frequencies of different trait values among individuals in the population follows a normal (or Gaussian) distribution. These types of distributions can be described by two statistics: the mean and the standard deviation. 

Iris Data...

<figure>
<img src="{{ site.url }}/images/ecology/sepal.jpg" width="700">
<figcaption> Left: a spherical animal with radius \( r \). Right: a sperical animal with radius \( 2r \) .
</figcaption>
</figure>

```R

    # Peter and Rosemary Grant data set
    library(Sleuth3)

    year = ex0218$Year
    depth = ex0218$Depth

    depth_1976 = depth[which(year==1976)]
    depth_1978 = depth[which(year==1978)]

    hist(depth_1976,xlim=c(5,15),probability=TRUE,ylim=c(0,1),breaks=20,col='black',xlab='Beak depth',main='Beak depth 1976-1978',ylab='Proportion of individuals sampled')
    hist(depth_1978,add=TRUE,probability=TRUE,col='gray',breaks=20)
    legend(6,0.8,c('1976','1978'),pch=15,col=c('black','gray'))

```



## Selection over time


## Different types of selection
Directional, stabilizing, disruptive


## The effects of trophy hunting over time


## ?

