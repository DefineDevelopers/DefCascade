#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;

if (($#ARGV + 1) == 0)
{
	print "Usage: perl main.pl <file_name1> <file_name2> ... \n";
	exit 1;
}

my $file_name;
my $new_file_name;
my $input_unit;
my $output_unit;
my $multiplier;

print("Print unit name which is in input-css-file\n");
$input_unit = <STDIN>;

print("Print unit name which will be in output-css-file\n");
$output_unit = <STDIN>;

print('Print how many ',substr($output_unit, 0, -1), ' are now in one ', $input_unit);
$multiplier = <STDIN>;

chomp($input_unit,$output_unit,$multiplier);

unless ($input_unit =~ m/^[a-z]+$/ && $output_unit =~ m/^[a-z]+$/ && $multiplier =~ m/^\d+(\.\d+)?$/)
{
	print("bad unit/multiplier name. Closing\n");
	exit 2;
}

foreach $file_name (@ARGV)
{
	open(INPUTFILE,'<',$file_name) or die "can't open $file_name : $!\n";
	$new_file_name = 'D' . basename($file_name);
		open(OUTPUTFILE,'>',$new_file_name) or die "can't open $file_name : $!\n";
		
			foreach (<INPUTFILE>)
			{
				s/([.0-9]+)(\s*)$input_unit/(int($1*$multiplier*1000)\/1000).$output_unit/eg;
				print OUTPUTFILE;
			}

		close OUTPUTFILE;
	close INPUTFILE;
}
