using Plots

# Define constants
tmax = 500
xc = 2
xmax = 10
K = 150
nmax = K*2

# Define cost vectors
c = [1, 1]
p = [0, 2] .* K
f = [1, 0.5]
d = [0.01, 0.02]
r = [1, 0]

rscale = 0.5

# Initialize W and D arrays
W = zeros(Float64, xmax, nmax, tmax)
D = zeros(Int64, xmax, nmax, tmax)  # Assuming D holds integer indices

# Set up final conditions for W
for x in 1:xmax
    for n in 1:nmax
        W[x, n, tmax] = x <= xc ? 0 : maximum(r .* ((x*rscale) / xmax))
    end
end

# Boundary condition function
function bc(xvalue)
    return clamp(xvalue, xc, xmax)
end

# Interpolation function
function interpolate(xvalue, nvalue, W, t)
    lowx = floor(Int, xvalue)
    highx = lowx + 1
    px = highx - xvalue
    lown = floor(Int, nvalue)
    highn = lown + 1
    pn = highn - nvalue

    Winterp = 0.0
    if pn < 1
        if px == 1
            Winterp += px * pn * W[lowx, lown, t+1]
            Winterp += px * (1-pn) * W[lowx, highn, t+1]
        else
            # Winterp += px * pn * W[lowx, lown, t+1]
            # Winterp += (1-px) * pn * W[highx, lown, t+1]
            # Winterp += (1-px) * (1-pn) * W[highx, highn, t+1]
            Winterp += px * pn * W[lowx,lown,t+1]
            Winterp += px * (1-pn) * W[lowx,highn,t+1]
            Winterp += (1-px) * pn * W[highx,lown,t+1]
            Winterp += (1-px) * (1-pn) * W[highx,highn,t+1]
        end
    else
        if px == 1
            Winterp += px * pn * W[lowx, lown, t+1]
        else
            Winterp += px * pn * W[lowx,lown,t+1]
            Winterp += (1-px) * pn * W[highx,lown,t+1]
        end
    end

    return Winterp
end

# Main loop
for t in (tmax-1):-1:1
    for n in 1:nmax
        for x in (xc+1):xmax
            value = zeros(length(c))
            for i in 1:length(c)
                # What is x if you find food?
                xp = x - c[i] + p[i]/n
                # What is x if you don't find food?
                xpp = x - c[i]

                xp = bc(xp)
                xpp = bc(xpp)

                Wxp = interpolate(xp, n, W, t)
                Wxpp = interpolate(xpp, n, W, t)

                value[i] = r[i]*((x*rscale)/xmax) + (1-d[i])*f[i]*Wxp + (1-d[i])*(1-f[i])*Wxpp
            end
            maxvalue = maximum(value)
            istar = argmax(value)  # This returns the index of the maximum value

            W[x, n, t] = maxvalue
            D[x, n, t] = istar
        end
    end
end

heatmap(D[:,1,:])

# The W and D arrays can now be used for further processing
using Random, Plots, UnicodePlots

pop0 = 5
X = fill(floor(Int, xmax/2), pop0)
pop = zeros(Int, tmax-1)

for t in 1:(tmax-1)
    pop[t] = length(X)
    
    offspring = 0
    
    if pop[t] > 0
        for i in 1:length(X)
            state = X[i]
            dec = D[state, pop[t], t]
            
            # Reproduce
            r_draw = rand()
            if r_draw > (1 - r[dec] * (state * rscale) / xmax)
                offspring += 1
            end
            
            # Do I die during this activity?
            d_draw = rand()
            
            # IF you survive, look for food
            # If d_draw = 1, then you always survive
            if d_draw < (1 - d[dec])
                # Do I find food during this activity?
                f_draw = rand()
                
                if f_draw < f[dec]
                    # Do find food
                    newstate = state + (p[dec] / pop[t]) - c[dec]
                else
                    # Don't find food
                    newstate = state - c[dec]
                end
                
                # Apply boundary conditions
                newstate = Int64(floor(bc(newstate)))
                
            else
                newstate = xc
            end
            
            # update state for next time interval
            X[i] = newstate
        end
        
        # remove the dead
        stayalive = filter(x -> x >= xc+1, X)
        X = copy(stayalive)
        
        # add offspring
        Xadd = floor(Int, offspring)
        offspringstart = floor(Int, xmax/2.5)
        if (length(X) + Xadd) > nmax
            # Implement any necessary logic when the population exceeds nmax
            newX = repeat([offspringstart], nmax)
            newX[1:length(X)] = X
            X = copy(newX)
        else
            newX = fill(offspringstart, Xadd)
            X = vcat(X, newX)
        end
    end
end

# Plotting
plot(pop, label="N(t)", xlabel="Time", ylabel="N(t)")

plot(pop[1:end-1], pop[2:end], label="N(t+1) vs N(t)",
      xlim=(0, 300), ylim=(0, 300), xlabel="N(t)", ylabel="N(t+1)")
plot!(0:300, 0:300, line=:dash, label="y=x")
