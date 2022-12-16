# Project 3b: Reads lines from dictionary file and prints and prints those that match regex.
use strict;
use warnings;

my $infile = "american-english";

open(INFILE,'<',$infile) or die "cannot open file $infile: $!";

my @matches = ('abcdefghijklmnopqrstuvwxyz') x 5;
my @words;

for my $line (<INFILE>) {
    if ($line =~ /^([$matches[0]][$matches[1]][$matches[2]][$matches[3]][$matches[4]])$/) {
        push(@words,$1);
    }
}

close(INFILE);

print(join("\n",@words));
