use strict;
use warnings;
use 5.022;

package Dist::Zilla::Plugin::AlienBuild::Wizard::Detect {

  use Moose;
  use Moose::Util::TypeConstraints;
  use experimental qw( signatures );
  use namespace::autoclean;
  use constant myURI => "@{[ __PACKAGE__ ]}::URI";

  # ABSTRACT: Tarball detection class

  subtype myURI, as 'URI';

  coerce myURI, from 'Str', via {
    require URI;
    state $base ||= do {
      require URI::file;
      my $base = URI->new(URI::file->cwd);
      $base->host("localhost");
      $base;
    };
    URI->new_abs($_, $base);
  };

  has uri => (
    is       => 'ro',
    isa      => myURI,
    required => 1,
    coerce   => 1,
  );

  has ua => (
    is      => 'ro',
    isa     => 'LWP::UserAgent',
    lazy    => 1,
    default => sub {
      require LWP::UserAgent;
      my $ua = LWP::UserAgent->new;
      $ua->env_proxy;
      $ua;
    },
  );

  has tarball => (
    is      => 'ro',
    lazy    => 1,
    isa     => 'ScalarRef[Str]',
    default => sub ($self) {
      my $ua = $self->ua;
      my $res = $ua->get($self->uri);
      die $res->status_line
        unless $res->is_success;
      \$res->decoded_content;
    },
  );

  has build_type => (
    is      => 'ro',
    isa     => 'ArrayRef[Str]',
    lazy    => 1,
    default => sub ($self) {

      my %types;

      require Archive::Libarchive::Peek;
      foreach my $file (map { Path::Tiny->new($_) } Archive::Libarchive::Peek->new( memory => $self->tarball )->files)
      {
        $types{autoconf} = 1 if $file->basename eq 'configure';
        $types{cmake} = 1    if $file->basename eq 'CMakeLists.txt';
        $types{make} = 1     if $file->basename eq 'Makefile';
      }

      [sort keys %types];
    },
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
