# ****************************************************************
# dictionary3c.py
#
# Reads lines from dictionary file and prints those that match 
# regex for three scenarios.
#
# Rob Durkin
# Last Modified: Jan 8, 2023
# ****************************************************************

use strict;
use warnings;


main();


sub main {

    print_instructions();

    my ($words,$matches) = load_words_from_file();
    my $exit = 0;

    do {

        my ($scenario,$params) = get_input_params();


        if ($scenario < 4) {

            $words = process_words($scenario,$params,$words,$matches);

        } elsif ($scenario == 5) {
      
            print join("\n",@{$words});

        } else {

            $exit = 1;

        }
        
    } while(!$exit);

}


sub load_words_from_file {

    my $infile = "american-english";

    open(INFILE,'<',$infile) or die "cannot open file $infile: $!";

    my @matches = ('abcdefghijklmnopqrstuvwxyz') x 5;
    my @words;

    for my $line (<INFILE>) {

        if ($line =~ /^([$matches[0]][$matches[1]][$matches[2]][$matches[3]][$matches[4]])$/) {
            push(@words,$1);
        }
            
    }

    close INFILE;

    return (\@words,\@matches);
}



sub get_input_params { 

    print "\nEnter Scenario (1-3) and Params, or 4 to Exit: ";
    my $input = <STDIN>;
    chomp $input;

    my $scenario = substr $input,0,1;
    my @params = split(//,substr($input, 1, length($input)));

    return ($scenario,\@params);
}


sub print_instructions {

    print "\nDictionary Regex Program\n";
    print "Reads lines from dictionary file and prints those that match regex for three scenarios:\n";
    print "Scenario 1: Find words without certain letters. Params: list of letters (undelimited)\n";
    print "Scenario 2: Find words where a single letter does not exist in a given position. Params: letter and position index\n";
    print "Scenario 3: Find words where a single letter is the only possibility for a given position. Params: letter and position index\n";

}


sub process_words {

    my $scenario = $_[0];
    my @params = @{$_[1]};
    my @words = @{$_[2]};
    my @matches = @{$_[3]};

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

    @words = grep(/^([$matches[0]][$matches[1]][$matches[2]][$matches[3]][$matches[4]])$/, @words);

    if (scalar(@words) > 10) {

        print "Words remaining: " . scalar @words . "\n";
        print "Enter 5 to view current word list\n"

    } else {

        print join("\n",@words);

    }

    return \@words;

}


