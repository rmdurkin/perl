# Same functionality as multitable.pl, but uses slightly shorter loops.
# Also, the number of columns can be passed in via a program argument.
use strict;
use warnings;

my $NUM_COLS = scalar(@ARGV) > 0 ? $ARGV[0] : 12;

print("\n     ");

for (1..$NUM_COLS) {
    printf("%4d", $_);
}
print("\n    +-");

for (1..$NUM_COLS) {
    print("----");
}
print("\n");

for my $r (1..$NUM_COLS) {
    printf("%4d|", $r);
    
    for my $c (1..$NUM_COLS) {
        printf("%4d", $c * $r);
    }
    print("\n");
}