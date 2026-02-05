---
layout: pagetrimnobio
title: "Demo 1: Cobweb Diagrams"
tags: [about, Jekyll, theme, responsive]
modified: 2014-08-08T20:53:07.573882-04:00
comments: true
---

[< Back to Course Page]({{ site.url }}/teaching/ecology)  
<br>

## Cobweb Diagrams

For the continuous-time logistic equation, we were able to learn a lot about the dynamics of the system by graphically analyzing the 'flow' when we plotted $${\rm d}n/{\rm dt}$$ (on the y-axis) versus $$n$$ (on the x-axis). There is an analogous method for the discrete time logistic equation, however there is a little more to it that requires careful consideration.

For the discrete-time system, we will graphically analyze the plot of $$n(t+1)$$ (on the y-axis) as a function of $$n(t)$$ (on the x-axis). As with the continuous-time equation, this produces a parabola. The parabola represents the mapping from $$n(t)$$ to $$n(t+1)$$. In other words, if our population is at value $$n(t)$$, to find the next value at time $$t+1$$, we identify the value of $$n(t)$$ on the x-axis, draw a vertical line up to the parabola, and this gives us the value at $$n(t+1)$$. We then reiterate the process. We can make life simpler for ourselves if we also draw the 1:1 line in the same plot (where $$n(t) = n(t+1)$$). Instead of going back to the x-axis for every $$n(t)$$ to draw the vertical line up to the parabola (giving us $$n(t+1)$$), we can simply draw a horizontal line to the 1:1 line (resetting $$n(t+1)$$ to $$n(t)$$), and than a vertical line up or down to the parabola to get at the next value of $$n(t+1)$$. Below we observe the process for tracing the dynamics of a discrete time system in this way:
*   First, find $$n(t)$$ on the x-axis
*   Draw a vertical line up to the parabola. This is $$n(t+1)$$
*   Draw a horizontal line over to the 1:1 line. This resets $$n(t)$$ along the x-axis
*   Draw a vertical line *up* or *down* to the parabola. This gives us $$n(t+1)$$
*   Draw a horizontal line over to the 1:1 axis
*   Repeat, repeat, repeat!

The above algorithm constitutes what we call a *cobweb diagram*. We implement this algorithm via simulation in the code block below. Run the same parameter sets that you encoded above into the cobweb diagram below. ***Make sure you understand what the cobweb diagram is showing.*** Confirm that the time-simulation of the discrete-logistic equation and the cobweb diagram are telling us the same thing.

```R
    logistic.cobweb = function(rd,K,N0,tmax) {
        N = numeric(tmax)
        N[1] = N0
        for (t in 2:tmax) {
            Nt = N[t-1] + rd*N[t-1]*(1 - N[t-1]/K)
            N[t] = Nt 
        }
        Ntx = seq(0,max(N)*(1+0.5),length.out=100)
        Nty = Ntx + rd*Ntx*(1 - Ntx/K)
        xymax = max(N)
        plot(Ntx,Nty,type='l',xlab="Population size n(t)", ylab="Population size n(t+1)",lwd=2,xlim=c(0,xymax),ylim=c(0,xymax))
        lines(seq(-1,2),seq(-1,2),col='gray',lwd=2)
        for (t in 1:(tmax-1)) {
            #draw segments
            segments(x0=N[t],y0=N[t],x1=N[t],y1=N[t+1],col='blue')
            segments(x0=N[t],y0=N[t+1],x1=N[t+1],y1=N[t+1],col='blue')
        }
    }
    logistic.cobweb(rd = 1, K = 1, N0=0.01, tmax=40)

```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20code%20here' frameborder='0'></iframe>


> ### Diving Deeper
> 1. Across intervals of 0.1, at what value of $$r_d$$ do the dynamics become cyclic? Unpredictable?
> 2. Compare `rd=1.8` to `rd=2.0`. What is the primary difference between these outcomes. Compare both the results of the cobweb diagram and the $$n(t)$$ vs. $$t$$ plot to establish your interpretation of what is going on.
> 3. Do we observe cycles or chaotic dynamics in the continuous-time logistic model?  
> 4. Given these differences, what are the long-term implications for discrete-time vs. continuous-time population dynamics? 
> 5. What ecological factors might promote continuous- vs. discrete-time population dynamics?

## Compare the Continuous- and Discrete-time systems directly

This code block allows us to directly compare the temporal dynamics of continuous-time and discrete-time logistic populations directly. Use this to inform your answers to the above questions.

```R
    library(deSolve)
    pop.combined = function(r,K,N0,tmax) {
        #Continuous model
        yini = c(N = N0)
        fmap = function (t, y, parms) {
        with(as.list(y), {
            dN <- r*N*(1 - (N/K))
            list(dN)
        })
        }
        
        times <- seq(from = 1, to = tmax, by = 0.1) 
        out   <- ode(y = yini, times = times, func = fmap, parms = NULL)
        
        # Discrete model
        Nd = numeric(tmax)
        Nd[1] = N0
        for (t in 2:tmax) {
            Ndt = Nd[t-1] + r*Nd[t-1]*(1 - Nd[t-1]/K)
            Nd[t] = Ndt 
        }
        maxN = max(c(Nd,out[,2]))
        plot(out, lwd = 2,xlab='Time',ylab='Population n(t)',col='blue',ylim=c(0,maxN))
        lines(Nd,col='red',lwd=2)
    }
    pop.combined(r = 1,K = 1,N0 = 0.01,tmax = 40)
```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20code%20here' frameborder='0'></iframe>



