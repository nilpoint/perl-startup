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