---
layout: pagetrimnobio
title: "Demo 1 :: Investigating ecological problems with R"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

[< Back to Course Page]({{ site.url }}/teaching/ecology)  
<br>  




In *Foundations of Ecology*, we will be using the R Language to investigate relationships and analyze data. To use R there are a few options, but here I will describe using R on a browser, and this will work on any machine, including desktops, laptops, chromebooks, tablets, and even smartphones (don't recommend).

## Using the R web-tool

You can either install R on your computer, or use the web-tool shown below, which does not require you to install anything. If you would prefer to install R on your computer, I would advise you to use [RStudio](https://rstudio.com/). RStudio is free, and you can find directions to install (Mac, Windows, Linux) by following the link. Here is another resource for getting you started with RStudio: [link](https://cpb-us-e1.wpmucdn.com/sites.ucsc.edu/dist/d/276/files/2015/09/GetStartedWithR-1i06k8e.pdf). **Importantly**, everything that we will be doing with R can be done by using the web-tool below. You will *have* to use this if your primary machine is an iPad or ChromeBook.

> ## Using R Studio (optional)  
> **Cloud** First we need to sign up for a `FREE` RStudio Cloud account. There are paid tiers to this, but the base tier - which is all we need - is free. Visit the [RStudio Cloud website](https://rstudio.cloud/) and click the `Get Started for Free` button and follow the instructions to make your account. After you do this, you will be able to log in to RStudio Cloud use the program.  
> **Local App** *Alternatively* you can install R directly on your computer if you are using a laptop with Window/Apple/Linux OS - this option will not work on Chromebooks. Running RStudio natively on your machine is free, and you can find directions to install (Mac, Windows, Linux) by following this [link](https://rstudio.com/).  
> Whether you are using RStudio Cloud or RStudio on your machine, here is a resource that will help acquaint you with the RStudio environment: [link](https://cpb-us-e1.wpmucdn.com/sites.ucsc.edu/dist/d/276/files/2015/09/GetStartedWithR-1i06k8e.pdf).

## Using R

This is a very brief tutorial for getting used to using R. We will have more practice as the course proceeds, so don't worry if you have trouble getting the hang of it right away. To use the web-tool (or an installed version of R on your machine), all you need to do is to copy the blocks of code that will presented as:

```R
    #Code Block
    #Assign the string 'Hello World' to the object x
    x = 'Hello World'
    #Now print the value of x
    print(x)
```

Copy this code block into the window at the bottom of the page, and press Control-Enter. The output will be generated below the window.

So a few things in the above code block that I want you to pay attention to. The first line starts with a `#` symbol, which in the R language identifies that line as a comment or note. It is not code - it is just a note to the reader. I will use these comments/notes to describe what the code is doing. Below the first two comment lines, we tell R to assign the phrase "Hello World" to the object `x`. Below the last comment, we pass `x` to the function `print`. The function `print()` *does* something with `x`. As you might guess, it means 'Print', and will print whatever we pass to it. We pass `x` to `print()`, but instead of printing the letter x, it prints 'Hello World' because we have assigned that phrase to the object `x`. The output is shown in the green shaded box below the input window.

<br>

<iframe width='100%' height='300' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>

<br>

>**There is an important difference between using this web-tool vs. using RStudio installed on your computer. With RStudio installed on your machine, you can run one line at a time, however with the web-tool, all of the code must be entered together and run all at once.**  
> <br>
> **When using the web-tool, read through the comments and corresponding code carefully before copying and pasting into the window. Experiment by changing the values and seeing what you get!**

## So let's get started

At its simplest, R can be used as a calculator. In the following code block I've provided some examples where we assign specific calculations to objects, and then use those objects to conduct additional calculations

```R
    # Three calculations are assigned to objects x, y, z
    x = 5 + 5
    y = 10*2
    z = 15/3

    # x, y, z now all pass to different numbers
    # Objects can also be given longer names. 
    # Now we will calculate a final number by dividing y by z and adding x.
    # We will assign this calculation to object final_1
    final_1 = x + y/z
    # I am using the print function to print both the name of the object and its value
    print(paste('final_1 = ',final_1),quote=F)

    # Remember your order of operations! (PEMDAS)
    # By adding parentheses, we change the calculation
    # We will save this - different calculation - to the object final_2
    final_2 = (x + y)/z
    print(paste('final_2 = ',final_2),quote=F)

    # We might also examine the value of something without saving it
    # ...for instance the product of final_1 and final_2
    # Note we are not using the function 'print', as R will output the value automatically
    final_1 * final_2
```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>


## A bit more on functions

Sometimes functions operate on numbers, and sometimes functions operate on a combination of object types. Let's look at some commonly-used functions.

```R
    # We can use functions on raw numbers
    log(5)
    exp(5)

    # Or we can pass an object to a function
    x = 5
    y = log(x)
    print(paste('y = ',y),quote=F)
    z = exp(x)
    print(paste('z = ',z),quote=F)

    #Or we could modify an object as we pass it to a function
    yprime = log(x/2)
    print(paste('yprime = ',yprime),quote=F)
    zprime = exp(x/2)
    print(paste('zprime = ',zprime),quote=F)
```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>

## Not just numbers!

Much of what we will do will involve manipulating lists of numbers, which we call a `vector`. For example, perhaps we measure the proportion of the day a bird spends foraging for 10 days. We could examine this information by organizing it into a vector.

```R
    # For 10 days we measure the proportion of the day a certain bird spends foraging.
    # (don't worry about how... there is plenty of time for realism later on)
    # We encode these observed values into a vector 'v'
    v = c(0.22,0.17,0.25,0.22,0.38,0.27,0.15,0.25,0.24,0.11)
    print(paste(c('v =',v)),quote=F)

    # The function c() concatenates the included values into a vector
    # We can perform operations on vectors as easily as if they were single numbers
    # Say we want to multiple every value by 2...
    v2 = v*2
    print(paste(c('v2 = ',v2)),quote=F)

    # We could even apply the function log() across each value
    lv = log(v)
    print(paste(c('lv =',lv)),quote=F)
```

<iframe width='100%' height='300' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>


## Visualization

Manipulating numbers is one thing, but it usually helps to plot the results to visualize what is going on. R provides many plotting functions, which we can use with the web-tool as well. Let's take the above example and plot it.

```R
    # Here are the foraging observations that we entered above
    v = c(0.22,0.17,0.25,0.22,0.38,0.27,0.15,0.25,0.24,0.11)

    # We also want to make a second vector that records the day each measurement was made
    # We can use the sequence function seq() for this.
    # For seq(), the first number is the beginning of the sequence, 
    # the second number is the last number of the sequence, and 
    # the third number is the stepsize of the sequence
    day = seq(1,10,1)

    # Now we want to make a scatterplot of our data, with the 
    # days on the x-axis, and the observations on the y-axis
    # To do this we will use the plot() function
    # Note: We first specify the x-coordinate data, then specify the y-coordinate data
    # We enter other info as well - the x-axis label, y-axis lavel, and y-axis limits
    plot(x = day, y = v, xlab = 'Days', ylab = 'Proportion time feeding',ylim=c(0,0.5))
```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>

---

# Let's get to the ecology :: Ecological interactions across scales  

Now that we have a basic understanding of how R works, we can begin exploring how we might investigate ecological problems using this powerful tool. During this class, we will be confronting ecological problems in two ways:  
1. **Data-driven approaches**: Formulate a question regarding an ecological relationship, gather data, and explore patterns in that data. Determine whether or not the data matches our understanding of how things work in nature. Revise and update our understanding given the new results at hand.  
2. **Theory-driven approaches**: Formulate a question regarding an ecological relationship, propose underlying constraints that might determine that relationship, and build a simple model incorporating those constraints. Evaluate whether the model reveals patterns that match our understanding of how things work in nature. Revise and update our understanding given the new results at hand.  

In the description of these alternative approaches to ecological science, which parts of the description are the same and which are different?
<br>
Below we will explore ecological relationships that occur at different scales. Which of the examples better fall into the **Data-driven** vs. **Theory-driven** categorization?

## Individual-scale

***Sea Otter diets***: Sea otters are carnivorous mammals that live in coastal environments where upwelling drives nutrient-rich shallow-water communities from which they derive the vast majority of their food. Sea otters are voracious eaters and incorporate a wide variety of prey into their diet. For the population that lives off the coast of Santa Cruz, California, sea otters have been shown to exhibit remarkable individuality in thier dietary predilictions. Ecologist Tim Tinker spent an enormous number of hours identifying otters by individually unique characteristics and carefully monitorying foraging bouts. The most commonly observed prey items of these otters included `[Cancer crabs, kelp crabs, lobsters, urchins, abalone, snail, mollusk, clams, mussels, sea stars, sea worms, sand dollars, and other invertebrates]`. Compiling thousands of hours of observational data revealed that sea otter individuals have unique food preferences. Below we will see how one might go about exploring this dietary individuality in `R`.


```R
    # First, we will create a vector listing the names of the prey mentioned above
    # Names of prey types
    prey = c("cancer_crab","kelp_crab","lobster","urchin","abalone","snail","mollusk","clam","mussel","sea_star","worm","sand_dollar","inverts")

    # Individual otter diets are encoded by the proportion of each prey type
    # Importantly: prey type is in the same order as listed above
    # Enter individual otter diet data
    o1 = c(0.14,0.12,0,0.02,0,0.01,0.01,0.33,0,0.01,0.31,0.03,0.04)
    o2 = c(0.4,0.26,0,0.05,0.23,0,0,0.03,0,0,0,0,0.03)
    o3 = c(0.38,0.23,0,0.13,0.01,0,0,0.15,0.07,0.01,0,0,0.02)
    o4 = c(0.05,0.84,0,0.05,0,0,0.01,0.02,0.01,0,0,0,0.02)
    o5 = c(0.25,0.24,0,0.28,0.01,0,0,0.09,0.02,0.02,0.04,0,0.04)
    o6 = c(0.18,0.16,0,0.14,0,0.01,0,0.15,0.01,0.01,0.06,0,0.29)
    o7 = c(0.17,0.25,0,0.19,0,0,0,0.27,0.03,0.02,0.05,0,0.02)
    o8 = c(0.28,0.2,0,0.05,0.07,0.05,0,0.15,0.13,0.02,0.01,0,0.04)
    o9 = c(0.06,0.27,0,0.05,0,0,0.01,0.19,0.12,0,0.08,0.01,0.2)
    o10 = c(0.01,0.08,0,0,0.01,0.77,0,0.04,0,0.06,0.01,0,0)

    # Organize as a matrix where each column is a food type
    # each row is a sea otter individual, and the elements
    # represent an individual's preference for each food
    omatrix = rbind(o1,o2,o3,o4,o5,o6,o7,o8,o9,o10)
    colnames(omatrix) = prey
    print(omatrix)
    
    # What is the mean reliance on each food?
    # We will use the apply function to calculate the mean value
    # for each prey item used across otter indviduals
    preymeans = apply(omatrix, 2, mean)
    print(paste(c('Prey Means = ',preymeans)),quote=F)

    # Which prey are most variable in sea otter diets? 
    # We will use the same apply function to calculate the standard deviation
    # for each prey item used across sea otter individuals
    preysd = apply(omatrix, 2, sd)
    print(paste(c('Prey SD = ',preysd)),quote=F)

    # We can visualize these differences as a boxplot... where both the mean 
    # and variance are displayed as a box-and-whiskers diagram... 
    # The shorter the whiskers, the less variable the diet on a particular prey. 
    # The larger the whiskers, the more variable the diet on a particular prey.
    # Note we are using abbreviations for prey names so that they fit on the x-axis
    boxplot(omatrix, names = c('cc','kc','l','u','a','s','mo','c','mu','ss','w','sd','i'))
```
<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>


> ### Discussion  
> 1. Which prey are more variable in sea otter diets? Which prey are less variable in sea otter diets? What could the reasons be for these differences?  
> 2. Which individuals are specialists and generalists? Can we think of specialist/generalist individuals in the same way that we think of specialist/generalist populations? Draw out examples of each.
> 3. What are the implications of this? What might it mean for a population to have a diverse array of sea otter individuals with their own unique dietary proclivities?  

---

## Population-scale

<!-- ***Competing XXX (data)***  
Stuff. -->

<br>
***Modeling the dynamics of a single population***: Imagine we want to simulate how a species' population changes over time. As we will learn in this class, much of what ecologists do revolves around trying to understand the forces that promote or inhibit population growth. If we are careful, we can express our understanding of the various factors regulating population growth with an equation... and often, the simpler the equation is, the better. But as we will see in this example, a 'simple' equation can produce a surprising amount of complexity! This idea - that simple interactions can result in complex outcomes - lies at the heart of ecology, and is one of the reasons it is so beguiling.


Now - don't panic, but we are going to model how a population might change over time using a MATHEMATICAL EQUATION 😱 First, we say that the population size of a particular species... say wombats... is represented by n(t), which means "the population size n at time t. Now we must specify how n changes in the future (time t+1) as a function of what it is today (time t). So we will write an equation that gives us n(t+1) as a function of n(t).

As we will learn in future classes when we cover this in detail, the transition of the population size today n(t) to that at a future time n(t+1) will involve two parameters: the reproductive rate r (accounting for how quickly individuals in the population reproduce), and the carrying capacity k, which determines how many individuals can 'fit' within a given environment. For now we will ignore k, and set `k = 1`. The equation of population growth is given as

$$
\begin{equation}
n(t+1) = rn(t)\left(1 - \frac{n(t)}{k}\right).
\end{equation}
$$

This equation is special, and is called the `logistic map`. In the R script below, the function `logistic.map()` is encodes the equation presented above. Don't worry too much about how this function works... all we really need to know is that the function takes 4 parameters... the reprodutive rate `r`, the starting population size `n0`, the carrying capacity `k` (which we will set to 1), and the maximum number of time steps we will evaluate `tmax`.




```R
    # First we will define the Logistic Map function
    # Don't worry about the details - we will get to this later

    logistic.map = function(r, n0, k, tmax){
        # Parameters for logistic.map function ::::
        # r: growth rate
        # n0: initial value
        # k: carrying capacity (set to 1)
        # tmax: Max time steps
        z = numeric(tmax)
        z[1] = n0
        for(i in c(1:(tmax-1))){
            z[i+1] = r *z[i]  * (1 - z[i]/k)
        }
        return(z)
    }

    # Now we will define values for objects that we will feed into the function,
    # implement it, and obtain the results
    # Run this code by manually setting r = 3, r = 3.2, r = 3.5, r = 4.0
    # What behavior do you observe?
    r = 3
    n0 = 0.1
    k = 1
    tmax = 100
    pop = logistic.map(r, n0, k, tmax)

    # We have set the population sizes over time as the object 'pop'
    # We will now plot the population data from the simulation
    plot(pop,type='l',xlab = 'Time', ylab = 'Population density')
```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>

> ### Discussion  
> 1. What does it mean to have a low `r` vs. a high `r`? Explore by setting `r=1`, `r=1.5`, `r=2`, and `r=2.5`. How might this relate to different species? For example, would rabbits 🐇 be more likely to have a lower or higher `r` than horses 🐎?   
> 2. Now continue dialing up `r`. Explore the following values and describe the resulting dynamics: `r=3`, `r=3.5`, and `r=4`.  
> 3. Are these results surprising? What might be the long-term implications if a species' population behaves in this manner?  

---

## Communities

***Watching islands fill up I***: In 1969, [Daniel Simberloff](https://en.wikipedia.org/wiki/Daniel_Simberloff) and [E.O. Wilson](https://en.wikipedia.org/wiki/E._O._Wilson) decided to test a theory that [Robert MacArthur](https://en.wikipedia.org/wiki/Robert_H._MacArthur) and Wilson had formulated a few years before: [*The Theory of Island Biogeography*](https://web.stanford.edu/group/stanfordbirds/text/essays/Island_Biogeography.html#:~:text=Wilson%20of%20Harvard%2C%20developed%20a,of%20established%20species%20become%20extinct.). We will learn more about these ideas during the second half of the class, but here is the gist:  
1. Islands represent unique opportunities to test ecological theories...  they are as close to a controlled natural experiment as we will ever get.  
2. Islands are limited in area and resources, so the number of species that live on islands should also be limited.  
3. Such limitations on species richness should be set by a) the size of the island and b) the distance of the island to the mainland (where species will be migrating from)  
4. The rate at which species arrive on the island (the colonization rate), and the rate at which species go extinct (the extinction rate) are the processes that drive species richness, and these processes should vary as a function of attributes such as island size and distance to the mainland.  

The experiment Simberloff devised is both simple and a bit nutty. He selected a number of mangrove islands off the coast of Florida of varying sizes and distances from the mainland, which hosted diverse arthopod communities. He surrounded each mangrove island with a metal frame, covered it with fumigation tarps, and gassed the arthropods into oblivion. Following these localized 'mass extinction' events, Simberloff and colleagues observed the recolonization of the mangrove islands, documenting which species arrived and when. We will now examine these data below.  

```R
    # Load in the dataset collected by Simberloff (nicely compiled as a readily availabel package!)
    library(island)
    library(RColorBrewer)
    data = simberloff
    # This is a color palette that shows up well on light backgrounds
    pal = brewer.pal(6,'Dark2')
    
    
    # There are presence/absence datasets for each of 6 islands.
    # Each island is represented by a matrix, where columns are days and
    # rows are species
    # We will add up the number of species present at each time point (island1-6)
    # We will also extract the day the measurements were taken (time1-6)
    # For a given island, we now have a record of how diversity changes over time
    # The first measurement is diversity prior to removal
    # The latter measurements document how the community recovers
    island1 = apply(data[[1]][,2:16],2,sum)
    time1 = as.numeric(names(data[[1]][,2:16])); time1[1] = 0
    island2 = apply(data[[2]][,2:18],2,sum)
    time2 = as.numeric(names(data[[2]][,2:18])); time2[1] = 0
    island3 = apply(data[[3]][,2:17],2,sum)
    time3 = as.numeric(names(data[[3]][,2:17])); time3[1] = 0
    island4 = apply(data[[4]][,2:19],2,sum)
    time4 = as.numeric(names(data[[4]][,2:19])); time4[1] = 0
    island5 = apply(data[[5]][,2:17],2,sum)
    time5 = as.numeric(names(data[[5]][,2:17])); time5[1] = 0
    island6 = apply(data[[6]][,2:16],2,sum)
    time6 = as.numeric(names(data[[6]][,2:16])); time6[1] = 0

    

    # Let's plot these diversity curves for islands 1-6
    # We will use a different color for each island to easier see within-island
    # diversity patterns over time
    plot(time1,island1,type='l',col=pal[1],lwd=2,xlim=c(0,550),ylim=c(0,50),xlab='Time', ylab='Island species richness')
    lines(time2,island2,col=pal[2],lwd=2)
    lines(time3,island3,col=pal[3],lwd=2)
    lines(time4,island4,col=pal[4],lwd=2)
    lines(time5,island5,col=pal[5],lwd=2)
    lines(time6,island6,col=pal[6],lwd=2)
    legend(400,20,legend=c(1,2,3,4,5,6),col=pal,pch=16)

    # We can assess recovery by comparing the species diversity at the first 
    # point in time (pre-extermination) to the species diversity at the last
    # point in time (post-recovery). If we divide the last value by the first
    # value, we get a ratio. A value greater than 1 means that the recovery has
    # resulted in a community MORE diverse than when it started. A value
    # less than 1 means that the recovery has resulted in a community
    # LESS than when it started

    # Let's do this with the first island. We will use the R functions 
    # head() and tail() to get the first and last values
    
    pre_extinction = head(island1,1)
    post_recovery = tail(island1,1)
    ratio = post_recovery/pre_extinction
    print(paste('ratio=',ratio))
    
```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>


> ### Discussion  
> 1. What happens to the island communities following Simberloff's fumigation treatment (the datapoint at time `t=0` is species richness *before* fumigation)  
> 2. What type of variation is observed between and among island communities?  
> 3. What do you think about the ethics of fumigating mangrove islands full of arthropods to examine foundational concepts in ecology? Is there a less impactful way to go about investigating these questions?

---

***Watching islands fill up II***: The patterns of community re-assembly following Simberloff's fumigation are varied, but follow similar trends. One of the principle ideas behind *The Theory of Island Biogeography* is that:
1. Larger islands should support more species
2. Islands closer to the mainland should support more species

Do we see these relationships with Simberloff's data? Let's explore below.


```R
    # Now we will ask the questions: 
    # Do larger islands host richer communities?
    # Do closer islands host richer communities?
    # We will evaluate this with respect to the pre-disturbance richness
    library(island)
    library(RColorBrewer)
    data = simberloff
    island1 = apply(data[[1]][,2:16],2,sum)
    time1 = as.numeric(names(data[[1]][,2:16])); time1[1] = 0
    island2 = apply(data[[2]][,2:18],2,sum)
    time2 = as.numeric(names(data[[2]][,2:18])); time2[1] = 0
    island3 = apply(data[[3]][,2:17],2,sum)
    time3 = as.numeric(names(data[[3]][,2:17])); time3[1] = 0
    island4 = apply(data[[4]][,2:19],2,sum)
    time4 = as.numeric(names(data[[4]][,2:19])); time4[1] = 0
    island5 = apply(data[[5]][,2:17],2,sum)
    time5 = as.numeric(names(data[[5]][,2:17])); time5[1] = 0
    island6 = apply(data[[6]][,2:16],2,sum)
    time6 = as.numeric(names(data[[6]][,2:16])); time6[1] = 0
    initial_richness = c(island1[1],island2[1],island3[1],island4[1],island5[1],island6[1])
    
    # E1, E2, E3, E7, E9, ST2
    # Island diameter (meters)
    island_diameter = c(11,12,12,25,18,11)
    # Island distance to mainland (distance)
    island_distance = c(533,2,172,15,379,154)
    
    plot(island_distance,island_diameter,xlab="Distance (m)",ylab="Diameter (m)")
    plot(island_diameter,initial_richness,xlab = "Diameter (m)",ylab="Initial richness")
    plot(island_distance,initial_richness,xlab= "Distance (m)",ylab="Initial richness")
    

```

<iframe width='100%' height='1000' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>

> ### Discussion  
> 1. Judging from the first two plots [richness vs. distance and richness vs. diameter], do you see any obvious patterns?  
> 2. If not, what would you have expected and why?  
> 3. The third plot (bottom) shows [distance vs. diameter]. Note that there are large islands both close and far, as well as small islands both close and far. This makes discerning patterns in species richness quite difficult. Why?  
