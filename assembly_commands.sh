#!/bin/bash

## VERSIONS
# SPAdes: 3.5.0
# SSPACE-LongRead: 1.1
# GapFiller: 1.11

# run SPAdes
spades.py -o hybrid -1 miseq.R1.fastq -2 miseq.R2.fastq --nanopore minion.2D.fastq

# get the top 5 contigs
perl filter.pl hybrid/scaffolds.fasta > topfive.fasta

# scaffold with SSPACE
SSPACE-LongRead.pl -c topfive.fasta -p minion.2D.fasta -b SSPACE_1 -a 200 -i 65 -t 10 -o 10 -k

# scaffold again with SSPACE
SPACE-LongRead.pl -c SSPACE_1/scaffolds.fasta -p minion.2D.fasta -b SSPACE_2 -a 200 -i 65 -t 10 -o 10 -k

# GapFiller
GapFiller.pl -l libraries.txt -s SSPACE_2/scaffolds.fasta -b SSPACE_2.gapfill
