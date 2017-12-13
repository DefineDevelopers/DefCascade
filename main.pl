#!/usr/bin/perl

use strict;
use warnings;

if (($#ARGV + 1) == 0)
{
	print "Usage: perl main.pl <file_name1> <file_name2> ... \n";
	exit 1;
}

my $file_name;
my $input_unit;
my $output_unit;
my $multiplier;

foreach $file_name (@ARGV)
{
	open(INPUTFILE,'<',$file_name) or die "can't open $file_name : $!\n";
		open(OUTPUTFILE,'>','D'."$file_name") or die "can't open $file_name : $!\n";
			
			print("Print Input unit name\n");
			$input_unit = <STDIN>;

			print("Print Output unit name\n");
			$output_unit = <STDIN>;

			print('Print how many ',substr($output_unit, 0, -1), ' are in one ', $input_unit);
			$multiplier = <STDIN>;

		close OUTPUTFILE;
	close INPUTFILE;
}
