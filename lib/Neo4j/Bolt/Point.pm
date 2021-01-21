package Neo4j::Bolt::Point;
# ABSTRACT: Representation of Neo4j Point

$Neo4j::Bolt::Point::VERSION = '0.4201';

use strict;
use warnings;

use parent 'Neo4j::Types::Point';

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

This package inherits from L<Neo4j::Types::Point>, which offers an
object-oriented interface to the point's coordinates and metadata.
This is entirely optional to use.

=head1 METHODS

This package inherits all methods from L<Neo4j::Types::Point>.

=head1 SEE ALSO

L<Neo4j::Bolt>,
L<Neo4j::Types::Point>,
L<Cypher Manual: Spatial values|https://neo4j.com/docs/cypher-manual/current/syntax/spatial/>

=head1 AUTHOR

 Arne Johannessen
 CPAN: AJNN

=head1 LICENSE

This software is Copyright (c) 2021 by Arne Johannessen.

This is free software, licensed under:

  The Apache License, Version 2.0, January 2004

=cut
