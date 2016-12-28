corr <- function(directory, threshold = 0){
        ref <- complete(directory, id=1:332)
        threshold.cases <- which(ref$nobs > threshold)
        
        filelist <- list.files(wd, pattern = "*.csv")
        file.names = as.numeric(sub("\\.csv$","",filelist))
        selected.files = filelist[match(threshold.cases, file.names)]
        df = lapply(selected.files,read.csv) #list of dataframes

        sapply(df, function(df)cor(x = df[['sulfate']], y=df[['nitrate']], use = "complete.obs"))       
        
}