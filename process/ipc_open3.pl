#!/usr/bin/perl
# ipc_open3.pl
use IPC::Open3;

local(*HIS_IN, *HIS_OUT, *HIS_ERR);

my $cmd = "grep"; 
my @args = ("hello");

$childpid = open3(*HIS_IN, *HIS_OUT, *HIS_ERR, $cmd, @args); 
print HIS_IN "stuff\nhello world.\nHi, Tom.\nhello open3.";
close(HIS_IN);            # Give end of file to kid. 
@outlines = <HIS_OUT>;    # Read till EOF.
@errlines = <HIS_ERR>;    # XXX: block potential if massive 
print "STDOUT:\n", @outlines, "\n";
print "STDERR:\n", @errlines, "\n";
close HIS_OUT;
close HIS_ERR;

waitpid($childpid, 0);

if ($?) {
  print "That child exited with wait status of $?\n";
}