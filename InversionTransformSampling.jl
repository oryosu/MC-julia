### I followed implementation of python in this blog
### http://aidiary.hatenablog.com/entry/20140620/1403272044
###
### created 03/18/2018 ryosuke sonobe
###


# random number generation
randoms = rand(10000)

# exponential distribution
expo_dist = - 1.0 * log(1-randoms)

# show the graph
using(Plots)
gr()
histogram(expo_dist, nbins=50)

# logistic distribution

log_dist = Float64[log(n/(1-n)) for n in randoms]
histogram(log_dist, nbins=50)

# Cauchy distribution

cau_dist = Float64[tan(pi*(n-0.5)) for n in randoms]
histogram(cau_dist, nbins=50)

# modified because too big/small numbers were also generated
cau_distr = tan(pi*(randoms-0.5))
cau_distr = filter((n) -> -10 < n < 10 , cau_distr)
histogram(cau_distr, nbins=50)

# Gamma distribution

# It's hard to calcurate gamma distribution's cumulative distribution function(CDF),
# so I used julia base function; gammainvcdf()
using(StatsFuns)

theta = 2.0
k = 2.0
gamma_dist = [theta * gammainvcdf(k, theta, n) for n in randoms]
histogram(gamma_dist, nbins=50)

# Beta distribution

# Same as the case of Gamma distribution, I used betainvcdf()

alpha = 5.0
beta = 1.0
beta_dist = [betainvcdf(alpha, beta, n) for n in randoms]
histogram(beta_dist, nbins=50)
