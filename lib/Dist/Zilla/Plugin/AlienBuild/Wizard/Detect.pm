use strict;
use warnings;
use 5.020;

package Dist::Zilla::Plugin::AlienBuild::Wizard::Detect {

  use Moose;
  use Moose::Util::TypeConstraints;
  use namespace::autoclean;
  use constant myURI => "@{[ __PACKAGE__ ]}::URI";

  # ABSTRACT: Tarball detection class

  subtype myURI, as 'URI';

  coerce myURI, from 'Str', via {
    require URI;
    URI->new($_);
  };

  has uri => (
    is       => 'ro',
    isa      => myURI,
    required => 1,
    coerce   => 1,
  );

  __PACKAGE__->meta->make_immutable;

}

1;

=head1 SYNOPSIS

 % perldoc Dist::Zilla::MintingProfile::AlienBuild

=head1 DESCRIPTION

This class is private.

=head1 SEE ALSO

=over 4

=item L<Dist::Zilla::MintingProfile::AlienBuild>

=back

=cut
