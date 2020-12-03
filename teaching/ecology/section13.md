---
layout: pagetrimnobio
title: "Section 13 :: The Dynamics of Disease"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

[< Back to Course Page]({{ site.url }}/teaching/ecology)  
<br>

## A Compartmental Model of Disease

In the past we have tracked how populations change over time in the face of competition or with respect to predator-prey interactions. In theory, there is no reason why we couldn't do the same for a parasite that causes disease within a host. However, infectious diseases have population dynamics that occur both within a host as well as between hosts. In this sense, host individuals are habitat for the pathogen, and we generally want to track when such pathogens successfully spread across a population of hosts, and are less concerned about the population size of a pathogen *within* a given host individual.

We can track the spread of a disease-causing pathogen among host individuals of a host population with a compartmental model, where we categorize host individuals into different compartments based on their state. Here a *state* is defined by whether they have had, currently have, or have never been exposed to a particular disease-causing pathogen. As such, the compartments, or states, are defined
*   $$S$$: The density of susceptible individuals (never been exposed to pathogen)
*   $$I$$: The density of infected individuals (currently exposed to pathogen)
*   $$R$$: The density of recovered individuals (previously exposed to pathogen with lifetime immunity)

So susceptible individuals can become infected, infected individuals recover, and recovered individuals stay recovered. Thus we are interested in tracking the dynamics of individuals moving along: $$S\rightarrow I \rightarrow R$$ over time. One important assumption that we will make for now is: *the dynamics of the pathogen spreading within the host population occurs on a faster timescale than the population dynamics of the host*. In other words, we will assume that there are no births and deaths of host individuals during the time-period that we track the spread of the pathogen, though we will relax this assumption later on. This means that we can make the following assumption

$$
\begin{equation}
S(t) + I(t) + R(t) = N
\end{equation}
$$

