use Test2::V0 -no_srand => 1;
use Dist::Zilla::Plugin::AlienBuild::Wizard::Detect;

is(
  Dist::Zilla::Plugin::AlienBuild::Wizard::Detect->new(
    uri => "file://localhost/foo/bar/baz",
  ),
  object {
    call [ isa => 'Dist::Zilla::Plugin::AlienBuild::Wizard::Detect' ] => T();
    call uri => object {
      call [ isa => 'URI' ] => T();
      call scheme => 'file';
      call host => 'localhost';
      call path => '/foo/bar/baz';
    };
  },
);

done_testing;
