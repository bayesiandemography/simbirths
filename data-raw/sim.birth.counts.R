
load("data/sim.birth.rates.base.rda")
load("data/sim.birth.rates.distn.rda")
load("data/sim.birth.rates.level.rda")
load("data/sim.birth.standard.rda")
load("data/sim.fem.popn.rda")
load("data/sim.fem.popn.small.rda")

set.seed(0)

sim.birth.standard <- as.logical(sim.birth.standard)
sim.fem.popn <- as.numeric(sim.fem.popn)
sim.fem.popn.small <- as.numeric(sim.fem.popn.small)

sim.birth.counts.base <- rpois(n = length(sim.birth.rates.base),
                               lambda = sim.birth.rates.base * sim.fem.popn)
sim.birth.counts.distn <- rpois(n = length(sim.birth.rates.distn),
                                lambda = sim.birth.rates.distn * sim.fem.popn)
sim.birth.counts.level <- rpois(n = length(sim.birth.rates.level),
                                lambda = sim.birth.rates.level * sim.fem.popn)
sim.birth.counts.base.small <- rpois(n = length(sim.birth.rates.base),
                                     lambda = sim.birth.rates.base * sim.fem.popn.small)
sim.birth.counts.distn.small <- rpois(n = length(sim.birth.rates.distn),
                                      lambda = sim.birth.rates.distn * sim.fem.popn.small)
sim.birth.counts.level.small <- rpois(n = length(sim.birth.rates.level),
                                      lambda = sim.birth.rates.level * sim.fem.popn.small)

sim.birth.counts.distn[sim.birth.standard] <- sim.birth.counts.base[sim.birth.standard]
sim.birth.counts.level[sim.birth.standard] <- sim.birth.counts.base[sim.birth.standard]
sim.birth.counts.distn.small[sim.birth.standard] <- sim.birth.counts.base.small[sim.birth.standard]
sim.birth.counts.level.small[sim.birth.standard] <- sim.birth.counts.base.small[sim.birth.standard]

sim.birth.counts.base <- array(sim.birth.counts.base,
                               dim = dim(sim.birth.rates.base),
                               dimnames = dimnames(sim.birth.rates.base))
sim.birth.counts.distn <- array(sim.birth.counts.distn,
                                dim = dim(sim.birth.rates.distn),
                                dimnames = dimnames(sim.birth.rates.distn))
sim.birth.counts.level <- array(sim.birth.counts.level,
                                dim = dim(sim.birth.rates.level),
                                dimnames = dimnames(sim.birth.rates.level))
sim.birth.counts.base.small <- array(sim.birth.counts.base.small,
                                     dim = dim(sim.birth.rates.base),
                                     dimnames = dimnames(sim.birth.rates.base))
sim.birth.counts.distn.small <- array(sim.birth.counts.distn.small,
                                      dim = dim(sim.birth.rates.distn),
                                      dimnames = dimnames(sim.birth.rates.distn))
sim.birth.counts.level.small <- array(sim.birth.counts.level.small,
                                      dim = dim(sim.birth.rates.level),
                                      dimnames = dimnames(sim.birth.rates.level))

save(sim.birth.counts.base,
     file = "data/sim.birth.counts.base.rda",
     compress = "bzip2")
save(sim.birth.counts.distn,
     file = "data/sim.birth.counts.distn.rda",
     compress = "bzip2")
save(sim.birth.counts.level,
     file = "data/sim.birth.counts.level.rda",
     compress = "bzip2")
save(sim.birth.counts.base.small,
     file = "data/sim.birth.counts.base.small.rda",
     compress = "bzip2")
save(sim.birth.counts.distn.small,
     file = "data/sim.birth.counts.distn.small.rda",
     compress = "bzip2")
save(sim.birth.counts.level.small,
     file = "data/sim.birth.counts.level.small.rda",
     compress = "bzip2")

