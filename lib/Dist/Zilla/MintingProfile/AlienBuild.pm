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

=head1 CAVEATS

This module indirectly requires both L<Alien::FFI> and L<Alien::Archive3>.  If
you do not want to build them from source, or do not have internet access where
the build is happening you will want to pre-install C<libffi> and C<libarchive>.
On Debian based systems, you can do that with
C<sudo apt-get update && sudo apt-get install libffi-dev libarchive-dev>.  Note
that libarchive 3.2.0 is required for a system install so if you have an older
Debian or Ubuntu system you should upgrade your operating system.

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
