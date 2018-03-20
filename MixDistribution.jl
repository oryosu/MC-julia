### Implementation of randoms generation from mix distribution by julia.
###
### created 03/20/2018 ryosuke sonobe
###


### generate student-t distribution
###
### 1. generate chi square randoms.
### 2. generate normal randoms such that average 0; variance nu/y.
### 3. it is the student-t randoms such that parameter nu.
###

using Distributions
using Plots
gr()

# student-t parameter
nu = 2

# 1. generate chi square randoms.
chi_randoms = rand(Chisq(1.0), 10000)

# 2,3. generate student-t randoms from normal distribution
t_randoms = [rand(Normal(0, sqrt(nu/m))) for m in chi_randoms]

# modified
t_randoms = filter((x)->-5 < x < 5, t_randoms)
histogram(t_randoms, nbins=50)


### generate negative binomial randoms
###
### 1. generate Gamma(n, (1-p)/p) randoms y.
### 2. generate Poisson randoms x from y.
### 3. x is negative binomial randoms; parameters(n, p)
###

using Distributions
using Plots
gr()

# parameters of negative binomial randoms
n = 6
p = 0.3

#1. generate Gamma randoms
g_randoms = rand(Gamma(n, (1-p)/p), 10000)

# 2,3. generate nbr from Poisson distribution
nb_randoms = [rand(Poisson(y), 1)[1] for y in g_randoms]

histogram(nb_randoms, nbins=50)
