#!/usr/bin/perl
#
# $HeadURL: https://svn.oucs.ox.ac.uk/networks/src/debian/packages/libr/librpc-serialized-perl/trunk/t/15-rpc-serialized-config.t $
# $LastChangedRevision: 1300 $
# $LastChangedDate: 2007-07-04 18:50:01 +0100 (Wed, 04 Jul 2007) $
# $LastChangedBy: oliver $
#

use strict;
use warnings FATAL => 'all';

use Test::More tests => 5;

package ConfTest;
use Module::MultiConf;
ConfTest->Validate({
    log_dispatch_syslog => {
        name      => { type => SCALAR, default => 'rpc-serialized' },
        min_level => { default => 'debug' },
        facility  => { default => 'local0' },
        callbacks => { default => sub { return "$_[1]\n" } },
    },
    rpc_serialized => {
        debug => { default => 0 },
        trace => { default => 0 },
    },
});

ConfTest->Force({
    data_serializer => {
        portable => 1,
    },
});
package main;

my $c = ConfTest->new;
ok( ! $@, "Tried to load itself: $@" );
isa_ok( $c, 'ConfTest' );

package ConfTest;
ConfTest->Defaults->{allow_extra} = 0;
package main;

$c = $c->parse($c);
ok( ! $@, "Tried to load itself: $@" );
isa_ok( $c, 'ConfTest' );

eval { $c = $c->parse({rpc_serialized => {new_test => 1}}) };
like( $@, qr/The following parameter was passed in the call.+but was not listed in the validation options: new_test/ );

