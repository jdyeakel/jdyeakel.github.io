---
title: "A guide for converting exponential growth to logistic growth"
author: "J.D. Yeakel"
date: "March 13, 2025"
geometry: margin=1in
---


## 1. Simple (Exponential) Growth

### Assumptions
1. **Constant birth rate** (per capita): $b$  
2. **Constant death rate** (per capita): $d$

Hence, per capita **net growth rate** $r$ (i.e., “births minus deaths” per individual) is:
$$
r = b - d.
$$

### Resulting Differential Equation
Let $N(t)$ be the population size at time $t$. Then exponential growth is modeled by:

$$
\frac{dN}{dt} = r \, N.
$$

- **Interpretation**: The larger the population, the faster it grows, with no upper bound.

---

## 2. Adding More Realism: Density-Dependence

In nature, birth and death rates tend to change with population size:

1. **Per capita birth rate** **declines** as resources become limited, so we assume:

   $$
   b' = b - a N \quad (\text{where } a \text{ is a positive constant})
   $$

   - When $N$ is small, $b' \approx b$.
   - As $N$ gets larger, the term $-\,aN$ makes the **birth rate** go down.

2. **Per capita death rate** **increases** as crowding intensifies, so we assume:

   $$
   d' = d + c N \quad (\text{where } c \text{ is a positive constant})
   $$

   - When $N$ is small, $d' \approx d$.
   - As $N$ gets larger, the term $+\,cN$ makes the **death rate** go up.

---

## 3. Net Per Capita Growth Rate

From these two modified rates:
$$
\text{net per capita rate} = b' - d' = (b - aN) \;-\; (d + cN).
$$

Simplify this:
$$
b' - d' = (b - d) \;-\; (a + c)\,N.
$$

Recalling that $r = b - d$, define $\alpha = a + c$. Then:
$$
b' - d' = r - \alpha \, N.
$$

Hence, **the net growth rate** for the whole population $N$ is:

$$
\frac{dN}{dt} = \left[r - \alpha N\right] \, N.
$$

---

## 4. The Logistic Growth Equation

Let’s rearrange this into a more familiar form. Factor out $r$:

$$
\frac{dN}{dt} = rN - \alpha N^2 = rN\bigl(1 - \tfrac{\alpha}{r}N \bigr).
$$

Define the **carrying capacity** $K$ by

$$
K = \frac{r}{\alpha}.
$$

Then

$$
\frac{dN}{dt} 
= rN\Bigl(1 - \frac{N}{K}\Bigr).
$$

This is the **logistic growth equation**.

### Biological Interpretation
- $r$: intrinsic rate of increase (as in exponential growth).
- $K$: carrying capacity. Once $N$ is near $K$, growth slows and eventually stops.

---

## 5. Why This Matters

- **Initial Exponential Phase**: When $N$ is small, $\frac{N}{K}$ is close to 0, so growth looks nearly exponential ($\frac{dN}{dt} \approx rN$).
- **Resource Limitation**: As $N$ grows, limited resources and increased crowding reduce births, increase deaths, and slow the growth.
- **Equilibrium**: In the long run, the population stabilizes around $N = K$, where births and deaths balance out.

---

## 6. Recap

1. **Start with** a simple exponential model, $\frac{dN}{dt} = rN$.
2. **Acknowledge limitations**: constant birth and death rates ignore environmental constraints.
3. **Incorporate density-dependence**:
   - Birth rates **decrease** with $N$.
   - Death rates **increase** with $N$.
4. **Combine** these rates to find a net per capita rate of $r - \alpha N$.
5. **Obtain** $\frac{dN}{dt} = rN - \alpha N^2$.
6. **Rewrite** in logistic form: $\frac{dN}{dt} = rN\left(1 - \frac{N}{K}\right)$.

That’s it! Understanding each step helps clarify why real populations don’t grow forever but instead level off at a carrying capacity.