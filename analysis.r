load <- function(file) {
    data <- read.csv(file, header = FALSE)
    names(data) <- c("FileSize", "Method", "BufSize", "Mean", "StdDev")
    data$MeanSpeed <- data$FileSize / data$Mean
    # Sort mean results ascending
    data_sort <- data[order(data$FileSize, data$Mean),]
}

best <- function(reads_sync, size, threshold, min_num) {
    res <- reads_sync[reads_sync$FileSize == size,]
    res$Diff <- res$Mean-res$Mean[1]
    res$RelDiff <- res$Diff/res$Mean[1] * 100

    threshold_res <- res[res$RelDiff <= threshold,]
    if (nrow(threshold_res) < min_num) {
        head(res, min_num)
    } else {
        threshold_res
    }
}

reads_kb <- load("strudel_read_1-256_20190730_kb.csv")
reads_mb <- load("strudel_read_1-256_20190730.csv")

reads_raw <- rbind(reads_kb, reads_mb)
reads <- reads_raw[order(reads_raw$FileSize, reads_raw$Mean),]

reads_sync <- reads[!grepl("async", reads$Method),]

for (s in unique(reads_sync$FileSize)) {
    res <- best(reads_sync, s, 1, 5)
    print(res)
}
