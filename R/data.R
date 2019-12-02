#' Gas consumption data for a 2011 Toyota Sienna
#' 
#' Each time I refueled my 2011 Toyota Sienna, I recorded the \code{date},
#' amount of \code{fuel}, \code{miles} driven since last refueling, \code{cost}
#' of the gasoline, the \code{ethanol} percentage, and the \code{octane}.  
#' 
#' @format A data frame with 6 variables:
#' \describe{
#'   \item{date}{date}
#'   \item{gallons}{amount of fuel, in gallons}
#'   \item{miles}{miles driven since last refueling}
#'   \item{USD}{cost of fuel, in US dollars}
#'   \item{ethanol}{amount of ethanol, percentage}
#'   \item{octane}{octane rating}
#'   \item{notes}{any notes, typically name of gas station}
#'   \item{inCanada}{indicates whether we got the gas in Canada}
#' }
"ToyotaSiennaGasMileage"
