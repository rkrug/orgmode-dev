##
## For variable transfer org -> R
##
createOrgVariablesEnvironment <- function(){
    while ('org:variables' %in% search()) {
        detach('org:variables')
    }
    attach(what=NULL, name='org:variables')
    cat("## org:variables environment created and in search path")
}

assignElispTable_1 <- function(   # name file header row-names
    name,
    file,
    header,
    row.names ){
    assign(
        name,
        read.table(
            file      = file,
            header    = header,
            row.names = row.names,
            sep       = "\t",
            as.is     = TRUE ),
        pos = "org:variables"
    )
}

assignElispTable_2<- function(   #  name file header row-names max
    name,
    file,
    header,
    row.names ){
    assign(
        name,
        read.table(
            file      = file,
            header    = header,
            row.names = row.names,
            sep       = "\t",
            as.is     = TRUE,
            fill      = TRUE,
            col.names = paste("V", seq_len(max), sep ="")
        ),
        pos = "org:variables"
    )
}

assignElispValue <- function( # name (org-babel-R-quote-tsv-field value) name)))
    name,
    value ){
    assign(
        name,
        value,
        pos = "org:variables"
    )
}

##
## Graphics wrapper
##
    tryCatch(
        {
            list(...)
        },
        error = function(e){
            plot(
                x    = -1:1,
                y    = -1:1,
                type = 'n',
                xlab = '',
                ylab = '',
                axes = FALSE
            )
            text(
                x      = 0,
                y      = 0,
                labels = e$message,
                col    = 'red')
            paste( 'ERROR', e$message, sep=' : ')
        }
    )
    dev.off()
}
