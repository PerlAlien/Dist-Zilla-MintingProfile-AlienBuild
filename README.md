# Dist::Zilla::MintingProfile::AlienBuild ![static](https://github.com/PerlAlien/Dist-Zilla-MintingProfile-AlienBuild/workflows/static/badge.svg) ![linux](https://github.com/PerlAlien/Dist-Zilla-MintingProfile-AlienBuild/workflows/linux/badge.svg)

A minimal Dist::Zilla minting profile for Aliens

# SYNOPSIS

```
dzil new -P AlienBuild Alien::libfoo
```

# DESCRIPTION

This is a [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) minting profile for creating [Alien](https://metacpan.org/pod/Alien) distributions
based on the [Alien::Build](https://metacpan.org/pod/Alien::Build) framework.  It uses a reasonable template and the
[\[@Starter\]](https://metacpan.org/pod/Dist::Zilla::PluginBundle::Starter) or
[\[@Starter::Git\]](https://metacpan.org/pod/Dist::Zilla::PluginBundle::Starter::Git) bundle plus the
[\[AlienBuild\]](https://metacpan.org/pod/Dist::Zilla::Plugin::AlienBuild) plugin.

# CAVEATS

This module indirectly requires both [Alien::FFI](https://metacpan.org/pod/Alien::FFI) and [Alien::Archive3](https://metacpan.org/pod/Alien::Archive3).  If
you do not want to build them from source, or do not have internet access where
the build is happening you will want to pre-install `libffi` and `libarchive`.
On Debian based systems, you can do that with
`sudo apt-get update && sudo apt-get install libffi-dev libarchive-dev`.  Note
that libarchive 3.2.0 is required for a system install so if you have an older
Debian or Ubuntu system you should upgrade your operating system.

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

This software is copyright (c) 2021-2022 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
