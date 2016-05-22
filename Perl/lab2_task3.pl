#!/usr/bin/perl

$header = 1;
while (<>) {
	$line = $_;
    	@data = split /\[/, $line;
    	@date_and_time = split /:/, $data[1];
	$hour = $date_and_time[1];
    	@file_name = split /\./, $ARGV;
    	$date = $file_name[1];
 
	#  if it's the end of the file
	if (eof) {
        	$header = 1;
		#  for every hour print the number of server accesses
        	foreach $h (0..23) {
            		printf "%2d : %d\n",  $h, $output[$h];
            		$output[$h] = 0;
		}
    	}
	#  if it's the beginning of the file
    	elsif ($header) {
		$header = 0;
        	print "\n Datum $date \n";
        	print " sat : broj pristupa \n";
        	print "-------------------------------\n";
    	}
	#  count how many server accesses are there for that hour
    	else {
        	$output[$hour]++;
    	}
}
