use strict;
use warnings;
use 5.022;

package Alien::Build::Wizard::Chrome {

  use Moose;
  use experimental qw( signatures postderef );
  use Term::Clui ();
  use namespace::autoclean;

  # ABSTRACT: Wizard chrome

  sub ask ($self, $prompt, $default=undef) {
    $self->say($prompt);
    Term::Clui::ask("> ", $default);
  }

  sub choose ($self, $prompt, $options, $default=undef) {
    no warnings 'redefine';
    local *Term::Clui::get_default = sub {
      return undef unless defined $default && ref $default eq 'ARRAY';
      wantarray ? $default->@* : $default->[0];      ## no critic (Community::Wantarray)
    };
    Term::Clui::choose($prompt, $options->@*);
  }

  sub say ($self, $string) {
    CORE::say($string);
  }

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

