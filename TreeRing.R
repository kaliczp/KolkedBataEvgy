## Beolvasás
Kölked <- read.table("Kölked83LTeljes.tsv", head = T, fill = TRUE, dec = ",")
Báta <- read.table("Báta27MTeljes.tsv", head = T, fill = TRUE, dec = ",")

## Idősorba
library(zoo)
Kölked.zoo <- zoo(Kölked, as.numeric(row.names(Kölked)))
