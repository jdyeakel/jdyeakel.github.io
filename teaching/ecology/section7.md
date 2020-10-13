---
layout: pagetrimnobio
title: "Section 7 :: Population growth"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

[< Back to Course Page]({{ site.url }}/teaching/ecology)  
<br>

## Changes in population size over time

Over the course of the last two sections, we have focused our discussion on *fitness*. How do individual behaviors influence its *success* in an evolutionary context. But what does success mean? In the terms we have discussed, success is a combination of being able to survive long enough to pass down your genetic material into the next generation, and to ensure that the next generation has what they need to survive themselves. And as we have learned, organisms do this in a variety of ways... they can invest a lot of energy into a few offspring, or they can invest a little energy into a lot of offspring. They can scatter their reproductive events over the course of their lives, or they can wait until the end of their lives to invest in reproduction.

Now let's take this a step further, and examine how these different strategies influence not an individual, but a collective of individuals, which we call a *population*. A population is a collection of individuals that interact and reproduce with each other more-so than they might do with other nearby populations. We will eventually discuss *metapopulations*, where multiple populations are linked together by migration, but for now we will focus our efforts on a single population of a single species.

How do populations change through time? Without the complexities of immigration and emigration, we simply note that populations increase by reproduction (+ Births) and decrease by mortality (- Deaths). So we can write

$$
\begin{equation}
N(t+1) = N(t) + B - D
\end{equation}
$$

where B is the total number of births that occur within the time-step $$(t+1) - t$$ and D is the total number of deaths in that same timestep. As we will explore, the size of the timestep matters. Take 1000 humans... if our timestep is one hour, very few (likley zero) of those individuals will have reproduced or died within that span. If our timestep is one year, it is more likely that some will have given birth, and some will have died. We can generalize the *size* of the timestep by $$\Delta t$$ to not that in some temporal window, births and deaths occur:


$$
\begin{align}
N(t+\Delta t) &= N(t) + (B - D)\Delta t \\
N(t + \Delta t) - N(t) &= (B - D)\Delta t
\end{align}
$$

This means something *slightly* different. We are saying that $$B$$ and $$D$$ represent the total births and total deaths *per unit time*. So if $$B$$ $$D$$ represent total births and total deaths per day, then the size of our temporal window $$\Delta t$$ will increase or decrease the total number of births and deaths with respect to the size of the window. If $$\Delta t$$ is 30 days, then the total number of births and deaths represent those expected within a month given the daily rates of $$B$$ and $$D$$. The second line is simply an algebraic manipulation of the first line, showing that within the temporal window $$\Delta t$$ the change in that population over that time is equal to the total births minus total deaths. 

Now the question is: should we always expect the same number of births and deaths for a given time window? I hope you say *no*, because that's the correct answer. Imagine our current population is 10... or imagine it is 10000000. We would expect a different total number of births and deaths, and we would expect this to change as a function of the population size. In this way we can describe the total number of births and deaths as being *density-dependent*. A simple assumption would be that births and deaths increase linearly with the size of the population. So $$B = bN(t)$$ and $$D = dN(t)$$. Notice that these are both straight lines with a *y-intercept* of zero (makes sense... if there are no individuals in the population there are no births or deaths!). Here, $$b$$ is the *per capita birth rate*, and $$d$$ is the *per-capita death rate*. We can then rewrite

$$
\begin{align}
\frac{N(t + \Delta t) - N(t)}{\Delta t}  &= bN(t) - dN(t) \\ \\
\frac{N(t + \Delta t) - N(t)}{\Delta t}  &= (b - d)N(t) \\ \\
\frac{N(t + \Delta t) - N(t)}{\Delta t} &=  r_d N(t)
\end{align}
$$

where we have defined a new parameter $$r_d = b-d$$, which is the *average per-capita growth rate* of the population.
The subscript $${}_d$$ reminds us that this is a growth rate specifically for populations that change over *discrete* rather than *continuous* intervals.
Notice we have also divided both sides by $$\Delta t$$, which will help with the next step. Before we move on, let's examine the current equation for population growth

```R
    discrete.growth = function(N0,tmax,Deltat,b,d) {
        pop = numeric(tmax)
        pop[1] = N0
        for (t in 2:(tmax)) {
            N = pop[t-1]
            NewN = N + Deltat*(b-d)*N
            pop[t] = NewN
        }
        plot(pop,xlab='Time Steps',ylab='Population Size',type='b',pch=16)
    }
    discrete.growth(N0 = 5,tmax = 20, Deltat = 1, b = 0.8, d = 0.7)
```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20code%20here' frameborder='0'></iframe>


> ### Discussion
> 1. Experiment with the above parameter values. What happens when you change $$b$$ to be greater, less-than, or equal to $$d$$? Describe in words what is happening in each scenario.
> 2. Compare results for small versus large time windows `Deltat`
> 3. What is the shape of the population over time when we expand the amount of time over which we observe the population? e.g. try `tmax = 100`
> 4. Given $$\Delta t = 1$$, what is the proportional change in population size? How would you calculate this? Hint: you don't need to the code black to do this... Look to the last equation before the code block.


## Discrete to Continuous time
As we will (or have) discuss(ed) in class, if we make the time window infinitesimally small, we can write

$$
\begin{equation}
\frac{\rm d}{\rm dt}N = rN
\end{equation}
$$

A few things to note here... first is that the right-hand-side (RHS) of the equation looks a lot like the discrete time version. However, we now are using $$r$$ instead of $$r_d$$ to denote the population growth rate. This is because our interpretation of these parameters is a bit different. Here $$r$$ is the *instantaneous rate of growth* of the population. To put this equation into words, we would say: *the change in the population over time is equal to rN, where r is the instantaneous rate of growth and N is the size of the population.*

You can use ***CALCULUS*** to solve this equation. Ha! - did the bold-faced and over-emphasized ***CALCULUS*** send shivers down your spine? Don't worry matey... we won't need calculus in this course. I'm not sure why I've lapsed into pirate lingo - maybe because I'm writing this in my backyard as my daughter plays with a pirate skeleton we bought for Halloween. *Anywho* - we can use calculus to solve the above equation for the population size at any point in time $$N(t)$$. We won't go through *how* to do this, but the solution is

$$
\begin{equation}
N(t) = N_0 {\rm e}^{rt}
\end{equation}
$$

> ### Discussion
> 1. Sketch your expectation for what $$N(t)$$ as a function of time $$t$$ should look like according to the above equation. Do you think it looks similar to or different than the discrete-time version?
> 2. 
