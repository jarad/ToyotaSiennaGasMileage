library(dplyr)
library(tidyr)

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

# Eventually need to deal with warning messages
ToyotaSiennaGasMileage <- read_dir(path = "mileage", 
                                   pattern = "*.csv",
                                   into = c("dir","ymd","extension")) %>%
  select(date, fuel, cost, miles, ethanol, octane) %>%
  
  mutate(date = as.Date(date),
         
         ethanol = as.numeric(gsub("%","",ethanol)),
         
         octane = as.numeric(octane)) 

devtools::use_data(ToyotaSiennaGasMileage, overwrite=TRUE)
