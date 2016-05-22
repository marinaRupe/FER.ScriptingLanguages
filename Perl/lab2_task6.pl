#!/usr/bin/perl

$first_letter = uc(shift(@ARGV));
$shift = (ord($first_letter) - ord('A')) % 26;

while(<>) {
	$line = uc($_);
	foreach $c (split //, $line) {
		if (ord($c) >= ord('A') and ord($c) <= ord('Z')) {
			$distance = ord($c) - $shift; 
			$backwards = ord('A') - $distance;
			
			if ($backwards <= 0) {
                		$char = chr(ord($c) - $shift);
            		}
			else {
				$char = chr(ord('Z') - $backwards + 1);
			}
        	}
		else {
			$char = $c;
		}
        print "$char";
	}
	
	if (eof) {
        	print "\n";
    	}
}
