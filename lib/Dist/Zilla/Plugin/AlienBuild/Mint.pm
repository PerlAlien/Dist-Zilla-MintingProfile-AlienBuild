use strict;
use warnings;
use 5.022;

package Dist::Zilla::Plugin::AlienBuild::Mint {

  use Moose;
  with 'Dist::Zilla::Role::FileGatherer', 'Dist::Zilla::Role::ModuleMaker';
  use experimental qw( signatures postderef );
  use Alien::Build::Wizard;
  use Dist::Zilla::File::InMemory;
  use namespace::autoclean;

  # ABSTRACT: Generate module and alienfile for use with Alien::Build

  has class_name => (
    is       => 'ro',
    isa      => 'Str',
    init_arg => undef,
    lazy     => 1,
    default  => sub ($self) {
      $self->zilla->name =~ s/-/::/gr;
    },
  );

  has generated_content => (
    is       => 'ro',
    isa      => 'HashRef[Str]',
    init_arg => undef,
    lazy     => 1,
    default  => sub ($self) {

      my $wizard = Alien::Build::Wizard->new(
        class_name => $self->class_name
      );

      my %files = $wizard->generate_content->%*;

      \%files;
    }
  );

  sub gather_files ($self)
  {
    my %files = $self->generated_content->%*;

    foreach my $filename (sort keys %files)
    {
      # TODO: needs updating if we have other generated
      # files in lib which we probably will not need.
      next if $filename =~ /^lib/;
      my $dz_filename = $filename;
      $self->log("making $filename from template");
      my $file = Dist::Zilla::File::InMemory->new({
        name => $dz_filename,
        content => $files{$filename},
      });
      $self->add_file($file);
    }
  }

  sub make_module ($self, $arg)
  {
    my %files = $self->generated_content->%*;
    $self->log_fatal("Confused by module filename") unless defined $arg->{name} ne $self->class_name;
    foreach my $filename (sort keys %files)
    {
      # TODO: needs updating if we have other generated
      # files in lib which we probably will not need.
      next unless $filename =~ /^lib/;
      my $dz_filename = $filename;
      $self->log("making module $filename from template");
      my $file = Dist::Zilla::File::InMemory->new({
        name => $dz_filename,
        content => $files{$filename},
      });
      $self->add_file($file);
    }

  }

  __PACKAGE__->meta->make_immutable;
}

1;

=head1 SYNOPSIS

 dzil new -P AlienBuild Alien::libfoo

=head1 DESCRIPTION

This plugin will prompt you for a number of details of your L<Alien>
and generate the appropriate Perl module and L<alienfile> files.
It is intended to be used with L<Dist::Zilla::MintingProfile::AlienBuild>,
but it can also be used by other minters that want this capability.

=head1 SEE ALSO

=over 4

=item L<Alien>

=item L<Alien::Build>

=item L<Dist::Zilla::MintingProfile::AlienBuild>

=item L<Dist::Zilla>

=back

=cut
