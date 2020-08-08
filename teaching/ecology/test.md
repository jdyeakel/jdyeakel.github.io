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

There is an imporant difference between using this web-tool vs. using RStudio installed on your computer. With the web-tool, all of the code must be entered together and run all at once. With RStudio installed on your machine, you can run one line at a time.

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
    print(final_1)

    # Remember your order of operations! (PEMDAS)
    # By adding parentheses, we change the calculation
    # We will save this - different calculation - to the object final_2
    final_2 = (x + y)/z
    print(final_2)
```


<iframe width='100%' height='1000' src='https://rdrr.io/snippets/embed/?code=%23Paste%20text%20here' frameborder='0'></iframe>