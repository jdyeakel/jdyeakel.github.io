---
layout: pagetrimnobio
title: "Section 7 :: Discrete population growth"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

[< Back to Course Page]({{ site.url }}/teaching/ecology)  
<br>

We have been exploring the continuous-time dynamics of populations, however there are many species for whom discrete-time dynamics make more sense. For example, if reproduction or mortality (or perhaps other large life-history events such as migration) occur at very particular periods of the year, likely driven by seasonal variation of environmental conditions, then birth and death processes should be expected to occur in discrete intervals of time. This means that the application of *instantaneous growth rates* are inappropriate and unlikely to result in the same predictions of population change over time.

Let us first reformulate our discrete approach to population dynamics from our continuous-time understanding (the opposite of what we did in Section 7). Consider exponential population growth in continuous time

$$
\begin{equation}
\frac{\rm d}{\rm dt}N = rN
\end{equation}
$$

where $$r$$ is the instantaneous growth rate. As we have discussed, this equation has a solution for the population size at any time step $$N(t)$$ of the form

$$
\begin{equation}
N(t) = N_0 {\rm e}^{rt}.
\end{equation}
$$

Let's try to decouple the time-step size in the first equation with the goal of turning it into a discrete process. First, we should define $${\rm d}/{\rm dt}$$...

$$
\begin{equation}
\frac{\rm d}{\rm dt}N = \lim_{\Delta t \to 0}\frac{N(t + \Delta t) - N(t)}{\Delta t} = r N(t)
\end{equation}
$$

where the $$\lim$$ notation means that we are evaluating the function at the limit of $$\Delta t \rightarrow 0$$ (this is a foundational concept in Calculus... it means we are assuming the size of the time step is really really really small). Now let's imagine that $$\Delta t $$ is *not* really really really small... in fact, it is quite large. Because it is large, it's significance is important, and we will multiply it to both sides of the equation to obtain

$$
\begin{equation}
N(t + \Delta t) - N(t) = r \Delta t N(t)
\end{equation}
$$

Let's stop here for a moment and discuss *units*. Units allow us to tie biological reality to these seemingly abstract equations. The units that we are currently dealing with are of three flavors. The population size $$N$$ is in units of $$[individuals]$$ (or perhaps density which is $$[individuals/area]$$ or $$[individuals/volume]$$ if we are in aquatic settings), $$t$$ is in units of $$[time]$$ (though we need to specify what temporal units we are talking about... seconds, minutes, hours, etc), and $$r$$ is a *rate* and is in units of $$[1/time]$$. 

Let's consider a population of wildebeest with a $$r = 0.016~{\rm month}^{-1}$$. This means that - on average - each individual in the population produces 0.016 individuals per month (remember... this accounts for both births and deaths).

> ### Discussion
> 1. What is $$r$$ if the units are $$[1/year]$$?
> 2. Assuming continuous population dynamics, what is the doubling time for this population in terms of months? In terms of years? In terms of centuries?

Remember how to change units! We can use a helpful method that is commonly employed in chemistry. We write out the unit conversions in sequence, ensure that each cancels the other out, resulting in the unit conversion we want. Say we have a rate $$r_y$$ that is in $$[1/year]$$ and we want to convert it to $$[1/second]$$. We would use the following formula

$$
\begin{align}
\frac{1}{second}&=\frac{1}{year}\cdot\frac{year}{month}\cdot\frac{month}{day}\cdot\frac{day}{hour}\cdot\frac{hour}{minute}\cdot\frac{minute}{second} \\ \\
&{\rm (see~how~the~units~cancel~out?)} \\ \\
\frac{1}{second} &= r_y\cdot(1/12)\cdot(1/24)\cdot(1/24)\cdot(1/60)\cdot(1/60)
\end{align}
$$

> ### Discussion
> 1. If $$r_y = 0.2$$, what is the population growth rate in units $$[1/second]$$? In units of $$[1/day]$$?
> 2. What are the units of $${\rm d}N/{\rm dt}$$?
> 3. What are the units of $$N(t + \Delta t) - N(t)$$
> 4. What are the units of $$K$$ in the logistic equation for continuous-time populations? (reference Section 7)

To obtain an equation for $$N(t)$$ for a discrete time system, we use recursion, which we discussed in class. Following the procedure outlined in lecture we obtain

$$
\begin{equation}
N(t) = N_0 \lambda^t
\end{equation}
$$

where $$\lambda = N(t+1)/N(t)$$.

> ### Discussion
> 1. Relate $$\lambda$$ to the instantaneous rate of growth $$r$$.
> 2. If $$r = 0.02~{\rm year}^{-1}$$, what is $$\lambda$$ in a corresponding discrete-time system?
> 3. What are $$r$$ and $$\lambda$$ at steady state? I.e. at the condition where the change in population size is zero over time?
> 4. We discussed in class how to calculate the doubling time for a population according to continuous-time dynamics. Using the discrete time solution for $$N(t)$$, What is the equation for doubling time for a discrete-time population? How does this compare to the doubling time of a continuous-time population?


## Discrete logistic population growth

```R
    logistic.map = function(r,K,N0,tmax) {
        N = numeric(tmax)
        N[1] = N0
        for (t in 2:tmax) {
            Nt = r*N[t-1]*(1 - N[t-1]/K)
            N[t] = Nt 
        }
        plot(N,type='l')
    }

    logistic.map(r = 2, K = 1,N0=0.01,tmax=10)
```



```R
    logistic.cobweb = function(r,K,N0,tmax) {
        N = numeric(tmax)
        N[1] = N0
        for (t in 2:tmax) {
            Nt = r*N[t-1]*(1 - N[t-1]/K)
            N[t] = Nt 
        }
        Ntx = seq(0,1,length.out=100)
        Nty = r*Ntx*(1 - Ntx/K)
        plot(Ntx,Nty,type='l',xlab="Population size N(t)", ylab="Population size N(t+1)",lwd=2,xlim=c(0,1),ylim=c(0,1))
        lines(seq(-1,2),seq(-1,2),col='gray',lwd=2)
        for (t in 1:(tmax-1)) {
            #draw segments
            segments(x0=N[t],y0=N[t],x1=N[t],y1=N[t+1],col='blue')
            segments(x0=N[t],y0=N[t+1],x1=N[t+1],y1=N[t+1],col='blue')
        }
    }
    logistic.cobweb(r = 2, K = 1, N0=0.01, tmax=10)

```