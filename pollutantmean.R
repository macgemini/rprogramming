pollutantmean <- function(directory, pollutant, id = 1:332) {
    if(length(directory!=0)) {
        setwd(directory)
    }
    fileNames <- paste(sprintf("%03d",id),".csv", sep = "")
    monitors <- lapply(fileNames,read.csv)
    mergedFrame <- Reduce(function(x, y) merge(x, y, all=TRUE), monitors)
    pollutantValues <- mergedFrame[pollutant]
    nans <- is.na(pollutantValues)
    res <- mean(pollutantValues[!nans])
}
