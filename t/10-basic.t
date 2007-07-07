#!/usr/bin/perl
#
# $HeadURL: https://svn.oucs.ox.ac.uk/networks/src/debian/packages/libr/librpc-serialized-perl/trunk/t/15-rpc-serialized-config.t $
# $LastChangedRevision: 1300 $
# $LastChangedDate: 2007-07-04 18:50:01 +0100 (Wed, 04 Jul 2007) $
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
