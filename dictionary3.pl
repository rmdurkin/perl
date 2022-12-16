# Project 3c: Reads lines from dictionary file and prints those that match regex for three scenarios.
use strict;
use warnings;

do {
    my ($scenario,@params) = get_input_params();
    process_file($scenario,@params);
} while(1);

sub get_input_params { 

    print "\nEnter Scenario (1-3) and Parameters: ";
    my $input = <STDIN>;
    chomp $input;

    my $scenario = substr($input, 0, 1);
    my @params = split(//,substr($input, 1, length($input)));

    return ($scenario,\@params);
}

sub process_file {

    my $scenario = $_[0];
    my @params = @{$_[1]};

    my $infile = "american-english";

    open(INFILE,'<',$infile) or die "cannot open file $infile: $!";

    my @matches = ('abcdefghijklmnopqrstuvwxyz') x 5;
    my @words;

    # scenario 1: find words without certain letters
    if ($scenario == 1) {

        s/[@params]//g for @matches;

    # scenario 2: find words where a single letter does not exist in a given position    
    } elsif ($scenario == 2) {

        my $letter = $params[0];
        my $index = $params[1] - 1;
        $matches[$index] =~ s/$letter//;

    # scenario 3: find words where a single letter is the only possibility for a given position
    } elsif ($scenario == 3) {

        my $letter = $params[0];
        my $index = $params[1] - 1;
        $matches[$index] = $letter;

    }

    for my $line (<INFILE>) {

        if ($line =~ /^([$matches[0]][$matches[1]][$matches[2]][$matches[3]][$matches[4]])$/) {
            push(@words,$1);
        }
        
    }

    close(INFILE);

    print(join("\n",@words));

}


