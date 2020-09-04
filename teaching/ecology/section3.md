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

Why would metabolic rate be expected to scale with body size, and why is a 3/4-scaling surprising? There are two things to remember... if we imagine a spherical organism increasing in size, the surface area and volume of a sphere scale differently:

<br>
<br>
<img src="{{ site.url }}/images/ecology/radius.jpg" width="1000">
where $$ \propto $$ means 'in proportion to'.

The HEAT produced by metabolism is produced in proportion to an organism's volume (because the number of cells increase with volume), however the heat must be DISSIPATED across the organism's surface area. So the energy produced by metabolism, which might be assumed to be scaled with volume
$$
(B_{\rm assume} \propto V)
$$
really must be tuned down so that it can be dissipated as heat. How much should it be tuned down? We can make a geometric argument for this... if the energy produced from metabolism is cubed, but it needs to be dissipated across the organism's surface area, we need to tune the cubic relationship down to a squared relationship... so because we can write

$$
\begin{equation}
SA \propto V^{2/3} \propto (r^3)^{2/3}
\end{equation}
$$

we might then hypothesize that metabolic rate should be scaled similarly with *mass*, such that

$$
\begin{equation}
B_{\rm hypothesis} \propto M^{2/3}
\end{equation}
$$

where the 2/3 exponent is how much we need to tune down the metabolic rate to avoid overheating and grossly exploding. Importantly, this is a limitation of being a 3-Dimensional organism.

The question is: *is this correct*? Let's plot a line through our data that increases $$ \propto M^{2/3} $$.

```R
    mass = c(0.150,0.173,0.226,0.300,1.96,11.6,15.5,45.6,56.5,64.1,388,342,679)
    calperhr = c(19.5,20.2,25.5,30.8,106,443,525,1219.9,1349,1632,6421,6255,8274)
    sp = c('dove','fe_rat','ml_rat','pigeon','hen','fe_dog','ml_dog','sheep','woman','man','cow','steer','steer')

    plot(mass,calperhr,log='xy')
    lines(mass,exp(4.29)*mass^(2/3),lwd=2,lty=2)
```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>

> ## Discussion
> 1. Does the 2/3 line match the data well?  
> 2. Are there certain species for which it does and does not?  


## Cheating 3-Dimensional limitations with Fractal Branching

We will find in a moment that there is a better solution than a 2/3 scaling, even though 2/3 would seem to be a strict limitation of being a 3-Dimensional organism in a 3-Dimensional environment. First, let's think about why it might be beneficial for an organism's metabolism to scale differently than the 2/3 limitation. Because 2/3-scaling is less than a 1:1 scaling, the metabolism of larger organisms is lower - per unit biomass - than a smaller organism. So if we think of a cubic gram of mouse vs. a cubic gram of elephant, the cubic gram of mouse is generating more energy. If metabolic scaling can be pushed >2/3, the energy produced per unit biomass is elevated, thereby increasing the energetic 'bank account' of an organism, especially those of larger body size.

<div>
<p style="float: left;padding-right:10px"><img src="/images/ecology/fractalbranching.jpg" width="400"></p>
<b>Fractal Branching</b> Life has found a way to <i>cheat</i> the limitations of 3-Dimensions, which is mind-blowing. On the right you can see a depiction of branching alveoli, which function to distribute gases between the air we inhale/exhale to/from blood vessels within the lungs. Our body is filled with these distribution channels - from alveoli to blood capillaries - that are organized in fractal branching patterns. Strangely, these fractal shapes have a dimensionality closer to 4-Dimensions rather than 3-Dimensions. The reasons for this are complex, and involve advanced mathematical and physical reasoning. If you dig that kind of thing, check out <a href="https://science.sciencemag.org/content/sci/276/5309/122.full.pdf">this paper</a>.   <BR> <BR> <BR> <BR>     
</div>     

The following video does a nice job discussing this near-4-Dimensional geometry, so check it out before or after section.

<iframe width="560" height="315" src="https://www.youtube.com/embed/hCS9MU_RX1c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

---

For now, let's look at that plot again, but by fitting a 3/4 power law line in addition to the 2/3 power law line. We will keep the 2/3 power law line stippled, and the 3/4 power law line solid. Which fits better?


```R
    mass = c(0.150,0.173,0.226,0.300,1.96,11.6,15.5,45.6,56.5,64.1,388,342,679)
    calperhr = c(19.5,20.2,25.5,30.8,106,443,525,1219.9,1349,1632,6421,6255,8274)
    sp = c('dove','fe_rat','ml_rat','pigeon','hen','fe_dog','ml_dog','sheep','woman','man','cow','steer','steer')

    plot(mass,calperhr,log='xy')
    lines(mass,exp(4.29)*mass^(2/3),lwd=2,lty=2)
    lines(mass,exp(4.29)*mass^(3/4),lwd=2)
```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>


<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/ofbwFY9noZA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<br>
<br> -->


> ## Discussion
> 1. How does *cheating* the 3-D limitations of nature benefit organisms?  
> 2. What other natural things (living and nonliving) exhibit fractal branching patterns?


## Mammalian population densities

If we go out in nature and begin measuring things, it is often surprising how many qualities of ecological systems exhibit scaling relationships that appear to relate, and sometimes be the same as, the 3/4 power law. While the 3/4 power law for metabolism has some very well-defined theory that may explain the underlying mechanism, many other power-scale ecological relationships remain mysterious. Importantly, these scaling relationships are usually only evident when we look across many species and many ecosystems...

For example, let's look at the population densities of different mammal species, since we will be focusing so much on populations this semester. A population densities is generally defined by **number of individuals within a given area**... for example, we might count 3 antelope within a hectare or 1 mouse per 10 meters square. When comparing densities it is thus necessary to hold constant the area (the denominator). So if our area is a square meter, a habitat might hold 5 crickets/square meter, 0.1 antelopes/square meter (i.e. 1 per 10 square meters), or 0.001 elephants per square meters (i.e. 1 per 1000 square meters). Let's look at some data.

```R
    read.table('',header=FALSE)

    plot(mass,density,log='xy')

```


## The Energy Equivalence Hypothesis




