# poRe commands for extracted 2D
# fasta from a directory of fast5 files

# the directory of fast5 files
fast5.dir <- "/path/to/MinION/fast5/data"

# the output fasta file
fasta.out <- "poRe.2D.fasta"

# load poRe
library(poRe)

# get a list of all fast5 files in the directory
files <- dir(fast5.dir, pattern="fast5$", full.names=TRUE)

# iterate over the fast5
for (f5 in files) {

	# extract fasta as a list
	fasta <- get_fasta(f5, which="2D")

	# as long as we have a list
	# output to file fasta.out
	if (typeof(fasta) == "list") {
		cat(fasta$'2D', file=fasta.out, append=TRUE, sep="\n")
	}
}
