use strict;
use warnings;
use 5.022;

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
L<[@Starter]|Dist::Zilla::PluginBundle::Starter> or
L<[@Starter::Git]|Dist::Zilla::PluginBundle::Starter::Git> bundle plus the
L<[AlienBuild]|Dist::Zilla::Plugin::AlienBuild> plugin.

=head1 SEE ALSO

=over 4

=item L<Alien>

=item L<Alien::Build>

=item L<alienfile>

=item L<[@Starter]|Dist::Zilla::PluginBundle::Starter>

=item L<[@Starter::Git]|Dist::Zilla::PluginBundle::Starter::Git>

=item L<[AlienBuild]|Dist::Zilla::Plugin::AlienBuild>

=back

=cut
