## Mohács beolvasás
ttdir <- dir("mohacs", "*txt")
Mohács <- scan(paste0("mohacs/",ttdir[1]))
for(ttfile in 2:length(ttdir))
    Mohács <- c(Mohács, scan(paste0("mohacs/",ttdir[ttfile])))

### Idősor készítés
## Első évszám fájlnévből
ttkezd <- as.numeric(strsplit(ttdir[1], "\\.")[[1]][1])
ttido <- seq.Date(from = as.Date(paste(ttkezd,"01","01",sep="-")),
                  to = as.Date(paste(ttkezd + length(ttdir) - 1,"12","31",sep="-")),
                  by = "1 day")
library(xts)
Mohács.xts <- xts(Mohács, ttido)

Mohácshavi.xts <- apply.monthly(Mohács.xts, mean, na.rm=TRUE)

write.zoo(Mohács.xts, "mohacs.tsv", sep = "\t", dec = ",")
