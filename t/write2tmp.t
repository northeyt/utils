#!/usr/bin/perl -Iblib/lib -Iblib/arch -I../blib/lib -I../blib/arch
# 
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl write2tmp.t'

# Test file created outside of h2xs framework.
# Run this like so: `perl write2tmp.t'
#   Tom Northey <zcbtfo4@acrm18>     2013/09/25 11:36:05

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Data::Dumper;

use Test::More qw( no_plan );
use Test::Deep;

use lib ( '..' );
BEGIN { use_ok( 'write2tmp' ); }

#########################

# Insert your test code below, the Test::More module is used here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @data = qw ( Q W E R T Y );

my $tmp = write2tmp->new( suffix => '.dat',
                       data   => [@data], );

my $fname = $tmp->file_name;

is(ref write2tmp->Cache->[0], 'File::Temp',
   'Cache catching File::Temp objects');

undef $tmp;

is(ref write2tmp->Cache->[0], 'File::Temp',
   'Cache retains objects when write2tmp object is undef');


