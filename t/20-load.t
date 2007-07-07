#!/usr/bin/perl
#
# $HeadURL: https://svn.oucs.ox.ac.uk/networks/src/debian/packages/libr/librpc-serialized-perl/trunk/t/15-rpc-serialized-config.t $
# $LastChangedRevision: 1300 $
# $LastChangedDate: 2007-07-04 18:50:01 +0100 (Wed, 04 Jul 2007) $
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
like( $@, qr/Max of two args, please read the docs/ );

eval {$m = ConfTest->new() };
isa_ok( $m, 'ConfTest' );
