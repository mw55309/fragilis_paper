#!/usr/bin/perl

use Bio::SeqIO;

# load fasta from command line
my $in  = Bio::SeqIO->new(-file => $ARGV[0], -format => 'fasta');

# output to STDOUT
my $out = Bio::SeqIO->new(-fh   => \*STDOUT, -format => 'fasta');

# iterate over all sequenced
while(my $seq = $in->next_seq()) {

	# extract info from ID line
	my ($node,$num,$tl,$length,$tc,$coverage,$ti,$id) = split(/_/, $seq->primary_id);

	# print out those scaffolds with coverage > 5
	# and length > 1000
        if ($coverage > 5 & $length > 1000) {	
		$out->write_seq($seq);
        }
}
