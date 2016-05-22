#!/usr/bin/perl
print "Insert a list of numbers: ";

@numbers = <STDIN>;
chomp @numbers;

foreach $n (@numbers) {
    $sum += $n;
}

$average = $sum / ($#numbers + 1);
print "Average: $average\n";

