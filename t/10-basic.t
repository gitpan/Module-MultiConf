#!/usr/bin/perl
#
# $HeadURL: https://svn.oucs.ox.ac.uk/networks/src/debian/packages/libr/libmodule-multiconf-perl/trunk/t/10-basic.t $
# $LastChangedRevision: 1313 $
# $LastChangedDate: 2007-07-07 21:10:33 +0100 (Sat, 07 Jul 2007) $
# $LastChangedBy: oliver $
#

use strict;
use warnings FATAL => 'all';

use Test::More tests => 10;

package ConfTest;
Test::More::use_ok( 'Module::MultiConf' );
package main;

can_ok( 'ConfTest', 'import' );
can_ok( 'ConfTest', 'new' );
can_ok( 'ConfTest', 'parse' );
can_ok( 'ConfTest', 'me' );
can_ok( 'ConfTest', 'Validate' );
can_ok( 'ConfTest', 'Force' );
can_ok( 'ConfTest', 'Defaults' );
can_ok( 'ConfTest', 'SCALAR' );
can_ok( 'ConfTest', 'OBJECT' );
