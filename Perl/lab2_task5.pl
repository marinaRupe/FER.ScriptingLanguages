#!/usr/bin/perl

if(@ARGV != 1){
	die "Potrebno je unijeti jedan argument - ime datoteke! \n";
}

$first_line = 1;
$k = 0;
while($line = <>) {
    	if($first_line) {
		@factors = split /;/, $line;
		$number_of_factors = @factors;
		$first_line = 0;
	}
	else {
		@student_record = split /;/, $line;
		$jmbag = $student_record[0];
		$last_name = $student_record[1];
		$first_name = $student_record[2];
	
		$i = 0;
		$total = 0;
		while($i < $number_of_factors) {
			$j = $i + 3;
			if($student_record[$j] ne '-') {
				$total += $factors[$i] * $student_record[$j];
			}
			$i++;
		}
		$list[$k] = "$total $jmbag $last_name $first_name";
		$k++;
	}
}
@sorted_list = reverse sort(@list);

#  OUTPUT
print "Lista po rangu:\n";
print "-------------------\n";

for ($i = 0, $j = 1; $i < $k; $i++, $j++) {
	@records = split / /, $sorted_list[$i];
    	$total = $records[0];
    	$jmbag = $records[1];
    	$last_name = $records[2];
    	$first_name = $records[3];
	$list = "$last_name, $first_name ($jmbag)";
	printf "%4d. %s : %.2f\n", $j, $list, $total;
}
