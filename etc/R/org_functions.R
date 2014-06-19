assign(
    ".org.createEnvironment",
    function(
	env = "org:variables"){
	if (env!="") {
	    while (env %in% search()) {
		detach(pos=grep(env, search()))
	    }
	    attach(what=NULL, name=env)
	    cat("\n")
	    cat(env, "environment created and in search path\n")
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
	if (env=="") {
	    env <- ".GlobalEnv"
	}
	assign(
	    name,
	    read.table(
		file      = textConnection(file),
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
	if (env=="") {
	    env <- ".GlobalEnv"
	}
	assign(
	    name,
	    read.table(
		file      = textConnection(file),
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
	if (env=="") {
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

## Local Variables:
## org-babel-tangled-file: t
## buffer-read-only: t
## eval:: (auto-revert-mode)
## End:
