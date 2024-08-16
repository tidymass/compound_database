library(r4projects)
setwd(get_project_wd())
rm(list = ls())
source('1_code/100_tools.R')

setwd("2_data/MONA/")

load("mona_ms2.rda")

plot(
  mona_ms2@spectra.data$Spectra.positive$SMI00001$`15 eV`$mz,
  mona_ms2@spectra.data$Spectra.positive$SMI00001$`15 eV`$intensity,
  type = "h"
)

spectra <- 
  mona_ms2@spectra.data$Spectra.positive

save(spectra, file = "spectra.rda", compress = "xz")

inqury_ms2 <-
  list(spectra$SMI00001$`15 eV`,
       spectra$SMI00012$`20 eV`,
       spectra$SMI00163$`60 HCD`, 
       spectra$SM800201$`35  (nominal)`,
       spectra$SM804205$`35  (nominal)`)

names(inqury_ms2) <-
  paste0("compound_", 1:length(inqury_ms2))

save(inqury_ms2, file = "inqury_ms2.rda", compress = "xz")
