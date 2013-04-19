#!/usr/bin/perl
use strict;
use warnings;
use Carp;
use Getopt::Long;
use Data::Dumper;
use bignum;

#PROBLEM 11
#~ In the 20 x 20 grid below, four numbers along a diagonal line have been marked with *.
#~ 
#~ 08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
#~ 49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
#~ 81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
#~ 52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
#~ 22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
#~ 24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
#~ 32 98 81 28 64 23 67 10 *26 38 40 67 59 54 70 66 18 38 64 70
#~ 67 26 20 68 02 62 12 20 95 *63 94 39 63 08 40 91 66 49 94 21
#~ 24 55 58 05 66 73 99 26 97 17 *78 78 96 83 14 88 34 89 63 72
#~ 21 36 23 09 75 00 76 44 20 45 35 *14 00 61 33 97 34 31 33 95
#~ 78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
#~ 16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
#~ 86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
#~ 19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
#~ 04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
#~ 88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
#~ 04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
#~ 20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
#~ 20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
#~ 01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48
#~ The product of these numbers is 26  63  78  14 = 1788696.
#~ 
#~ What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 2020 grid?

#~ open NUM, "<", 'prob11.txt'; #Note: this is csv version of above grid
#~ 
#~ my %grid;
#~ 
#~ my $ident = 1;
#~ my $maxrow = 0;
#~ my $maxcol = 0;
#~ while ( <NUM> ) {
	#~ chomp;
	#~ my @line = split(',', $_);The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
#~ 
#~ 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#~ 
#~ Let us list the factors of the first seven triangle numbers:
#~ 
 #~ 1: 1
 #~ 3: 1,3
 #~ 6: 1,2,3,6
#~ 10: 1,2,5,10
#~ 15: 1,3,5,15
#~ 21: 1,3,7,21
#~ 28: 1,2,4,7,14,28
#~ We can see that 28 is the first triangle number to have over five divisors.
#~ 
#~ What is the value of the first triangle number to have over five hundred divisors?
	#~ $maxcol = $#line if $#line > $maxcol;
	#~ foreach my $num (@line) {
		#~ push @{ $grid{$ident} }, $num;
		#~ $maxrow = $ident;
	#~ }
	#~ $ident++;
#~ }
#~ my @maxproduct;
#~ my $maxacross = 0;
#~ my $marow = 0;
#~ my $macol = 0;
#~ my $accsum;
#~ foreach my $row ( 1 .. $maxrow ) {
	#~ my @rowvals = @{ $grid{$row} };
	#~ foreach my $col ( 0 .. (scalar @rowvals) - 4 ) {
		#~ my $one = $rowvals[$col];
		#~ my $two = $rowvals[$col+1];
		#~ my $three = $rowvals[$col+2];
		#~ my $four = $rowvals[$col+3];
		#~ my $product = $rowvals[$col] * $rowvals[$col + 1] * $rowvals[$col + 2] * $rowvals[$col + 3];
		#~ if ( $product > $maxacross ) {
			#~ $maxacross = $product;
			#~ $marow = $row;
			#~ $macol = $col;
			#~ $accsum = "$one x $two x $three x $four";
		#~ }
	#~ }
#~ }
#~ $macol++;
#~ print "Max product across rows is $maxacross at row $marow and column $macol ($accsum)\n";
#~ push @maxproduct, $maxacross;
#~ 
#~ my $maxdown = 0;
#~ my $mdrow = 0;
#~ my $mdcol = 0;
#~ my $downsum;
#~ foreach my $col ( 0 .. $maxcol ) {
	#~ foreach my $row ( 1 .. $maxrow - 3 ) {
		#~ my $one = (@{ $grid{$row} })[$col];
		#~ my $two = (@{ $grid{$row+1} })[$col];
		#~ my $three = (@{ $grid{$row+2} })[$col];
		#~ my $four = (@{ $grid{$row+3} })[$col];
		#~ my $product = (@{ $grid{$row} })[$col] * (@{ $grid{$row+1} })[$col] * (@{ $grid{$row+2} })[$col] * (@{ $grid{$row+3} })[$col];
		#~ if ( $product > $maxdown ) {
			#~ $maxdown = $product;
			#~ $mdrow = $row;
			#~ $mdcol = $col;
			#~ $downsum = "$one x $two x $three x $four";
		#~ }
	#~ }
