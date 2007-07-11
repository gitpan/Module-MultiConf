#!/usr/bin/perl
#
# $HeadURL: https://svn.oucs.ox.ac.uk/networks/src/debian/packages/libr/libmodule-multiconf-perl/trunk/t/30-loadfile.t $
# $LastChangedRevision: 1313 $
# $LastChangedDate: 2007-07-07 21:10:33 +0100 (Sat, 07 Jul 2007) $
# $LastChangedBy: oliver $
#

use strict;
use warnings FATAL => 'all';

use Test::More tests => 7;

use File::Temp 'tempfile';
use Data::Dumper;
$Data::Dumper::Terse = 1;

package ConfTest;
Test::More::use_ok( 'Module::MultiConf' );
package main;

sub mk_config {
    my $config = shift;
    my ( $fh, $path ) = tempfile( UNLINK => 1 );
    $fh->print( Dumper $config );
    $fh->close();
    return $path;
}

sub test_config {
    my ( $config, $msg ) = @_;
    my $path = mk_config($config);
    my $c = eval { ConfTest->new($path) };
    if ($@) {
        like( $@, qr/$msg/ );
    }
    else {
        isa_ok( $c, 'ConfTest' );
    }
    return $c;
}

my %config = (
    acl_path     => 'nuffink',
    server_class => 'pots',
    handlers     => {kettle => 'yellow'}
);

test_config( \%config, 'Loaded config must be a HASHREF of HASHREFs' );

%config = ( config => { %config } );
my $c = test_config( \%config, '' );

can_ok( $c, 'config' );
is( $c->config->{acl_path}, 'nuffink', 'config content 1' );
is( $c->config->{server_class}, 'pots', 'config content 2' );
is( $c->config->{handlers}->{kettle}, 'yellow', 'config content 3' );
