library("dplyr")
library("tidyr")
library("readr")

liters_per_gallon = 3.78541
USD_per_CAD = 1.32

read_old_csv = function(f, into) {
  print(paste("Reading",f,"\n"))
  
  d = readr::read_csv(f) %>%
    dplyr::mutate(file = f,
                  station = notes) %>%
    tidyr::separate(file, into) 
  
  if (!("liters" %in% names(d))) 
    return(d)
  
  if (!("USD" %in% names(d)))
    d$USD <- NA
  
  d %>%
    dplyr::mutate(
      inCanada = ifelse(is.na(USD), TRUE, FALSE),
      gallons  = ifelse(inCanada, liters / liters_per_gallon, gallons),
      USD      = ifelse(inCanada, CAD * USD_per_CAD,          USD    ))
}

read_google_csv = function(f, into) {
  print(paste("Reading",f,"\n"))
  
  d = readr::read_csv(f) %>%
    dplyr::mutate(file = f) %>%
    tidyr::separate(file, into) %>%
    dplyr::mutate(
      date = sub(" .*", "", Timestamp),
      date = as.Date(date, format = "%m/%d/%Y"),
      
      USD  = Cost * (Currency == "USD") + Cost * USD_per_CAD * (Currency == "CAD"),
      gallons = `Amount of fuel` * (Units == "Gallons") +
        `Amount of fuel` / liters_per_gallon * (Units == "Liters")
    ) %>%
    dplyr::rename(
      mileage = Mileage,
      octane  = Octane,
      ethanol = `Ethanol %`,
      station = Station,
      notes   = Notes
    )
}

read_dir = function(path, pattern, into) {
  files = list.files(path = path,
                     pattern = pattern,
                     recursive = TRUE,
                     full.names = TRUE)
  
  dates = as.Date(substr(files, 9, 16), format = "%Y%m%d")
  old_files = files[dates < as.Date("2020-01-01")]
  google_files = files[dates > as.Date("2020-01-01")]
  
  bind_rows(
    plyr::ldply(old_files,    read_old_csv,    into = into),
    plyr::ldply(google_files, read_google_csv, into = into),
  )
}

ToyotaSiennaGasMileage <- read_dir(path = "mileage", 
                                   pattern = "*.csv",
                                   into = c("dir","ymd","extension")) %>%
  dplyr::mutate(
    ) %>%
  
  select(date, gallons, USD, miles, ethanol, octane, station, notes, inCanada) %>%
  
  mutate(date = as.Date(date),
         
         ethanol = as.numeric(gsub("%","",ethanol)),
         
         octane = as.numeric(octane)) %>%
  
  arrange(date)

usethis::use_data(ToyotaSiennaGasMileage, overwrite=TRUE)
