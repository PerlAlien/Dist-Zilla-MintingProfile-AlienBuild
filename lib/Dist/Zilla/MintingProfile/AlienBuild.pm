use strict;
use warnings;
use 5.020;
use experimental qw( postderef );

package Dist::Zilla::MintingProfile::AlienBuild {

  use Moose;
  use namespace::autoclean;

  # ABSTRACT: A minimal Dist::Zilla minting profile for Aliens

  __PACKAGE__->meta->make_immutable;
}

1;


