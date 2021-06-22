use strict;
use warnings;
use 5.020;

package Dist::Zilla::MintingProfile::AlienBuild {

  use Moose;
  with 'Dist::Zilla::Role::MintingProfile::ShareDir';
  use namespace::autoclean;

  # ABSTRACT: A minimal Dist::Zilla minting profile for Aliens

  __PACKAGE__->meta->make_immutable;
}

1;

=head1 SYNOPSIS

 dzil new -P AlienBuild Alien::libfoo

=head1 DESCRIPTION

This is a L<Dist::Zilla> minting profile for creating L<Alien> distributions
based on the L<Alien::Build> framework.  It uses a reasonable template and the
L<[@AlienBuild]|Dist::Zilla::PluginBundle::AlienBuild> bundle, which is itself
based on the L<[@Starter]|Dist::Zilla::PluginBundle::Starter> bundle.

=head1 SEE ALSO

=over 4

=item L<Alien>

=item L<Alien::Build>

=item L<alienfile>

=item L<[@AlienBuild]|Dist::Zilla::PluginBundle::AlienBuild>

=item L<[AlienBuild]|Dist::Zilla::Plugin::AlienBuild>

=back

=cut
