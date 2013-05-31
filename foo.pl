#!/usr/bin/perl

use strict;
use warnings;

use Text::CSV;

my @data = (
    [ 'Name', 'Type', 'Age', 'Sex' ],
    [ 'boomer', 'dog', 10, 'm' ],
    [ 'elfie', 'dog', 2, 'f' ],
    [ 'eve',   'cat', 5, 'f,fixed' ],
    [ 'pebbles', 'cat', 12, 'f' ]
); 

my $csv    = Text::CSV->new({ binary => 1, always_quote => 1 });
my $header = shift @data;
my $status = $csv->combine( @$header ); # normally would do print but testing combine + string

print $csv->string, "\n";

$csv->print(\*STDOUT, $header);

foreach my $row (@data) {
    $status = $csv->combine( @$row );
    print $csv->string, "\n"; 
}


exit;