#~ }
#~ $mdcol++;
#~ print "Max product down columns is $maxdown at row $mdrow and column $mdcol ($downsum)\n";
#~ push @maxproduct, $maxdown;
#~ 
#~ my $maxdiag = 0;
#~ my $mgrow = 0;
#~ my $mgcol = 0;
#~ my $diagsum;
#~ foreach my $col ( 0 .. $maxcol - 3 ) {
	#~ foreach my $row ( 1 .. $maxrow - 3 ) {
		#~ my $one = (@{ $grid{$row} })[$col];
		#~ my $two = (@{ $grid{$row+1} })[$col+1];
		#~ my $three = (@{ $grid{$row+2} })[$col+2];
		#~ my $four = (@{ $grid{$row+3} })[$col+3];
		#~ my $product = (@{ $grid{$row} })[$col] * (@{ $grid{$row+1} })[$col+1] * (@{ $grid{$row+2} })[$col+2] * (@{ $grid{$row+3} })[$col+3];
		#~ if ( $product > $maxdiag ) {
			#~ $maxdiag = $product;
			#~ $mgrow = $row;
			#~ $mgcol = $col;
			#~ $diagsum = "$one x $two x $three x $four";
		#~ }
	#~ }
#~ }
#~ $mgcol++;
#~ print "Max product l to r diagonals  is $maxdiag at row $mgrow and column $mgcol ($diagsum)\n";
#~ push @maxproduct, $maxdiag;
#~ 
#~ my $maxdiag2 = 0;
#~ my $mg2row = 0;
#~ my $mg2col = 0;
#~ my $diag2sum;
#~ foreach my $col ( 3 .. $maxcol ) {
	#~ foreach my $row ( 1 .. $maxrow - 3 ) {
		#~ my $one = (@{ $grid{$row} })[$col];
		#~ my $two = (@{ $grid{$row+1} })[$col-1];
		#~ my $three = (@{ $grid{$row+2} })[$col-2];
		#~ my $four = (@{ $grid{$row+3} })[$col-3];
		#~ my $product = (@{ $grid{$row} })[$col] * (@{ $grid{$row+1} })[$col-1] * (@{ $grid{$row+2} })[$col-2] * (@{ $grid{$row+3} })[$col-3];
		#~ if ( $product > $maxdiag2 ) {
			#~ $maxdiag2 = $product;
			#~ $mg2row = $row;
			#~ $mg2col = $col;
			#~ $diag2sum = "$one x $two x $three x $four";
		#~ }
	#~ }
#~ }
#~ $mg2col++;
#~ print "Max product r to l diagonals  is $maxdiag2 at row $mg2row and column $mg2col ($diag2sum)\n";
#~ push @maxproduct, $maxdiag2;
#~ 
#~ my $maxoverall = ( sort {$b <=> $a} @maxproduct )[0];
#~ print "Maximum overall product is $maxoverall\n";

#PROBLEM 12
#~ The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
#~ 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#~ 
#~ Let us list the factors of the first seven triangle numbers:
#~ 
 #~ 1: 1
 #~ 3: 1,3
 #~ 6: 1,2,3,6
#~ 10: 1,2,5,10
#~ 15: 1,3,5,15
#~ 21: 1,3,7,21
#~ 28: 1,2,4,7,14,28
#~ We can see that 28 is the first triangle number to have over five divisors.
#~ 
#~ What is the value of the first triangle number to have over five hundred divisors?


#~ my ( $ceiling, $help );
#~ 
#~ GetOptions(
    #~ 'c|ceiling=i'               => \$ceiling,
    #~ 'h|help'                    => \$help,
#~ );
#~ 
#~ ( $ceiling && !$help ) or die <<USAGE;
#~ Usage: $0   
  #~ -c|--ceiling				   <number of divisors>
  #~ -h|--help                    <this message>
#~ USAGE
#~ 
#~ my $notfound = 1;
#~ my $pointer = 1;
#~ my $triangle = 0;
#~ while ( $notfound ) {
	#~ $triangle += $pointer;
	#~ $pointer++;
	#~ my @products = getproducts( $triangle );
	#~ my $numprod = scalar @products;
	#~ $notfound = 0 if $numprod > $ceiling;
	#~ #print "$triangle  ",join(',', @products), " -> [$numprod]\n";
#~ }
#~ print "$triangle\n";
	#~ 
#~ sub getproducts 
#~ {
	#~ my ($num) = @_;
	#~ my %rethash;
	#~ for (my $i = 1; $i < (sqrt($num) + 1); $i++) {
		#~ if ($num % $i == 0) {#~ my ( $ceiling, $help );
#~ 
#~ GetOptions(
    #~ 'c|ceiling=i'               => \$ceiling,
    #~ 'h|help'                    => \$help,