where $$N$$ is a constant. So while $$S(t)$$, $$I(t)$$ and $$(R(t)$$ *do* change over time, we assume that the total population size $$N$$ is fixed.

> ### Discussion
> 1. If $$N$$ is fixed, this means that $$dN/dt = 0$$. Because $$N = S(t) + I(t) + R(t)$$, we have the relationship $$dN/dt = d(S + I + R)/dt = dS/dt + dI/dt + dR/dt$$. Interpret what this means... Start with what $$dN/dt$$ should be if $$N$$ is constant over time. Consider the gains and losses of individuals from each compartment under the constraint of a fixed population size $$N$$.
> 2. Under the assumption of a fixed population size $$N$$, do we need to track the dynamics of all three compartments?

Now let's consider the transition rates between the $$S$$, $$I$$, and $$R$$ compartments. By transition rates, we mean the per-unit-time movement of individuals from one compartment to the other... so the rate at which susceptible individuals become infected, and the rate at which infected individuals recover. Let's first consider the former, because it is a little more complicated. But we can start with a simple statement: the rate at which susceptible individuals become infected *is dependent on the number of infected individuals*... the more infected individuals there are, the faster the susceptible individuals will become infected. This captures the idea that infection spreads by contact between susceptible and infected individuals, and the more infected individuals there are, the more contact there is. We call this *the force of infection*, and because the force of infection changes with $$I$$, we write it as $$\lambda(I)$$. This means that the force of infection $$\lambda(I)$$ is a function of the density of infected individuals $$I$$. 

Let's think about the force of infection a little more carefully. As the density of infected individuals increases, so should the force of infection, and this will promote the infection of susceptible individuals ($$S \rightarrow I$$). For our purposes, we will define the force of infection as 

$$
\begin{equation}
\lambda(I) = \beta \frac{I}{N}
\end{equation}
$$

where $$\beta$$ is the transmission rate with units $$1/[time]$$, and $$I/N$$ is the proportion of the population that is infected. 

If the rate that susceptible hosts are infected is $$\lambda(I)$$, the rate at which they recover is given $$\gamma$$. This rate of recovery has units of $$1/[time]$$, and determines how quickly an infected individual moves to the recovered compartment. One way of understanding the recovery rate $$\gamma$$ is that $$1/\gamma$$ has units of $$[time]$$, and can be interpreted as the *average amount of time an individual is infected*. The full dynamics for the infected class is thus

$$
\begin{equation}
\frac{\rm d}{\rm dt}I = \lambda(I)S - \gamma I = \beta \frac{I}{N}S - \gamma I
\end{equation}
$$

Before we even think about the susceptible or recovered compartment, we can say something interesting about when an infectious pathogen might be expected to spread. An infectious pathogen is expected to spread when $$dI/dt > 0$$. Exploring this, we find

$$
\begin{align}
\frac{\rm d}{\rm dt}I &> \beta \frac{I}{N} - \gamma I \\ \\
0 &> \beta \frac{I}{N}S - \gamma I \\ \\
\beta \frac{I}{N}S &> \gamma I \\ \\
\beta \frac{S}{N} &> \gamma \\ \\
\frac{S}{N} &> \frac{\gamma}{\beta}
\end{align}
$$

Very similar to what your book provides in chapter 13, this represents a threshold density of susceptible individuals that is required for an infectious pathogen to spread, the only difference being that here the threshold is represented as a proportion of susceptible individuals in the population (in the book it is left unstated, however the population size $$N$$ is normalized to 1, and this can easily lead to confusion - it is more clear to keep all of the terms unnormalized as we are doing here).

> ### Discussion
> 1. What values of $$\beta$$ and $$\gamma$$ would lead to infections that are more or less easily spread throughout a population?
> 2. Can you think or different diseases that might be described by a higher or lower $$\gamma/\beta$$? Justify your reasoning.
> 3. Consider the definitions of $$\beta$$ and $$\gamma$$. How would *social distancing* impact these parameters? Which of the two would it most likely affect and in what way?

## The basic reproductive number

Ultimately, we want to know - on average - how many hosts will be secondarily infected by an infected host. This can be determined by finding $$R_0$$ (pronounced *R knot*), and is very similar to determining the threshold density of susceptible individuals needed for a pathogen to spread. The important distinction here is the $$R_0$$ is defined relative to a host population *nearly entirely composed of susceptible individuals*. In other words, $$R_0$$ must be determined at the beginning of the infection, where there $$S(t=0) = N-1$$ and $$I(t=0) = 1$$. To find $$R_0$$ for the basic SIR model, we examine the condition for disease spread

$$
\begin{align}
{\rm d}{\rm dt}I &> 0 \\ \\
\beta \frac{I}{N} S - \gamma I &> 0 \\ \\
\beta \frac{I}{N} S &> \gamma I \\ \\
\beta \frac{S}{N} &> \gamma \\ \\
\beta \frac{N-1}{N} &> \gamma \\ \\
\beta &> \gamma \\ \\
\frac{\beta}{\gamma} &> 1 \\ \\
R_0 = \frac{\beta}{\gamma} &> 1
\end{align}
$$

As we can see here, we must assume that $$(N+1)/N$$ approximates 1, and this is only true of the size of the population $$N$$ is large. We also find that $$R_0 = \beta/\gamma$$. When $$\beta/\gamma > 1$$ the disease will spread because each infected host will spread it to more than one susceptible host. When $$\beta/\gamma < 1$$, the disease will not spread because each infected host will spread the pathogen to less than one susceptible host (on average). 


## The full SIR model
Now let's consider the dynamics of infection as well as the dynamics of the susceptible and recovered compartments. Any flow of individuals entering the infected compartment *needs to leave the susceptible compartment*. So the outflow of susceptibles must match the inflow of infected! That gives us

$$
\begin{equation}
\frac{\rm d}{\rm dt}S = -\lambda(I)S = -\beta I S
\end{equation}
$$

Notice the role here of the (-) sign... it is important! Now, similarity, the inflow of individuals into the recovered compartment *must match the outflow of individuals from the infected compartment*. This means that

$$
\begin{equation}
\frac{\rm d}{\rm dt}R = \gamma I
\end{equation}
$$

Putting this all together, we have the full SIR model

$$
\begin{align}
\frac{\rm d}{\rm dt}S &= -\beta \frac{I}{N} S \\ \\
\frac{\rm d}{\rm dt}I &= \beta \frac{I}{N} S - \gamma I \\ \\
\frac{\rm d}{\rm dt}R &= \gamma I \\ \\
\end{align}
$$

> ### Discussion
> 1. Prove that $$dS/dt + dI/dt + dR/dt = 0$$ by substituting in the above equations
> 2. What might you add to the above equations if lifelong immunity was not guaranteed? 

Now let's examine a simulation of the above equations


```R
    library(deSolve)
    sir.basic = function(beta,gamma,tmax,S0,I0,R0) {
        yini = c(S = S0,I = I0,R = R0)
        
        fmap = function (t, y, parms) {
        with(as.list(y), {
            dS <- -beta*y[2]/(y[1]+y[2]+y[3])*y[1]
            dI <- beta*y[2]/(y[1]+y[2]+y[3])*y[1] - gamma*y[2]
            dR <- gamma*y[2]
            list(c(dS,dI,dR))
        })
        }
        
        times <- seq(from = 0, to = tmax, by = 0.1) 
        out   <- ode(y = yini, times = times, func = fmap, parms = NULL)
        
        plot(out[,1],out[,2], lwd = 2,xlab='Time',ylab='Compartment Size',type='l',ylim=c(0,S0+I0+R0),col='green')
        lines(out[,1],out[,3],lwd=2,col='red')
        lines(out[,1],out[,4],lwd=2,col='blue')
    }
    sir.basic(beta = 0.1,gamma=0.05,tmax = 1000,S0 = 99, I0 = 1, R0 = 0)
```

<iframe width='100%' height='800' src='https://rdrr.io/snippets/embed/?code=%23Paste%20code%20here' frameborder='0'></iframe>

> ### Discussion
> 1. Given `beta = 0.1,gamma=0.05`, what is the outcome of the outbreak? Does everyone become infected?
> 2. Tune up the pathogen's transmission rate... compared to a lower transmission rate, what do you notice about the steady state of the susceptible population over time?
> 3. What combination of transmission rates and recovery rates leads to larger/short peak outbreaks vs. prolonged outbreaks?


## The SIR model with host births and deaths

Now we will consider a Susceptible-Infected-Recovered model where we allow the host population to grow and decline. We will assume, in this case, that both reproduction and mortality of the hosts are *independent* of the pathogen. Let us assume that the hosts birth rate is given by $$b$$ and its mortality rate is given by $$\mu$$. We will also assume: a) that all offsprings are initially susceptible, and b) the mortality of susceptible, infected, and recovered individuals is the same. These assumptions give us the demographic SIR model