## Displacement dynamics near a steady state

So far, the cobweb diagram has helped us *see* how a discrete-time system maps $$n(t)$$ to $$n(t+1)$$. Here we take the next step and make that “mapping” quantitative by focusing on what happens **near a steady state**.

Suppose the system has a fixed point $$n^*$$ (a steady state), meaning

$$
\begin{equation}
n^* = f(n^*).  
\end{equation}
$$

Now imagine the population is not exactly at $$n^*$$, but *very close* to it. We write the current population size as

$$
\begin{equation}
n(t) = n^* + \epsilon(t),
\end{equation}
$$

where $$\epsilon(t)$$ is the displacement from the steady state. This displacement can be positive (above $$ n^* $$) or negative (below $$ n^* $$).

The central question is: *does the displacement shrink or grow over time?*  

---

If $$ \epsilon(t) $$ gets smaller as $$t$$ increases, the system is returning to the steady state and $$n^*$$ is **stable**. If $$\epsilon(t)$$ grows, the system is moving away and $$n^*$$ is **unstable**. And in discrete time, there is an additional wrinkle: the sign of $$\epsilon(t)$$ can flip from one time step to the next, producing oscillatory convergence (or oscillatory divergence).


In the code demo, we simulate the logistic difference equation and explicitly track $$\epsilon(t)=n(t)-n^*$$. We then compare the “true” displacement dynamics to what we would expect from the local linear approximation (introduced next). The goal is to confirm—numerically and visually—that near a steady state, the behavior of the full nonlinear model is well summarized by a single number: the local slope $$\lambda$$.

---

### Taylor approximation and the origin of $$\lambda$$

The displacement idea becomes powerful once we connect it to a standard tool: a Taylor approximation.

Start again from the general discrete-time model

$$
n(t+1) = f(n(t)).
$$

If we are close to a steady state $$n^*$$, then $$n(t)=n^*+\epsilon(t)$$ with $$\epsilon(t)$$ small. We want to express the next displacement $$\epsilon(t+1)$$ in terms of the current displacement $$\epsilon(t)$$. Using a first-order Taylor approximation of $$f$$ near $$n^*$$,

$$
f(n^*+\epsilon) \approx f(n^*) + f'(n^*)\,\epsilon.
$$

Because $$n^*$$ is a fixed point, $$f(n^*)=n^*$$. Substituting into the displacement definition,

