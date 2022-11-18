# Same functionality as multitable2.pl, but outputs to file.
# Usage: perl multitable3.pl NUM_COLS OUT_FILE
use strict;
use warnings;

my $NUM_COLS = $ARGV[0];

open(OUT,'>',$ARGV[1]) or die "cannot open file $ARGV[1]: $!";

print(OUT "\n     ");

for (1..$NUM_COLS) {
    printf(OUT "%4d", $_);
}
print(OUT "\n    +-");

for (1..$NUM_COLS) {
    print(OUT "----");
}
print(OUT "\n");

for my $r (1..$NUM_COLS) {
    printf(OUT "%4d|", $r);
    
    for my $c (1..$NUM_COLS) {
        printf(OUT "%4d", $c * $r);
    }
    print(OUT "\n");
}

close(OUT);