#~ );
#~ 
#~ ( $ceiling && !$help ) or die <<USAGE;
#~ Usage: $0   
  #~ -c|--ceiling				   <number of divisors>
  #~ -h|--help                    <this message>
#~ USAGE
			#~ my $j = $num / $i;
			#~ $rethash{$i} = 1;
			#~ $rethash{$j} = 1;
		#~ }
	#~ }
	#~ my @retarray = sort { $a <=> $b } keys %rethash;
	#~ return @retarray;
#~ }	

#PROBLEM 13
#Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.	(#In prob13.txt)

#~ open NUM, "<", 'prob13.txt';
#~ my $total = 0;
#~ 
#~ while ( <NUM> ) {
	#~ chomp;
	#~ $total += $_;
#~ }
#~ 
#~ $total = sprintf("%0.1f", ($total / 1e+42) );
#~ 
#~ print "First ten digits (plus one dp): $total\n";

#PROBLEM 14
#~ The following iterative sequence is defined for the set of positive integers:
#~ n -> n/2 (n is even)
#~ n -> 3n + 1 (n is odd)
#~ #~ my ( $ceiling, $help );
#~ 
#~ GetOptions(
    #~ 'c|ceiling=i'               => \$ceiling,
    #~ 'h|help'                    => \$help,
#~ );
#~ 
#~ ( $ceiling && !$help ) or die <<USAGE;
#~ Usage: $0   
  #~ -c|--ceiling				   <number of divisors>
  #~ -h|--help                    <this message>
#~ USAGE
#~ Using the rule above and starting with 13, we generate the following sequence:
#~ 
#~ 13  40  20  10  5  16  8  4  2  1
#~ It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#~ 
#~ Which starting number, under one million, produces the longest chain?
#~ 
#~ NOTE: Once the chain starts the terms are allowed to go above one million.

#~ my ( $ceiling, $help );
#~ 
#~ GetOptions(
    #~ 'c|ceiling=i'               => \$ceiling,
    #~ 'h|help'                    => \$help,
#~ );
#~ 
#~ ( $ceiling && $ceiling > 0 && !$help ) or die <<USAGE;
#~ Usage: $0   
  #~ -c|--ceiling				   <max starting value (must be positive integer)>
  #~ -h|--help                    <this message>
#~ USAGE
#~ 
#~ my $maxlen = 0;
#~ my $start = 0;
#~ for ( 1 .. $ceiling ) {
	#~ my $seqlen = get_sequence_length($_);
	#~ if ( $seqlen > $maxlen ) {
		#~ $maxlen = $seqlen;
		#~ $start = $_;
	#~ }
#~ }
#~ print "Max sequence length = $maxlen, starting number = $start\n";
#~ 
#~ sub get_sequence_length 
#~ {
	#~ my ($sn) = @_;
	#~ my @seq = ($sn);
	#~ my $num = $sn;
	#~ while ($num > 1) {
		#~ $num = $num % 2 == 0 ? $num / 2 : (3 * $num) + 1;
		#~ push @seq, $num;
	#~ }
	#~ my $seqlen = scalar @seq;
	#~ #print "SN: $sn; SEQ: ",join('->', @seq), "  [$seqlen]\n";
	#~ return $seqlen;
#~ }
	
#PROBLEM 15
#Starting in the top left corner of a 2 x 2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
#How many such routes are there through a 20 x 20 grid?

#NOTE: This is the staircase walk problem, which is a combination problem (MS221 block A!)
#Basically:   (m + n)! / m!n!
#http://mathworld.wolfram.com/StaircaseWalk.html


#PROBLEM 16
#2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#What is the sum of the digits of the number 2^1000?

#~ my ( $ceiling, $help );
#~ 
#~ GetOptions(
    #~ 'c|ceiling=i'               => \$ceiling,
    #~ 'h|help'                    => \$help,
#~ );
#~ 
#~ ( $ceiling && $ceiling > 0 && !$help ) or die <<USAGE;
#~ Usage: $0   
  #~ -c|--ceiling				   <power of 2>
  #~ -h|--help                    <this message>
#~ USAGE
#~ 
#~ my $total = 0;
#~ foreach ( split ( //, 2 ** $ceiling ) ) {
	#~ $total += $_;
#~ }
#~ print "Total sum of digits for 2 to the power $ceiling is $total\n";
  
#PROBLEM 17
#~ If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#~ 
#~ If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#~ 
#~ 
#~ NOTE: Do not count spaces or hyphens. 
#~ For example, 342 (three hundred and forty-two) contains 23 letters and 
#~              115 (one hundred and fifteen) contains 20 letters. 
#~ The use of "and" when writing out numbers is in compliance with British usage.

