---
layout: pagetrimnobio
title: "Demo 4 :: Competition"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

[< Back to Course Page]({{ site.url }}/teaching/ecology)  
<br>

## Visualizing competition isoclines and dynamics

Below is a code block where the Lotka Volterra competition system is simulated.
The main plot will show the $$N_1$$ (red) and $$N_2$$ (blue) isoclines, as well as the starting point and trajectory of the $$N_1$$ and $$N_2$$ populations over time (green circle and line, respectively). On the top right inset is a plot of the two $$N_1$$ and $$N_2$$ population sizes plotted over time. Make sure that you understand how the isoclines determine the flow and direct how the combined trajectories of $$N_1$$ and $$N_2$$ (green) change over time, and how this corresponds to the population sizes shown in the inset.


```R
    library(RColorBrewer)
    library(deSolve)
    pal = brewer.pal(3,'Set1')
    # Define the Rates function
    comp.flow = function(r1,r2,alpha,beta,K1,K2,N1start,N2start,tmax) {
        # LV.comp = function(r1,r2,alpha,beta,K1,K2,N1start,N2start,tmax) {
        yini = c(N1 = N1start,N2 = N2start)
        
        fmap = function (t, y, parms) {
        with(as.list(y), {
            dN1 <- r1*y[1]*(1 - (y[1] + alpha*y[2])/K1)
            dN2 <- r2*y[2]*(1 - (y[2] + beta*y[1])/K2)
            list(c(dN1,dN2))
        })
        }
        
        times <- seq(from = 0, to = tmax, by = 0.1) 
        out   <- ode(y = yini, times = times, func = fmap, parms = NULL)

        N1traj = out[,2];
        N2traj = out[,3];
        timeline = out[,1];

        maxtraj = max(c(N1traj,N2traj));

        N1size = seq(0,maxtraj);
        N2size = seq(0,maxtraj);

        n1_isocline = K1/alpha - N1size/alpha;
        n2_isocline = K2 - beta*N1size;

        par(fig = c(0,1,0,1))
        plot(N1size,n1_isocline,type='l',lwd=2,col=pal[1],xlim=c(0,maxtraj),ylim = c(0,maxtraj),xlab='N1 population',ylab='N2 population')
        lines(N1size,n2_isocline,lwd=2,col=pal[2])
        points(N1start,N2start,pch=16,cex=2,col=pal[3])
        lines(N1traj,N2traj,col=pal[3],lwd=2)
        legend(0,120,c('N1 isocline','N2 isocline'),pch=16,col=pal)

        par(fig = c(0.5,1, 0.5, 1), new = T)
        plot(timeline,N1traj,type='l',col=pal[1],xlab='Time',ylab='Pop. size',lwd=2,ylim = c(0,maxtraj))
        lines(timeline,N2traj,type='l',col=pal[2],lwd=2,)


        
    }
    # Plug in parameter values and run
    comp.flow(r1 = 0.2, r2 = 0.1, alpha = 2, beta = 0.5, K1 = 120, K2 = 80, N1start = 20, N2start = 10, tmax = 500)
```

<iframe width='100%' height='1000' src='https://rdrr.io/snippets/embed/?code=%23Paste%20code%20here' frameborder='0'></iframe>

Here are some combination to try out. Practice interpreting what these mean
*   `comp.flow(r1 = 0.2, r2 = 0.1, alpha = 2, beta = 0.5, K1 = 120, K2 = 80, N1start = 20, N2start = 10, tmax = 500)`
*   `comp.flow(r1 = 0.2, r2 = 0.1, alpha = 2, beta = 0.5, K1 = 150, K2 = 50, N1start = 20, N2start = 10, tmax = 500)`
*   `comp.flow(r1 = 0.2, r2 = 0.1, alpha = 2, beta = 2, K1 = 120, K2 = 80, N1start = 5, N2start = 45, tmax = 500)`
*   `comp.flow(r1 = 0.2, r2 = 0.1, alpha = 2, beta = 2, K1 = 120, K2 = 80, N1start = 20, N2start = 10, tmax = 500)`