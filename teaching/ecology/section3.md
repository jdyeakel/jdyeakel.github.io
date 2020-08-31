---
layout: pagetrimnobio
title: "Section 3 :: The metabolic theory of ecology"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

[< Back to Course Page]({{ site.url }}/teaching/ecology)  
<br>

In the last section ([Section 2]({{ site.url }}/teaching/ecology/section2/)), we investigated the role of temperature in driving and constraining organismal activity rates. But why do organisms care what the temperature is? To answer this we must consider what an organism made of. Fundamentally an organism is an incredibly complex network of chemical reactions designed to pass information into subsequent individuals (their own complex network of interactions). We call an operational unit of this complex system a *metabolic network*. If you have taken Introductory biology, you have explore many of the fundamental biochemical reactions that form the basis of metabolism, including the Krebs cycle and - for photosynthetic organisms - photosynthesis. What does this metabolic network look like? Check it out:
<br>
<br>
<img src="{{ site.url }}/images/ecology/metabolicnetwork.jpg" width="1000">
<br>
<br>

If it looks complicated, that's because it is. Don't worry - this isn't a biochemistry course, so we will turn our focus now to how this process as a whole impacts organismal ecology.

## What is metabolism?

The entire metabolic process as shown above captures the energetic expenditure of what it takes to 'run' an organism's physiological processes. Metabolism is thus the *sum* of the processes depicted above. These physiological processes then impact behavior. For example, depending on the species, an individual can only pack on so much body fat. This body fat is used in part as an energy reserve - like the gas tank in your car. As you burn calories, your body takes calories in through foraging, and burns what it doesn't intake from fat. Excess intake gets stored as fat. If an individual is unable to find food, fat is catabolized to fuel metabolic processes. Organisms with higher metabolic requirements must burn more energy, and this impacts how/when an individual forages for food, interacts with other individuals, reproduces, etc... the stuff of ecology. Warm-blooded organisms (endotherms) maintain a constant internal body temperature, which costs additional energy, and this affects all aspects of their lives... they must forage more frequently, they can't go as long without food (some ectotherms, like some snakes, can go a month or more without feeding), and reproduction is generally riskier.

Now that we have a sense of what metabolism is, and that it has a direct impact on organismal ecology, let's examine how it compares ax must be relatively constant within a species and is not expected to fluctuate with temperature as it would for ectotherms. Moreover, let us compare the metabolism of organisms across a range of body sizes... from a mouse to an elephant.

> ### Discussion  
> 1. What relationship would you expect between metabolic expenditure and species' body size?  
> 2. What relationship would you expect if you took out the effect of body size? In other words, if you compared the metabolic expenditure of a cubic gram of mouse and a cubic gram of elephant?  

Now let's look at one of the most famous biological figures... the depiction of metabolic rate, measured as heat produced per day in kilocalories, as a function of species' body mass (kg)

<img src="{{ site.url }}/images/ecology/metabolicrate_bodysize.jpg">

This is a figure created by Max Kleiber, a physiologist who, in the 1930s, discovered that metabolic rate scales in a very particular way with organismal body size. First, notice that the scales of the x- and y-axis are log-scaled... meaning that each successive quadrant (moving along the x- or y-axis) is 10x the size of the previous quadrant. Perhaps unsurprisingly, we observe that an elephant or whale generates more heat per day than a mouse or guineapig. With this log-spacing, the metabolic rate of species is linearly scaled with body mass.

Now let's play with some data of our own... Below we will experiment with plotting 


```R
    mass = c(0.150,0.173,0.226,0.300,1.96,11.6,15.5,45.6,56.5,64.1,388,342,679)
    calperhr = c(19.5,20.2,25.5,30.8,106,443,525,1219.9,1349,1632,6421,6255,8274)
    sp = c('dove','fe_rat','ml_rat','pigeon','hen','fe_dog','ml_dog','sheep','woman','man','cow','steer','steer')

    par(mfrow=c(2,1))
    plot(mass,calperhr,log='xy')
    plot(mass,calperhr)
```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>

> ### Discussion
> 1. What is the difference between these two figures?
> 2. What do they tell us?

Why would metabolic rate be expected to scale with body size, and why is a 3/4-scaling surprising? There are two things to remember... if we imagine a spherical organism increasing in size (fine as a rough appoximation), it's surface area (SA) should increase in proportion to the SQUARE of its mass... so:

$$
\begin{equation}
SA \propto r^2,
\end{equation}
$$

where $$ \propto $$ means 'in proportion to'. By comparison, volume is expected to increase with the CUBE of its mass, such that

$$
\begin{equation}
V \propto r^3,
\end{equation}
$$

The HEAT produced by metabolism is produced in proportion to an organism's volume (because the number of cells increase with volume), however the heat must be DISSIPATED across the organism's surface area. So the energy produced by metabolism, which might be assumed to be scaled with volume
$$
(B_{\rm assume} \propto M^3)
$$
really must be tuned down so that it can be dissipated as heat. How much should it be tuned down? We can make a geometric argument for this... if the energy produced from metabolism is cubed, but it needs to be dissipated across the organism's surface area, we need to tune the cubic relationship down to a squared relationship... so because we can write

$$
\begin{equation}
SA = V^{2/3} = (r^3)^{2/3}
\end{equation}
$$

we might *hypothesize* that metabolic rate should be scaled similarly, or that

$$
\begin{equation}
B_{\rm hypothesis} \propto M^{2/3}
\end{equation}
$$


i.e. limit the heat produced to an organism's surface area, so that it can get rid of the heat without grossly exploding. We could write this as:

$$
\begin{align}
B &\propto (M^3)^{2/3} \\
B &\propto M^2
\end{align}
$$

where the 2/3 exponent is how much we need to tune down the metabolic rate.

SO NOW LET"S PLOT A 2/3 line through our data to see if this is correct!

lines(mass,exp(4.29)*mass^(2/3))


Fitting the line in log space...
Translate that to linear space...
The 3/4 law.

## Why does B = B0*M^3/4?

It's complicated!

<iframe width="560" height="315" src="https://www.youtube.com/embed/ofbwFY9noZA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<br>
<br>
<iframe width="560" height="315" src="https://www.youtube.com/embed/hCS9MU_RX1c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>




## Mammalian population densities

Other things scale similarity...

## The Energy Equivalence Hypothesis


