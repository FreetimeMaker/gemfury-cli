# Changelog

All notable changes to the Gemfury CLI are documented here.

The project follows semantic versioning.

## Unreleased

No unreleased changes yet.

### V1.0.0 - 19.11.2026

- Added `fury-cli.spec` to package a prebuilt Linux x86_64 `fury` binary as an
  RPM. Local `fury.rpm` and `fury.deb` artifacts are ignored by Git.
- Removed the GoReleaser configuration and release workflow. The Makefile
  now builds only for the current platform with `make fury`; it no longer
  provides cross-build or cleanup recipes.
- Changed the Go module path to `github.com/FreetimeMaker/gemfury-cli` and
  updated several dependencies. Source imports still need to be migrated to
  the new module path before building.
- Changed the fallback CLI version from `dev` to `1.0.0`. The Makefile still
  sets the build version from Git.
