pollutantmean <- function(directory, pollutant, id = 1:322){
        wd <- setwd(paste("/Users/michaelharrison/Desktop/Coursera/R Programming/", directory, sep=""))
        filelist <- list.files(wd, pattern = "*.csv")
        file.names = as.numeric(sub("\\.csv$","",filelist))
        selected.files = filelist[match(id, file.names)]
        df = lapply(selected.files,read.csv)
        mergeddf = do.call(rbind, df)
        mean(mergeddf[[pollutant]], na.rm = TRUE)
}

