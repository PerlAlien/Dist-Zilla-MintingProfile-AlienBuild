use strict;
use warnings;
use 5.022;

package Alien::Build::Wizard::Questions {

  use Exporter qw( import );
  use constant QUESTION_URL => 'Enter the full URL to the latest tarball (or zip, etc.) of the project you want to alienize.';

  # ABSTRACT: List of questions

  our @EXPORT_OK   = sort grep /^QUESTION/, keys %Alien::Build::Wizard::Questions::;
  our %EXPORT_TAGS = ( all => \@EXPORT_OK );

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

