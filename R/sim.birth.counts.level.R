
#' Simulated data on age-specific birth counts, with level perturbed.
#'
#' Simulated birth counts for 5-year age groups, 30 regions, and 3 time periods.
#'
#' The rates were obtained by replacing counts from
#' \code{\link{sim.birth.counts.base}} in regions 25-30 in period 3
#' with Poisson draws with expected values equal to
#' \code{\link{sim.birth.rates.level}} multiplied by
#' \code{\link{sim.fem.popn}}.
#'
#' @format  An array with dimensions \code{"age"}, \code{"region"},
#' \code{"time"}, and \code{"iteration"}.
#'
#' @seealso The data are designed for use with \code{\link{sim.fem.popn}},
#' \code{\link{sim.birth.rates.base}}, \code{\link{sim.birth.rates.distn}},
#' \code{\link{sim.birth.rates.level}}, \code{\link{sim.birth.counts.base}},
#' \code{\link{sim.birth.counts.distn}}, and \code{\link{sim.birth.standard}}.
"sim.birth.counts.level"
