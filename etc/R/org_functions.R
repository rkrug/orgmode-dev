##
## For variable transfer org -> R
##

###############
## Will be integrated into org as variables
###############

assign(
    ".org.createEnvironment",
    function(
	env = "org:variables"){
	if (!is.null(env)) {
	    while (env %in% search()) {
		detach(pos=grep(env, search()))
	    }
	    attach(what=NULL, name=env)
	    cat("\n")
	    cat("##########################################################\n")
	    cat("##", env, "environment created and in search path\n")
	    cat("##########################################################\n")
	    cat("\n")
	}
    },
    "org:functions"
)

assign(
    ".org.assignElispTable_1",
    function(   # name file header row-names
	name,
	file,
	header,
	row.names,
	env = "org:variables"){
	if (is.null(env)) {
	    env <- ".GlobalEnv"
	}
	assign(
	    name,
	    read.table(
		file      = file,
		header    = header,
		row.names = row.names,
		sep       = "\t",
		as.is     = TRUE ),
	    pos = env
	)
    },
    pos = "org:functions"
)

assign(
    ".org.assignElispTable_2",
    function(   #  name file header row-names max
	name,
	file,
	header,
	row.names,
	env = "org:variables"){
	if (is.null(env)) {
	    env <- ".GlobalEnv"
	}
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
	    pos = env
	)
    },
    pos = "org:functions"
)

assign(
    ".org.assignElispValue",
    function( # name (org-babel-R-quote-tsv-field value) name)))
	name,
	value,
	env = "org:variables"){
	if (is.null(env)) {
	    env <- ".GlobalEnv"
	}
	assign(
	    name,
	    value,
	    pos = env
	)
    },
    pos = "org:functions"
)

##
## Graphics wrapper
##
assign(
    ".org.wrapGraphics",
    function(){
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
    },
    pos = "org:functions"
)





