# Project 3a: Reads lines from dictionary file and prints and saves to file those that match regex.
use strict;
use warnings;

my $infile = "american-english";
my $outfile = "output.txt";

open(INFILE,'<',$infile) or die "cannot open file $infile: $!";
open(OUTFILE,'>',$outfile) or die "cannot open file $outfile: $!";

for my $line (<INFILE>) {
    if ($line =~ m/^([abcdefghijklmnopqrstuvwxyz][abcdefghijklmnopqrstuvwxyz][abcdefghijklmnopqrstuvwxyz][abcdefghijklmnopqrstuvwxyz][abcdefghijklmnopqrstuvwxyz])$/) {
        print("$1\n");
        print(OUTFILE "$1\n");
    }
}

close(INFILE);
close(OUTFILE);