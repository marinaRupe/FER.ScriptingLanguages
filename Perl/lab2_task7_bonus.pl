#!/usr/bin/perl
#Bonus task: for every client in the file calculate and print the number of server accesses. Sort the print descending.

while (<>) {
	$line = $_;
    @data = split / /, $line;
    $ip = $data[0];
    $clients{$ip} +=1;
}

@number_of_accesses = (reverse sort {$a <=> $b} values %clients);
$n = @number_of_accesses;

$i = 0;
while ($i < $n) {
    foreach $ip (keys %clients) {
        if ($clients{$ip} == $number_of_accesses[$i]) {
            print "$ip : $number_of_accesses[$i]\n";
            $i += 1;
            delete $clients{$ip};
        }
    }
}
    
 
