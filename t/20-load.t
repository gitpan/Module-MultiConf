#!/usr/bin/perl
#
# $HeadURL: https://svn.oucs.ox.ac.uk/networks/src/debian/packages/libr/libmodule-multiconf-perl/trunk/t/20-load.t $
# $LastChangedRevision: 1320 $
# $LastChangedDate: 2007-07-08 18:31:35 +0100 (Sun, 08 Jul 2007) $
# $LastChangedBy: oliver $
#

use strict;
use warnings FATAL => 'all';

use Test::More tests => 3;

package ConfTest;
Test::More::use_ok( 'Module::MultiConf' );
package main;

my $m;
eval {$m = ConfTest->new(1,2,3) };
like( $@, qr/Failed to parse contents of filename/ );

eval {$m = ConfTest->new() };
isa_ok( $m, 'ConfTest' );
