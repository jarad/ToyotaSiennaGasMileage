#' Gas consumption data for a 2011 Toyota Sienna
#' 
#' Each time a 2011 Toyota Sienna was refueled, the \code{date},
#' amount of \code{fuel}, \code{miles} driven since last refueling, \code{cost}
#' of the gasoline, the \code{ethanol} percentage, and the \code{octane} were
#' recorded.  
#' 
#' @format A data frame with 8 variables:
#' \describe{
#'   \item{date}{Date, date of refueling}
#'   \item{gallons}{numeric, amount of fuel, in gallons}
#'   \item{miles}{numeric, miles driven since last refueling}
#'   \item{USD}{numeric, cost of fuel, in US dollars}
#'   \item{ethanol}{numeric, amount of ethanol, percentage}
#'   \item{octane}{numeric, octane rating}
#'   \item{notes}{character, any notes, typically brand of gas station}
#'   \item{inCanada}{logical, TRUE if data were collected in Canada and FALSE otherwise}
#' }
"ToyotaSiennaGasMileage"
