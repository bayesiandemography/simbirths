
labels.age.groups <- c(paste(seq(15, 35, 5), seq(19, 39, 5), sep = "-"), "40+")

## Input data: published data on fertility in 2006
## downloaded from Stats NZ website
asfr.total <- c(0.02884,
                0.07135,
                0.10827,
                0.12100,
                0.06533,
                0.01266)
names(asfr.total) <- labels.age.groups

asfr.maori <- c(0.07096,
                0.15006,
                0.14334,
                0.11120,
                0.06033,
                0.01503)
names(asfr.maori) <- labels.age.groups

n.age <- length(labels.age.groups)
n.region.base <- 24
n.region.perturbed <- 6
n.region <- n.region.base + n.region.perturbed
n.time <- 3
n.cell <- n.age * n.region * n.time
n.iteration <- 100
tau.region <- 0.05 ## standard deviation of region effect
tau.time <- 0.05 ## standard deviation of time effect
sigma <- 0.1 ## standard deviation of log theta

age.effect.base <- log(asfr.total)
age.effect.alt <- log(prop.table(asfr.maori) * sum(asfr.total))

increment.level <- log(0.2)

dimnames <- list(age = labels.age.groups,
                 region = paste("Region", seq_len(n.region)),
                 time = seq_len(n.time))
dim <- unname(sapply(dimnames, length))
nonstandard.reg <- paste("Region", seq(length = n.region.nonstandard, to = n.region))
nonstandard.time <- n.time
cell <- expand.grid(dimnames)
non.standard.here <- cell$region %in% nonstandard.reg & cell$time == nonstandard.time
sim.birth.standard <- array(!non.standard.here,
                            dim = dim,
                            dimnames = dimnames)

ans.base <- vector(mode = "list", length = n.iteration)
ans.distn <- vector(mode = "list", length = n.iteration)
ans.level <- vector(mode = "list", length = n.iteration)

set.seed(0)

for (i in seq_len(n.iteration)) {
    region.effect <- rnorm(n = n.region, sd = tau.region)
    time.effect <- rnorm(n = n.time, sd = tau.time)
    mean.base <- outer(outer(age.effect.base, region.effect, "+"),
                       time.effect, "+")
    mean.distn <- outer(outer(age.effect.alt, region.effect, "+"),
                        time.effect, "+")
    mean.level <- mean.base + increment.level
    log.rate.base <- rnorm(n = n.cell,
                           mean = mean.base,
                           sd = sigma)
    log.rate.distn <- rnorm(n = n.cell,
                            mean = mean.distn,
                            sd = sigma)
    log.rate.level <- rnorm(n = n.cell,
                            mean = mean.distn,
                            sd = sigma)
    rate.base <- exp(log.rate.base)
    rate.distn <- exp(log.rate.distn)
    rate.level <- exp(log.rate.level)
    rate.distn[sim.birth.standard] <- rate.base[sim.birth.standard]
    rate.level[sim.birth.standard] <- rate.base[sim.birth.standard]
    ans.base[[i]] <- rate.base
    ans.distn[[i]] <- rate.distn
    ans.level[[i]] <- rate.level
}

dimnames.all <- c(dimnames,
                  list(iteration = seq_len(n.iteration)))
sim.birth.rates.base <- array(unlist(ans.base),
                             dim = sapply(dimnames.all, length),
                             dimnames = dimnames.all)
sim.birth.rates.distn <- array(unlist(ans.distn),
                              dim = sapply(dimnames.all, length),
                              dimnames = dimnames.all)
sim.birth.rates.level <- array(unlist(ans.level),
                              dim = sapply(dimnames.all, length),
                              dimnames = dimnames.all)

save(sim.birth.rates.base,
     file = "data/sim.birth.rates.base.rda",
     compress = "bzip2")
save(sim.birth.rates.distn,
     file = "data/sim.birth.rates.distn.rda",
     compress = "bzip2")
save(sim.birth.rates.level,
     file = "data/sim.birth.rates.level.rda",
     compress = "bzip2")
save(sim.birth.standard,
     file = "data/sim.birth.standard.rda",
     compress = "bzip2")
