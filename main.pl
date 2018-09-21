#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;

if (($#ARGV + 1) != 1)
{
	print STDERR "USAGE: perl main.pl FILENAME\n";
	exit 1;
}

open(INPUTFILE,'<',$ARGV[0]) or die "can't open $ARGV[0] : $!\n";

my $new_file_path;
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
chomp($input_unit);
unless ( check_unit_name $input_unit ) { print("Invalid unit name. Closing\n"); exit 2; }

print("Print unit name which will be in output-css-file\n");
$output_unit = <STDIN>;
chomp($output_unit);
unless ( check_unit_name $output_unit ) { print("Invalid unit name. Closing\n"); exit 2; }

print('Print how many ', $output_unit, ' are now in one ', $input_unit, "\n");
$multiplier = <STDIN>;
chomp($multiplier);
unless ( check_mul_num $multiplier ) { print("Invalid multiplier name. Closing\n"); exit 2; }

print("Print new file path\n");
$new_file_path = <STDIN>;
chomp($new_file_path);
open(OUTPUTFILE,'>',$new_file_path) or die "can't open $new_file_path : $!\n";

foreach ( <INPUTFILE> )
{
	s/([.0-9]+)(\s*)$input_unit/(int($1*$multiplier*1000)\/1000).$output_unit/eg;
	print OUTPUTFILE;
}

close OUTPUTFILE;
close INPUTFILE;