#!/usr/bin/perl

$string = "" ;
while ( $string =~ /^\s*$/ ) {
    print "Insert string: ";
    $string = <STDIN>;
}

while ($n == "") {
    print "Insert number of repetitions: ";
    $n = <STDIN>;
}

for ($i = 0; $i < $n; $i++) {
    $new_string .= $string;
}
  
print "$new_string";