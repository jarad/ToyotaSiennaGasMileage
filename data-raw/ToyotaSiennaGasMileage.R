library("dplyr")
library("tidyr")
library("readr")

my_read_csv = function(f, into) {
  readr::read_csv(f) %>%
    mutate(file=f) %>%
    separate(file, into) 
}

read_dir = function(path, pattern, into) {
  files = list.files(path = path,
                     pattern = pattern,
                     recursive = TRUE,
                     full.names = TRUE)
  plyr::ldply(files, my_read_csv, into = into)
}

ToyotaSiennaGasMileage <- read_dir(path = "mileage", 
                                   pattern = "*.csv",
                                   into = c("dir","ymd","extension")) %>%
  mutate(
    inCanada = ifelse(is.na(USD), TRUE, FALSE),
    gallons  = ifelse(inCanada, liters / 3.78541, gallons),
    USD      = ifelse(inCanada, CAD * 1.32,       USD    )) %>%
  
  select(date, gallons, USD, miles, ethanol, octane, notes, inCanada) %>%
  
  mutate(date = as.Date(date),
         
         ethanol = as.numeric(gsub("%","",ethanol)),
         
         octane = as.numeric(octane)) %>%
  
  arrange(date)

usethis::use_data(ToyotaSiennaGasMileage, overwrite=TRUE)