$$
\begin{align}
\frac{\rm d}{\rm dt}S &= bN - \mu S -\beta \frac{I}{N} S \\ \\
\frac{\rm d}{\rm dt}I &= \beta \frac{I}{N} S - (\gamma + \mu) I \\ \\
\frac{\rm d}{\rm dt}R &= \gamma I - \mu R \\ \\
\end{align}
$$

> ### Discussion
> 1. Why is $$b$$ included only in the $$dS/dt$$ equation, whereas $$\mu$$ is included in all $$dS/dt$$, $$dI/dt$$, and $$dR/dt$$ equations?
> 2. For $$dS/dt$$, why is birth given by $$b N$$ whereas death is given by $$\mu S$$?
> 3. Is $$N$$ constant in the the demographic SIR model?
> 4. Does $$dS/dt + dI/dt + dR/dt = 0$$ in the demographic SIR model?
> 5. From the equation for $$dS/dt$$, solve for the steady state of $$I^*$$. From the equation for $$dI/dt$$, solve for the steady state of $$S^*$$, From the equation for $$dR/dt$$, solve for the steady state of $$R^*$$. What does this tell us about the ability of a pathogen to persist in the population?


```R
    library(deSolve)
    sir.demo = function(beta,gamma,b,mu,tmax,S0,I0,R0) {
        yini = c(S = S0,I = I0,R = R0)
        
        fmap = function (t, y, parms) {
        with(as.list(y), {
            dS <- -beta*y[2]/(y[1]+y[2]+y[3])*y[1] + b*(y[1]+y[2]+y[3]) - mu*y[1]
            dI <- beta*y[2]/(y[1]+y[2]+y[3])*y[1] - (gamma + mu)*y[2]
            dR <- gamma*y[2] - mu*y[3]
            list(c(dS,dI,dR))
        })
        }
        
        times <- seq(from = 0, to = tmax, by = 0.1) 
        out   <- ode(y = yini, times = times, func = fmap, parms = NULL)
        
        maxvalue = max(out[,2:4])
        nstar = sum(out[tmax,2:4])

        plot(out[,1],out[,2], lwd = 2,xlab='Time',ylab='Compartment Size',type='l',ylim=c(0,maxvalue),col='green')
        lines(out[,1],out[,3],lwd=2,col='red')
        lines(out[,1],out[,4],lwd=2,col='blue')
        # lines(seq(1,tmax,length.out=10),rep(((gamma+mu)/beta)*nstar,10))
        # lines(seq(1,tmax,length.out=10),rep((gamma/mu)*((b-mu)/beta)*nstar,10))
    }
    sir.demo(beta = 0.3,gamma=0.1,b=0.02,mu=0.02,tmax = 1000,S0 = 99, I0 = 1, R0 = 0)
```
<iframe width='100%' height='700' src='https://rdrr.io/snippets/embed/?code=%23Paste%20code%20here' frameborder='0'></iframe>


> ### Discussion
> 1. What dynamics do you observe for $$S(t)$$, $$I(t)$$, and $$R(t)$$?
> 2. The trajectory for $$I(t)$$ does not go to zero over time. What do this mean?
> 3. Solve for $$R_0$$ for the SIR model with demographic processes.
> 4. Solve for the steady states of $$S^*$$, $$I^*$$, and $$R^*$$.
> 5. Confirm your analytical steady state solutions match the simulation given different parameter values
