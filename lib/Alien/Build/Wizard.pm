use strict;
use warnings;
use 5.022;

package Alien::Build::Wizard {

  use Moose;
  use Moose::Util::TypeConstraints;
  use MooseX::StrictConstructor;
  use experimental qw( signatures postderef );
  use Data::Section::Simple qw( get_data_section );
  use namespace::autoclean;

  has detect => (
    is       => 'ro',
    isa      => 'Alien::Build::Wizard::Detect',
    lazy     => 1,
    default => sub ($self) {
      for(1..20)
      {
        my $url = $self->chrome->ask('Enter the full URL to the latest tarball (or zip, etc.) of the project you want to alienize.');

        if($url eq '')
        {
          $self->chrome->say("URL is required");
          next;
        }

        require Alien::Build::Wizard::Detect;
        my $detect = eval { Alien::Build::Wizard::Detect->new( uri => $url ) };
        if(my $error = $@)
        {
          $self->chrome->say("there appears to have been a problem fetching or detecting that tarball.");
          $self->chrome->say("$error");
        }
        else
        {
          return $detect;
        }
      }
      die "Bailing unable to get good input";
    },
  );

  has chrome => (
    is      => 'ro',
    isa     => 'Alien::Build::Wizard::Chrome',
    lazy    => 1,
    default => sub ($self) {
      require Alien::Build::Wizard::Chrome;
      Alien::Build::Wizard::Chrome->new;
    },
  );

  has class_name => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub ($self) {
      $self->chrome->ask('What is the class name for your Alien?', 'Alien::' . $self->detect->name);
    },
  );

  has human_name => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub ($self) {
      $self->chrome->ask('What is the human project name of the alienized package?', $self->detect->name);
    },
  );

  has pkg_names => (
    is      => 'ro',
    isa     => 'ArrayRef[Str]',
    lazy    => 1,
    default => sub ($self) {
      [split /\s+/, $self->chrome->ask('Which pkg-config names (if any) should be used to detect system install?  You may space separate multiple names.', join ' ', $self->detect->pkg_config->@*)];
    },
  );

  has build_type => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub ($self) {
      my @types = $self->detect->build_type->@*;
      if(@types == 0)
      {
        $self->chrome->say("Unable to detect build system used by the package.  You can select manual to specify the build commands directly, or select one of the standard build systems");
      }
      elsif(@types == 1)
      {
        $self->chrome->say("The build system was detected as $types[0]; that is probably correct");
      }
      else
      {
        $self->chrome->say("Multiple build systems were detected in the tarball; select the most reliable one of: @types");
      }
      my $default = $types[0];
      $self->chrome->choose("Choose build system.", ['manual','autoconf','cmake','make'], $types[0]);
    },
  );

  sub generate_content ($self)
  {
    my %files;

    require Template;
    my $tt = Template->new;

    {
      my $pm = $self->class_name . ".pm";
      $pm =~ s{::}{/};
      my $template = get_data_section 'Module.pm';
      $template =~ s/\s+$/\n/;
      die "no template Module.pm" unless $template;
      $tt->process(\$template, { wizard => $self }, \($files{$pm} = '')) or die $tt->error;
    }

    foreach my $path (qw( alienfile ))
    {
      my $template = get_data_section $path;
      $template =~ s/\s+$/\n/;
      die "no template $path" unless $template;
      $tt->process(\$template, { wizard => $self }, \($files{$path} = '')) or die $tt->error;
    }

    \%files;
  }

}

package Alien::Build::Wizard;

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

__DATA__

@@ Module.pm
package [% wizard.class_name %];

use strict;
use warnings;
use base qw( Alien::Base );
use 5.008004;

1;

@@ alienfile
use alienfile;
