complete <- function(directory, id){
        wd <- setwd(paste("/Users/michaelharrison/Desktop/Coursera/R Programming/", directory, sep=""))
        filelist <- list.files(wd, pattern = "*.csv")
        file.names = as.numeric(sub("\\.csv$","",filelist))
        selected.files = filelist[match(id, file.names)]
        df = lapply(selected.files,read.csv)
        mdf = na.omit(do.call(rbind, df)) 
        
        nobsdf <- data.frame(matrix(nrow = length(id), ncol = 2))
        colnames(nobsdf) <- c("id","nobs")
        counter = 1
        for(i in id){
                nobsdf[counter, 'id'] <- i
                nobsdf[counter, 'nobs'] <- length(which(mdf$ID == i))
                counter = counter + 1
        }
        nobsdf
}

