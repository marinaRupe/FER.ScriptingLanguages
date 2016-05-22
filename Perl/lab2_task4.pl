#!/usr/bin/perl

while($student_record = <>) {
							
	chomp($student_record);
	@data = split /;/, $student_record;
    	$jmbag = $data[0];
    	$last_name = $data[1];
    	$first_name = $data[2];
    
	@term = split / /, $data[3];
    	$lab_date = $term[0];
    	$lab_start_time = $term[1];
    	@lab_start_time_array = split /:/, $lab_start_time;
    	$lab_start_hour = $lab_start_time_array[0];
    
	@locked = split / /, $data[4];
    	$locked_date = $locked[0];
    	$locked_time = $locked[1];
	@locked_time_array = split /:/, $locked_time;
    	$lab_locked_hour = $locked_time_array[0];
    	$lab_locked_minutes = $locked_time_array[1];
    	$lab_locked_seconds = $locked_time_array[2];
    
	if (($lab_date ne $locked_date) or ($lab_locked_hour - $lab_start_hour >= 1 and ($lab_locked_minutes > 0 or $lab_locked_seconds > 0))) {
		print "$jmbag $last_name $first_name - PROBLEM: $lab_date $lab_start_time --> $locked_date $locked_time\n"
	}
}
