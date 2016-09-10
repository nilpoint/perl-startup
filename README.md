# Perl Startup
Learn perl basics.

## Arrays

### Get the last index of an array

```perl
#!/usr/bin/perl
# array_lastindex.pl

my @colors = ( "red", "yellow", "blue", "green" );
print "$#colors\n";

my @empty = ();
print "$#empty\n";
```

## Logging

### Install Log4perl

```bash
# For Centos 6
$ sudo yum update
$ sudo yum install perl-Log-Log4perl
```

### Log information to a file

```perl
#!/usr/bin/perl
# log4perl_easy2.pl

use Log::Log4perl qw(:easy);

Log::Log4perl->easy_init(
  {
    level => $DEBUG,
    file => ">> /var/log/perllog",
  },
);

DEBUG( "Write something to a log file." );
```

## Process Management and Communication

### Controlling the Input, Output, and Error of Another Program

```
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

```