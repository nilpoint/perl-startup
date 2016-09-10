# Perl Startup
Learn perl basics.

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