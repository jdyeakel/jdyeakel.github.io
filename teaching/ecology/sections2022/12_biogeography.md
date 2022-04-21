---
layout: pagetrimnobio
title: "Section 12 :: Island Biogeography"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

[< Back to Course Page]({{ site.url }}/teaching/ecology)  
<br>


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
