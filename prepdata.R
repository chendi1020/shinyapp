make_csv <- function(x, file = 'visit-sequences.csv') {
    dd <- data.frame(ftable(x))
    dd <- within(dd, {
        visit <- apply(dd[, -ncol(dd)], 1, function(x)
            paste0(c(x, 'end'), collapse = '-'))
        count <- dd$Freq
    })
    
    write.table(dd[dd$count > 0, c('visit','count')], file = file, sep = ',',
                quote = FALSE, row.names = FALSE, col.names = FALSE)
}

set.seed(1)
dd <- sample(c('home','product','search','account','other'), 500,
             replace = TRUE, prob = c(.5,.3,.1,.05,.05))
dd <- as.data.frame(matrix(dd, ncol = 5))
make_csv(dd)