#~ my ( $ceiling, $help );
#~ 
#~ GetOptions(
    #~ 'c|ceiling=i'               => \$ceiling,
    #~ 'h|help'                    => \$help,
#~ );
#~ 
#~ ( $ceiling && $ceiling > 0 && !$help ) or die <<USAGE;
#~ Usage: $0   
  #~ -c|--ceiling				   <maximum number for addition of words>
  #~ -h|--help                    <this message>
#~ USAGE
 #~ 
#~ my $HUNDRED = 'hundred';
#~ my $THOUSAND = 'thousand';
#~ my $AND = 'and';
#~ 
#~ my %DIGITS = (1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine');
#~ my %TEENS = (10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen' , 19 => 'nineteen');   
#~ my %TENS = (2 => 'twenty', 3 => 'thirty', 4 => 'forty', 5 => 'fifty', 6 => 'sixty', 7 => 'seventy', 8 => 'eighty', 9 => 'ninety');
#~ 
#~ my $total_length = 0;
#~ foreach ( 1 .. $ceiling ) {
	#~ $total_length += get_number_in_words($_);
#~ }
#~ 
#~ print "\n\nMAX NUM: $ceiling, WORDS LENGTH: $total_length\n";
	#~ 
#~ sub get_number_in_words {
	#~ my ($number) = @_;
	#~ my @num_digits = split ( //, $number );
	#~ my @rev_digits = reverse(@num_digits); 
	#~ my $number_word;
	#~ my $include_unit = 1;
#~ 
	#~ if ( $rev_digits[3] ) {
		#~ $number_word = $DIGITS{$rev_digits[3]}.' '.$THOUSAND;
	#~ }
	#~ if ( $rev_digits[2] && $rev_digits[2] != 0 ) {
		#~ if ( $number_word ) {
			#~ $number_word = $number_word.' '.$DIGITS{$rev_digits[2]}.' '.$HUNDRED;
		#~ }
		#~ else {
			#~ $number_word = $DIGITS{$rev_digits[2]}.' '.$HUNDRED;
		#~ }
	#~ }
	#~ if ( $number_word ) {
		#~ $number_word = $number_word.' '.$AND.' ' unless ($rev_digits[1] == 0 && $rev_digits[0] == 0 );
	#~ }
	#~ else {
		#~ $number_word = '';
	#~ }
	#~ if ( $rev_digits[1] && $rev_digits[1] != 0 ) {
		#~ if ( $rev_digits[1] == 1 ) {
			#~ my $teen = $rev_digits[1].$rev_digits[0];
			#~ $number_word = $number_word.$TEENS{$teen};
			#~ $include_unit = 0;
		#~ }
		#~ else {
			#~ $number_word = $number_word.$TENS{$rev_digits[1]}.' ';
		#~ }
	#~ }
	#~ if ( $rev_digits[0] && $include_unit && $rev_digits[0] != 0 ) {
		#~ $number_word = $number_word.$DIGITS{$rev_digits[0]};
	#~ }
	#~ print "$number_word  ";
	#~ $number_word =~ tr/ //ds;
	#~ return length($number_word);
#~ }


#PROBLEM 18 
#~ By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
#~ 
#~ 3
#~ 7 4
#~ 2 4 6
#~ 8 5 9 3
#~ 
#~ That is, 3 + 7 + 4 + 9 = 23.
#~ 
#~ Find the maximum total from top to bottom of the triangle below:
#~ 
#~ 75
#~ 95 64
#~ 17 47 82
#~ 18 35 87 10
#~ 20 04 82 47 65
#~ 19 01 23 75 03 34
#~ 88 02 77 73 07 63 67
#~ 99 65 04 28 06 16 70 92
#~ 41 41 26 56 83 40 80 70 33
#~ 41 48 72 33 47 32 37 16 94 29
#~ 53 71 44 65 25 43 91 52 97 51 14
#~ 70 11 33 28 77 73 17 78 39 68 17 57
#~ 91 71 52 38 17 14 91 43 58 50 27 29 48
#~ 63 66 04 68 89 53 67 30 73 16 69 87 40 31
#~ 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
#~ 
#~ NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. 
#~ However, Problem 67, is the same challenge with a triangle containing one-hundred rows; 
#~ it cannot be solved by brute force, and requires a clever method! ;o)

#~ my ( $file, $help );
#~ 
#~ GetOptions(
    #~ 'f|file=s'  => \$file,
    #~ 'h|help'    => \$help,
#~ );
#~ 
#~ ( $file && !$help ) or die <<USAGE;
#~ Usage: $0   
  #~ -f|--file            <file of triangle data>
  #~ -h|--help            <this message>
