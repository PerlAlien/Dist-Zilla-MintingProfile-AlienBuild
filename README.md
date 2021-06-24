# Dist::Zilla::MintingProfile::AlienBuild ![linux](https://github.com/PerlAlien/Dist-Zilla-MintingProfile-AlienBuild/workflows/linux/badge.svg)

A minimal Dist::Zilla minting profile for Aliens

# SYNOPSIS

```
dzil new -P AlienBuild Alien::libfoo
```

# DESCRIPTION

This is a [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) minting profile for creating [Alien](https://metacpan.org/pod/Alien) distributions
based on the [Alien::Build](https://metacpan.org/pod/Alien::Build) framework.  It uses a reasonable template and the
[\[@Starter\]](https://metacpan.org/pod/Dist::Zilla::PluginBundle::AlienBuild) or
[\[@Starter::Git\]](https://metacpan.org/pod/Dist::Zilla::PluginBundle::Starter::Git) bundle plus the
[\[AlienBuild\]](https://metacpan.org/pod/Dist::Zilla::Plugin::AlienBuild) plugin.

# SEE ALSO

- [Alien](https://metacpan.org/pod/Alien)
- [Alien::Build](https://metacpan.org/pod/Alien::Build)
- [alienfile](https://metacpan.org/pod/alienfile)
- [\[@Starter\]](https://metacpan.org/pod/Dist::Zilla::PluginBundle::Starter)
- [\[@Starter::Git\]](https://metacpan.org/pod/Dist::Zilla::PluginBundle::Starter::Git)
- [\[AlienBuild\]](https://metacpan.org/pod/Dist::Zilla::Plugin::AlienBuild)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
