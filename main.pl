use strict;
use warnings;

if (($#ARGV + 1) == 0)
{
	print "Usage: perl main.pl <file_name1> <file_name2> ... \n";
	exit 1;
}

my $file_name;

foreach $file_name (@ARGV)
{
	open(INPUTFILE,'<',$file_name) or die "can't open $file_name : $!";
		open(OUTPUTFILE,'>','D'."$file_name") or die "can't open $file_name : $!";


		#code


		close OUTPUTFILE;
	close INPUTFILE;
}
