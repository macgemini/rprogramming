complete <- function(directory, id = 1:332) {
    if(length(directory!=0)) {
        setwd(directory)
    }
    fileNames <- paste(sprintf("%03d",id),".csv", sep = "")
    monitors <- lapply(fileNames,read.csv)
    completeCases <- data.frame(id=numeric(length(id)),nobs=length(id))
    index <- 1
    for(file in monitors) {
        completeCases$id[index] <- file[["ID"]][[1]]
        comp <- complete.cases(file)
        completeCases$nobs[index] <- length(comp[comp==TRUE])
        index <- index + 1
    }
    completeCases
}
