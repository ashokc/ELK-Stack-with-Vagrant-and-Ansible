#!/usr/bin/perl -w
use strict ;
no warnings 'once';
my @codes = qw (fatal error warning info debug trace) ;
open(my $fh, ">>", "/tmp/custom.log") ;
$fh->autoflush(1);
my $now = time();
for my $i (1 .. 100) {
  my $message0 = "Type: CustomLog: This is a generic message # $i for testing ELK" ;
  my $nDays = int(rand(5)) ;
  my $nHrs = int(rand(24)) ;
  my $nMins = int(rand(60)) ;
  my $nSecs = int(rand(60)) ;
  my $timeValue = $now - $nDays * 86400 - $nHrs * 3600 - $nMins * 60 - $nSecs ;
  my $now1 = localtime($timeValue) ;
  my $nMulti = int(rand(10)) ;
  my $message = "$now1 $nDays:$nHrs:$nMins:$nSecs $nMulti:$codes[int(rand($#codes))] $message0" ;
  if ($nMulti > 0) {
    for my $line (1 .. $nMulti) {
       $message = $message . "\n ++ continuing the previous line for this log error..."
    }
  }
  print $fh "$message\n" ;
}
close $fh ;

