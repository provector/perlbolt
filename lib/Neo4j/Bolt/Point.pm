package Neo4j::Bolt::Point;
# ABSTRACT: Representation of Neo4j Point

$Neo4j::Bolt::Point::VERSION = '0.4200';

use strict;
use warnings;

sub new {
	my $class = shift;
	return bless \@_, $class;
}

1;

__END__

=head1 NAME

Neo4j::Bolt::Point - Representation of a Neo4j Point

=head1 SYNOPSIS

 $q = 'RETURN point({ x:3, y:4 })';
 $point = ( $cxn->run_query($q)->fetch_next )[0];
 
 $neo4j_srid = $point->[0];
 $x = $point->[1];  # longitude
 $y = $point->[2];  # latitude
 $z = $point->[3];  # height
 
 # use shift to get 0-based coordinate indices
 @coordinates = @$point;
 $neo4j_srid  = shift @coordinates;
 $x = $coordinates[0];
 $y = $coordinates[1];
 $z = $coordinates[2];

=head1 DESCRIPTION

L<Neo4j::Bolt::Point> instances are typically created by executing
a Cypher query that returns spatial values from a Neo4j database.
They can also be created using C<new()> and sent to Neo4j as Cypher
parameters. Their coordinates and SRID can be accessed as shown in
the synopsis above.

=head1 METHODS

=over

=item new()

 $point2d = Neo4j::Bolt::Point->new( $neo4j_srid, $x, $y );
 $point3d = Neo4j::Bolt::Point->new( $neo4j_srid, $x, $y, $z );

Creates a new Point instance locally. Points can be used as Cypher
parameter in statements sent to Neo4j). The new object will be
initialized with any arguments provided.

=back

=head1 SEE ALSO

L<Neo4j::Bolt>,
L<Cypher Manual: Spatial values|https://neo4j.com/docs/cypher-manual/current/syntax/spatial/>

=head1 AUTHOR

 Arne Johannessen
 CPAN: AJNN

=head1 LICENSE

This software is Copyright (c) 2021 by Arne Johannessen.

This is free software, licensed under:

  The Apache License, Version 2.0, January 2004

=cut
