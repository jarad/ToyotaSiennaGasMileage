library(dplyr)

read_dir = function(path, pattern) {
  files = list.files(path = path,
                     pattern = pattern,
                     recursive = TRUE,
                     full.names = TRUE)
  plyr::ldply(files, readr::read_csv,
              col_types = c("Ddddiic"))
}

# Eventually need to deal with warning messages
ToyotaSiennaGasMileage = read_dir("data-raw", "*.csv") %>%
  dplyr::select_("date", "fuel", "cost", "miles", "ethanol", "octane")

save(ToyotaSiennaGasMileage, file="data/ToyotaSiennaGasMileage.RData")
