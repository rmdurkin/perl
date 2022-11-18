# Reads lines from specified file and prints output without comments.
# Writes output to specified file.
# Makes use of a function that trims white space using regex
# Usage:  perl remove_comments.pl test.txt test.txt.out
use strict;
use warnings;

open(INFILE,'<',$ARGV[0]) or die "cannot open file $ARGV[0]: $!";
open(OUTFILE,'>',$ARGV[1]) or die "cannot open file $ARGV[1]: $!";

my $line_count = 0;
TEXT_LINE:
for my $line (<INFILE>) {
    $line_count++;
    chomp $line;
    next TEXT_LINE if substr(trim($line), 0, 1) eq '#';
    print("$line\n");
    print(OUTFILE "$line\n");
}

close(OUTFILE);

sub trim { 
    my $s = shift; 
    $s =~ s/^\s+|\s+$//g; 
    return $s 
};