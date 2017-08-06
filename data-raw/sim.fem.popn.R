

labels.age.groups <- c(paste(seq(15, 35, 5), seq(19, 39, 5), sep = "-"), "40+")
n.age <- length(labels.age.groups)
n.region.standard <- 24
n.region.nonstandard <- 6
n.region <- n.region.standard + n.region.nonstandard
n.time <- 3
popn.cell <- 300
popn.cell.small <- 30

sim.fem.popn <- array(popn.cell,
                      dim = c(n.age, n.region, n.time),
                      dimnames = list(age = labels.age.groups,
                                      region = paste("Region", seq_len(n.region)),
                                      time = seq_len(n.time)))
sim.fem.popn.small <- array(popn.cell.small,
                            dim = c(n.age, n.region, n.time),
                            dimnames = list(age = labels.age.groups,
                                            region = paste("Region", seq_len(n.region)),
                                            time = seq_len(n.time)))

save(sim.fem.popn,
     file = "data/sim.fem.popn.rda",
     compress = "xz")
save(sim.fem.popn.small,
     file = "data/sim.fem.popn.small.rda",
     compress = "xz")
