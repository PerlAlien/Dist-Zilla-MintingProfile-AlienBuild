use Test2::V0 -no_srand => 1;
use Alien::Build::Wizard;

my %ask = (
  'What is the class name for your Alien?' => [ 'Alien::libfrooble', 'Alien::auto' ],
  'What is the human project name of the alienized package?' => [ 'libfrooble', 'auto' ],
  'Enter the full URL to the latest tarball (or zip, etc.) of the project you want to alienize.' => ['corpus/alien_build_wizard/auto-1.2.3.tar'],
  'Which pkg-config names (if any) should be used to detect system install?  You may space separate multiple names.' => ['baz frooble', 'bar foo'],
);

my %choose = (
  'Choose build system.' => ['cmake','autoconf'],
);

package Alien::Build::Wizard::Chrome {

  use Moose;
  use experimental qw( signatures );
  use namespace::autoclean;

  sub ask ($self, $prompt, $default=undef) {
    die "bad self" unless ref $self eq 'Alien::Build::Wizard::Chrome';
    Test2::V0::note(" [ask] $prompt");
    Test2::V0::note(" [default] $default") if defined $default;
    die "unknown prompt: $prompt" unless $ask{$prompt};
    my $expected_default = $ask{$prompt}->[1];
    die "unexpected default: $default (expected $expected_default)" if defined $expected_default && $expected_default ne $default;
    my $answer = $ask{$prompt}->[0] // $default;
    Test2::V0::note(" > $answer");
    $answer;
  }

  sub choose ($self, $prompt, $options, $default=undef) {
    die "bad self" unless ref $self eq 'Alien::Build::Wizard::Chrome';
    Test2::V0::note(" [choose] $prompt");
    Test2::V0::note(" [options] @{$options}");
    Test2::V0::note(" [default] $default") if defined $default;
    die "unknown prompt: $prompt" unless $choose{$prompt};
    my $expected_default = $choose{$prompt}->[1];
    die "unexpected default: $default (expected $expected_default)" if defined $expected_default && $expected_default ne $default;
    my $answer = $choose{$prompt}->[0] // $default;
    Test2::V0::note(" > $answer");
    $answer;
  }

  sub say ($self, $string) {
    Test2::V0::note(" [say] $string");
  }

}

is(
  Alien::Build::Wizard->new,
  object {
    call [ isa => 'Alien::Build::Wizard' ] => T();
    call detect => object {
      call [ isa => 'Alien::Build::Wizard::Detect' ] => T();
    };
    call class_name => 'Alien::libfrooble';
    call human_name => 'libfrooble';
    call pkg_names => ['baz','frooble'];
    call build_type => 'cmake';
    call generate_content => hash {
      field 'Alien/libfrooble.pm' => match qr/^package Alien::libfrooble;/;
      field 'alienfile'           => match qr/^use alienfile;/;
      end;
    };
  },
);

done_testing;
