---
layout: pagetrim
title: "Getting Started with R"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

In *Foundations of Ecology*, we will be using the R Language to investigate relationships and analyze data. You can either install R on your computer, or use the web-tool shown below, which does not require you to install anything. If you would prefer to install R on your computer, I would advise you to use [RStudio](https://rstudio.com/). RStudio is free, and you can find directions to install (Mac, Windows, Linux) by following the link. Here is another resource for getting you started with RStudio: [link](https://cpb-us-e1.wpmucdn.com/sites.ucsc.edu/dist/d/276/files/2015/09/GetStartedWithR-1i06k8e.pdf). **Importantly**, everything that we will be doing with R can be done by using the web-tool below. You will *have* to use this if your primary machine is an iPad or ChromeBook.

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

>**There is an imporant difference between using this web-tool vs. using RStudio installed on your computer. With RStudio installed on your machine, you can run one line at a time, however with the web-tool, all of the code must be entered together and run all at once.**  
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


## A taste of things to come

Imagine we want to simulate how a species' population changes over time. As we will learn in this class, much of what ecologists do revolves around trying to understand the forces that promote or inhibit population growth. If we are careful, we can express our understanding of the various factors regulating population growth with an equation... and often, the simpler the equation is, the better. But as we will see in this example, a 'simple' equation can produce a surprising amount of complexity! This idea - that simple interactions can result in complex outcomes - lies at the heart of ecology, and is one of the reasons it is so beguiling.


First, we 

$$
\begin{equation}
n(t+1) = rn(t)\left(1 - \frac{n(t)}{k}\right)
\end{equation}
$$


```R
    # First we will define the Logistic Map function
    # Don't worry about the details - we will get to this later

    logistic.map = function(r, n0, k, tmax){
        # r: growth rate
        # x: initial value
        # T: Max time steps
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

<iframe width='100%' height='1000' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>
