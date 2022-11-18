# Outputs an n-column multiplication table
use strict;
use warnings;

my $NUM_COLS = 12;

print "\n     ";

my $c = 1;
while ($c <= $NUM_COLS) {
    printf("%4d", $c);
    $c++;
}

print "\n    +------------------------------------------------\n";

my $r = 1;
while ($r <= $NUM_COLS) {
    printf("%4d|", $r);
    
    $c = 1;
    while ($c <= $NUM_COLS) {
        printf("%4d", $c * $r);
        $c++;
    }
    print("\n");
    $r++;
}