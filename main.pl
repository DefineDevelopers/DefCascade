#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;

if (($#ARGV + 1) != 1)
{
	print STDERR "USAGE: perl main.pl FILENAME\n";
	exit 1;
}

my $file_name;
my $new_file_name;
my $input_unit;
my $output_unit;
my $multiplier;


sub check_unit_name {
	my $unit = $_[0];
	unless ( $unit =~ m/^[a-z]+$/ ) { return; }
	return 1;
}

sub check_mul_num {
	my $mult = $_[0];
	unless ( $mult =~ m/^\d+(\.\d+)?$/ ) { return; }
	return 1;
}

print("Print unit name which is in input-css-file\n");
$input_unit = <STDIN>;

unless ( check_unit_name $input_unit ) {
	print("Invalid unit name. Closing\n");
	exit 2;
}

print("Print unit name which will be in output-css-file\n");
$output_unit = <STDIN>;

unless ( check_unit_name $output_unit ) {
	print("Invalid unit name. Closing\n");
	exit 2;
}

print('Print how many ',substr($output_unit, 0, -1), ' are now in one ', $input_unit);
$multiplier = <STDIN>;

chomp($input_unit,$output_unit,$multiplier);

unless ( check_mul_num $multiplier ) {
	print("Invalid multiplier name. Closing\n");
	exit 2;
}

open(INPUTFILE,'<',$ARGV[0]) or die "can't open $file_name : $!\n";
$new_file_name = 'D' . basename($ARGV[0]);

open(OUTPUTFILE,'>',$new_file_name) or die "can't open $file_name : $!\n";

foreach ( <INPUTFILE> )
{
	s/([.0-9]+)(\s*)$input_unit/(int($1*$multiplier*1000)\/1000).$output_unit/eg;
	print OUTPUTFILE;
}

close OUTPUTFILE;
close INPUTFILE;