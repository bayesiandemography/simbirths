
#' Simulated data on age-specific birth counts.
#'
#' Simulated birth counts for 5-year age groups, 30 regions, and 3 time periods.
#'
#' The rates were obtained by making Poisson draws with expected
#' values equal to \code{\link{sim.birth.rates.base}} multiplied by
#' \code{\link{sim.fem.popn.small}}.
#'
#' @format  An array with dimensions \code{"age"}, \code{"region"},
#' \code{"time"}, and \code{"iteration"}.
#'
#' @seealso The data are designed for use with
#' \code{\link{sim.fem.popn.small}},
#' \code{\link{sim.birth.rates.base}},
#' \code{\link{sim.birth.rates.distn}},
#' \code{\link{sim.birth.rates.level}},
#' \code{\link{sim.birth.counts.distn.small}},
#' \code{\link{sim.birth.counts.level.small}},
#' and \code{\link{sim.birth.standard}}.
#' For a version based on a female population with cell sizes of 300 rather
#' than 30, see \code{\link{sim.birth.counts.base}}.
"sim.birth.counts.base.small"