#~ USAGE
#~ 
#~ open TRI, "<", $file;
#~ my %triangle;
#~ my $row = 0;
#~ 
#~ while ( <TRI> ) {
	#~ $row++;
	#~ chomp;
	#~ for my $num ( split(',', $_) ) {
		#~ push @{ $triangle{$row} }, $num;
	#~ }
#~ }
#~ 
#~ #Hold triangle data as a hash of arrays, where the key is the row number and the array is the row data
#~ #Basically start at the bottom of the triangle and solve the maximum path sum as a series of smaller triangles
#~ #Something like max( current_row_array[i] + above_row_array[i]; current_row_array[i + 1] + above_row_array[i] )
#~ #The max of the two sums is stored in above_row_array[i] which is written to the hash as the row is completed.
#~ #When we move to the next row up the triangle the current_row_array will contain the current maximum sums for each path.
#~ #In this way, the value of the sum in the top row will be the maximum path sum ......
 #~ 
#~ my $pointer = $row;
#~ while ( $pointer > 1 ) {
	#~ my @current_row = @{ $triangle{$pointer} };
	#~ my @next_row = @{ $triangle{$pointer-1} };
	#~ for my $i ( 0 .. (scalar @current_row) - 2 ) {
		#~ my $left = $current_row[$i] + $next_row[$i];
		#~ my $right = $current_row[$i+1] + $next_row[$i];
		#~ $next_row[$i] = $left >= $right ? $left : $right;
	#~ }
	#~ @{ $triangle{$pointer-1} } = @next_row;
	#~ $pointer--;
#~ }
#~ 
#~ print "Maximum path sum = ", (@{ $triangle{1} })[0],"\n";
	 
#PROBLEM 19
#~ You are given the following information, but you may prefer to do some research for yourself.
#~ 
#~ 1 Jan 1900 was a Monday.
#~ Thirty days has September,
#~ April, June and November.
#~ All the rest have thirty-one,
#~ Saving February alone,
#~ Which has twenty-eight, rain or shine.
#~ And on leap years, twenty-nine.
#~ A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#~ How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

#~ my $year = 1900;
#~ my $month = 1;
#~ my $day = 2;
#~ 
#~ my %MONTHS = (1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December');
#~ my %MONTH_DAYS = ('January' => 31, 'February' => 31, 'March' => 28, 'April' => 31, 'May' => 30, 'June' => 31, 'July' => 30, 'August' => 31, 'September' => 31, 'October' => 30, 'November' => 31, 'December' => 30);
#~ my %DAYS = (1 => 'Sunday', 2 => 'Monday', 3 => 'Tuesday', 4 => 'Wednesday', 5 => 'Thursday', 6 => 'Friday', 7 => 'Saturday');
#~ 
#~ my $num_sundays = 0;
#~ 
#~ while ( $year < 2001 ) {
	#~ $month++;
	#~ my $month_name = $MONTHS{$month};
	#~ my $month_days = $MONTH_DAYS{$month_name};
	#~ $month_days++ if $month == 3 && $year % 4 == 0;
	#~ $day = $day + $month_days % 7;
	#~ $day = $day % 7 if $day > 7;
	#~ if ( $year > 1900 && $day == 1 ) {
		#~ print "$DAYS{$day} $day $MONTHS{$month} $year\n";
		#~ $num_sundays++;
	#~ }
	#~ if ( $month == 12 ) {
		#~ $year++;
		#~ $month = 0;
	#~ }
#~ } 
#~ 
#~ print "The number of months with Sunday as the first day in the 20th Century is $num_sundays\n";

#PROBLEM 20
#~ n! means n x (n  1) x ... x 3 x 2 x 1
#~ 
#~ For example, 10! = 10 x 9 x ... x 3 x 2 x 1 = 3628800,
#~ and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#~ 
#~ Find the sum of the digits in the number 100!

my ( $ceiling, $help );

GetOptions(
    'c|ceiling=i'               => \$ceiling,
    'h|help'                    => \$help,
);

( $ceiling && $ceiling > 0 && !$help ) or die <<USAGE;
Usage: $0   
  -c|--ceiling				   <value of factorial for summation>
  -h|--help                    <this message>
USAGE

my $fac = factorial($ceiling);
my $sum = 0;
foreach ( split//, $fac ) {
	$sum += $_;
}
print "The summation of the factorial of $ceiling is $sum\n";

sub factorial
{
	my ($num) = @_;
	my $factorial = 1;
	for my $n ( 2 .. $num ) {
		$factorial = $factorial * $n;
	}
	return $factorial;
}