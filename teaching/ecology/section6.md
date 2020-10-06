---
layout: pagetrimnobio
title: "Section 6 :: Game Theory"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

## Games


## Payoff Matrix

| | Species A | Species B |
| - | - | - |
| Species A | A-A | A-B |
| Species B | B-A | B-B |

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |
    
|  |  |  |  |  |
|-|-|-|-|-|
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |


## Population flow


```R
    # Define the evolutionary game function
    evo.game = function(a,b,c,d) {
        # Proportion of A in population
        propA = seq(0,1,0.05)

        fA = a*propA + b*(1-propA)
        fB = c*propA + d*(1-propA)

        plot(propA,fA,type='l',col='blue',lwd=2,ylim=c(min(c(fA,fB)),max(c(fA,fB))),xlab='Proportion of A in population',ylab='Relative fitness')
        lines(propA,fB,col='red',lwd=2) 

        text(0,(1+0.05)*min(c(fA,fB)),'Flow',cex=2)
        for (i in 1:length(propA)) {
            loc = i
            if (fA[loc] > fB[loc]) {
                # points(propA[i],min(c(fA,fB)),pch=16)
                text(propA[i],min(c(fA,fB)),'>',cex=2)
            } 
            if (fA[loc] < fB[loc]) {
                # points(propA[i],min(c(fA,fB)),pch=1)
                text(propA[i],min(c(fA,fB)),'<',cex=2)
            }
            if (fA[loc] == fB[loc]) {
                # points(propA[i],min(c(fA,fB)),pch=1)
                text(propA[i],min(c(fA,fB)),'--',cex=2)
            }
        }
    }

    evo.game(a = 3, b = 5, c = 5,d = 3)

```

## Fitness and population change over time


```R
    game.pop = function(a,b,c,d,propA,tmax) {
        #Initial values
        fA = a*propA + b*(1-propA)
        fB = c*propA + d*(1-propA)
        favg = propA*fA + (1-propA)*fB

        pA = numeric(tmax)
        Favg = numeric(tmax)
        FA = numeric(tmax)
        FB = numeric(tmax)
        pA[1] = propA
        for (t in 1:(tmax-1)) {
            fA = a*pA[t] + b*(1-pA[t])
            fB = c*pA[t] + d*(1-pA[t])
            favg = pA[t]*fA + (1-pA[t])*fB
            deltaA = pA[t]*(fA - favg)
            deltaB = (1-pA[t])*(fB - favg)

            pA[t+1] = pA[t] + deltaA
            Favg[t] = favg
            FA[t] = fA
            FB[t] = fB
        }
        plot(pA,type='l',lwd=2,ylim=c(0,1),col='blue')
        lines((1-pA),type='l',lwd=2,col='red')
    }

    game.pop(a = 3, b = 5, c = 5,d = 3, propA = 0.1, tmax = 20)
```




Cycles
`game.pop(a = 4, b = 8, c = 8,d = 3, propA = 0.00001, tmax = 20)`




## With Noise?

## Fitness and population change over time


```R
    game.pop = function(a,b,c,d,propA,tmax,noise) {
        #Initial values
        fA = a*propA + b*(1-propA)
        fB = c*propA + d*(1-propA)
        favg = propA*fA + (1-propA)*fB

        pA = numeric(tmax)
        Favg = numeric(tmax)
        FA = numeric(tmax)
        FB = numeric(tmax)
        pA[1] = propA
        for (t in 1:(tmax-1)) {
            fA = a*pA[t] + b*(1-pA[t])
            fB = c*pA[t] + d*(1-pA[t])
            favg = (pA[t]*fA + (1-pA[t])*fB)*(1 + rnorm(1,0,noise))
            deltaA = pA[t]*(fA - favg)
            deltaB = (1-pA[t])*(fB - favg)

            pA[t+1] = max(0,min(1,pA[t] + deltaA))
            Favg[t] = favg
            FA[t] = fA
            FB[t] = fB
        }
        plot(pA,type='l',lwd=2,ylim=c(0,1),col='blue')
        lines((1-pA),type='l',lwd=2,col='red')
    }

    game.pop(a = 3, b = 5, c = 5,d = 3, propA = 0.1, tmax = 20, noise = 0.1)
```

