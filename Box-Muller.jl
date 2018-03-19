### implementation of Box-Muller method
###
### created 03/18/2018 ryosuke sonobe
###
###

using(Plots)
gr()

### Box-Muller method
# method to make 2 normal randoms from 2 uniform randoms
# uniform randoms from independent for each other
randoms1 = rand(100000)
randoms2 = rand(100000)
# Box-Muller algorithm
bm1 = [sqrt(-2log(ra1)) * cos(2pi * ra2) for (ra1, ra2) in zip(randoms1, randoms2)]
bm2 = [sqrt(-2log(ra1)) * sin(2pi * ra2) for (ra1, ra2) in zip(randoms1, randoms2)]

histogram(bm1, nbins=50)
histogram(bm2, nbins=50)

### random numbers generation using Central Limit Theorem; CLT
using Distributions
m = Uniform(-0.5, 0.5)
randoms = rand(m, 12, 10000)

# generate normal random by CLT
n_dist = [sum(randoms[:, n]) for n =1:10000]
histogram(n_dist, nbins=50)
