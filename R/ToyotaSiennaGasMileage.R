#' ToyotaSiennaGasMileage: An R package contain gas consumption data 
#' 
#' The ToyotaSiennaGasMileage package contains gas consumption and cost data
#' for a 2011 Toyota Sienna XLE. During each refuel, gas was dispensed until 
#' automatically stopping. At that point, the cost, amount of fuel, ethanol
#' content, octane, and brand were recorded. In addition, the mileage since last
#' refuel was recorded on a trip meter which was subsequently reset. 
#' 
#' The raw manually recordings are available as scans at the url below. These
#' data were digitized and collated to form the full data set. 
#' 
#' From September 2019 to July 2020, the data were recorded in Canada and
#' therefore the raw data are in liters (amount of fuel) and Canadian dollars
#' (cost). Liters were converted to gallons. Canadian dollars were converted
#' to US dollars using a common exchange rate (as opposed to that days exchange
#' rate).
#' 
#' @source <https://github.com/jarad/ToyotaSiennaGasMileage>
#' 
#' @docType package
#' @name ToyotaSiennaGasMileage
#' 
NULL