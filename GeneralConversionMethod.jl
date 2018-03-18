### GENERAL CONVERSION METHOD by julia
###
### created 03/18/2018 ryosuke sonobe
###
###

using(Distributions)
using(Plots)
nbins = 50


### exponential randoms -> Chi square randoms
# degrees of freedom of chi square distribution
df = 6
nu = Int8(df / 2)
# generate chi square randoms
chi_dist = [2n for n in sum(randexp(nu, 10000), 1)]'
histogram(chi_dist, nbins=nbins)


### exponential randoms -> Gamma randoms
# parameters of gamma distribution
k = 2
theta = 2.0
# generate gamma randoms
gamma_dist = [theta * n for n in sum(randexp(k, 10000),1)]'
histogram(gamma_dist, nbins=nbins)


### expoonential randoms -> beta randoms
#parameters of beta distribution
a = 5.0
b = 1.0
# generate beta randoms
randoms = randexp(Int8(a + b), 10000)
beta_dist = [sum(randoms[:,n][1:Int8(a),]) / sum(randoms[:,n]) for n=1:10000]
histogram(beta_dist, nbins=nbins)