$$
\epsilon(t+1) = n(t+1)-n^* = f(n^*+\epsilon(t)) - n^*
\approx \big(n^* + f'(n^*)\,\epsilon(t)\big) - n^*
= f'(n^*)\,\epsilon(t).
$$

This motivates the definition

$$
\lambda = f'(n^*),
$$

so that, near the steady state,

$$
\epsilon(t+1) \approx \lambda\,\epsilon(t).
$$

This is the entire stability test in one line:

- If $$-1<\lambda<1$$, displacement shrinks and the steady state is **stable**.
- If $$\lambda<-1$$ or $$\lambda>1$$, displacement grows and the steady state is **unstable**.
- If $$\lambda>0$$, the displacement tends to stay on the same side of $$n^*$$.
- If $$\lambda<0$$, the displacement tends to switch sides each step (oscillations).


```R
############################################################
## Displacement + Taylor approximation near a steady state  ##
############################################################

# Discrete-time logistic map (same form as cobweb code)
f_logistic <- function(N, rd, K) {
  N + rd*N*(1 - N/K)
}

# One-step linearization near a steady state n*
# epsilon(t+1) ≈ lambda * epsilon(t), where lambda = f'(n*)
lambda_logistic <- function(nstar, rd, K) {
  # f'(N) = 1 + rd - 2*rd*N/K
  1 + rd - 2*rd*nstar/K
}

# Identify fixed points for this model:
# n* = 0 and n* = K (for rd > 0)
fixed_points_logistic <- function(K) c(0, K)

############################################################
## Demo: compare "true displacement" vs linear prediction  ##
############################################################

displacement.demo <- function(rd = 1.8, K = 1, 
                              nstar = K,          # choose 0 or K
                              eps0 = 0.05,        # initial displacement: N0 = n* + eps0
                              tmax = 30) {
  
  # Setup
  N_true <- numeric(tmax)
  eps_true <- numeric(tmax)
  eps_lin  <- numeric(tmax)
  
  N_true[1] <- nstar + eps0
  eps_true[1] <- eps0
  
  lam <- lambda_logistic(nstar, rd, K)
  eps_lin[1] <- eps0
  
  # Iterate
  for (t in 2:tmax) {
    N_true[t]   <- f_logistic(N_true[t-1], rd, K)
    eps_true[t] <- N_true[t] - nstar
    eps_lin[t]  <- lam * eps_lin[t-1]
  }
  
  # Plot displacement over time (true vs linearized)
  tt <- 1:tmax
  ymax <- max(abs(c(eps_true, eps_lin)))
  plot(tt, eps_true, type="o", pch=16, lwd=2,
       xlab="Time t", ylab=expression(epsilon(t) == n(t) - n^"*"),
       ylim=c(-ymax, ymax))
  lines(tt, eps_lin, type="o", pch=1, lwd=2)
  abline(h=0, lwd=1)
  legend("topright",
         legend=c("True displacement", "Linear approx: eps(t)=lambda^t eps(0)"),
         lwd=2, pch=c(16,1), bty="n")
  
  # Print key quantities
  cat("\n--- Displacement / linearization summary ---\n")
  cat("Model: n(t+1) = n(t) + rd*n(t)*(1 - n(t)/K)\n")
  cat("Chosen fixed point n* =", nstar, "\n")
  cat("rd =", rd, "  K =", K, "\n")
  cat("lambda = f'(n*) =", lam, "\n")
  cat("Stability criterion: |lambda| < 1 (stable), |lambda| > 1 (unstable)\n")
  cat("Here: |lambda| =", abs(lam), "\n\n")
  
  invisible(list(N_true=N_true, eps_true=eps_true, eps_lin=eps_lin, lambda=lam))
}

############################################################
## Quick-use examples                                     ##
############################################################

# 1) Stable approach to K (no sign-flip if lambda > 0)
# displacement.demo(rd=1.2, K=1, nstar=1, eps0=0.2, tmax=25)

# 2) Stable but oscillatory approach to K (lambda < 0, |lambda|<1)
# displacement.demo(rd=1.8, K=1, nstar=1, eps0=0.2, tmax=25)

# 3) Borderline at the onset of 2-cycle (lambda = -1 at rd=2 for n*=K)
# displacement.demo(rd=2.0, K=1, nstar=1, eps0=0.05, tmax=25)

# 4) Unstable (|lambda|>1) at K for rd > 2
# displacement.demo(rd=2.1, K=1, nstar=1, eps0=0.05, tmax=25)
```

<iframe width='100%' height='500' src='https://rdrr.io/snippets/embed/?code=%23Paste%20code%20here' frameborder='0'></iframe>




In the Taylor demo (below), we make this approximation visible by plotting the *true* mapping

$$
\epsilon(t+1)=f(n^*+\epsilon(t)) - n^*
$$

against the *linear* prediction

$$
\epsilon(t+1)=\lambda\,\epsilon(t),
$$

and showing that they agree only when $$\epsilon(t)$$ is sufficiently small. That is the key conceptual point: **$$\lambda$$ is a local statement**, and the Taylor approximation is exactly the step that makes that locality explicit.


```R
############################################################
## Visualize the Taylor approximation directly  ##
############################################################

# Discrete-time logistic map (same form as your cobweb code)
f_logistic <- function(N, rd, K) {
  N + rd*N*(1 - N/K)
}

# One-step linearization near a steady state n*
# epsilon(t+1) ≈ lambda * epsilon(t), where lambda = f'(n*)
lambda_logistic <- function(nstar, rd, K) {
  # f'(N) = 1 + rd - 2*rd*N/K
  1 + rd - 2*rd*nstar/K
}

# Identify fixed points for this model:
# n* = 0 and n* = K (for rd > 0)
fixed_points_logistic <- function(K) c(0, K)

taylor.visual <- function(rd = 1.8, K = 1, nstar = K, eps_range = 0.25) {
  lam <- lambda_logistic(nstar, rd, K)
  
  # Compare f(n* + eps) - n* to linear prediction lam*eps
  eps <- seq(-eps_range, eps_range, length.out=200)
  true_map <- f_logistic(nstar + eps, rd, K) - nstar
  lin_map  <- lam * eps
  
  ymax <- max(abs(c(true_map, lin_map)))
  plot(eps, true_map, type="l", lwd=2,
       xlab=expression(epsilon(t)), 
       ylab=expression(epsilon(t+1)),
       ylim=c(-ymax, ymax))
  lines(eps, lin_map, lwd=2, lty=2)
  abline(h=0, v=0, lwd=1)
  legend("topleft",
         legend=c(expression("True: " * epsilon(t+1)==f(n^"*"+epsilon(t))-n^"*"),
                  expression("Linear: " * epsilon(t+1)==lambda*epsilon(t))),
         lwd=2, lty=c(1,2), bty="n")
  
  cat("\n--- Taylor visualization summary ---\n")
  cat("n* =", nstar, "  rd =", rd, "  K =", K, "\n")
  cat("lambda = f'(n*) =", lam, "\n\n")
}

# Example:
# taylor.visual(rd=1.8, K=1, nstar=1, eps_range=0.25)
```

<iframe width='100%' height='1000' src='https://rdrr.io/snippets/embed/?code=%23Paste%20code%20here' frameborder='0'></iframe>