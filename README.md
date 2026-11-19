Gemfury CLI
===========

[![Tests](https://github.com/FreetimeMaker/gemfury-cli/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/FreetimeMaker/gemfury-cli/actions/workflows/tests.yml)

This repository is a fork of the [upstream Gemfury CLI](https://github.com/gemfury/cli),
a Go command-line tool for managing Gemfury packages. For command usage, see the
[Gemfury CLI documentation](https://gemfury.com/guide/cli/).

Gemfury is your personal cloud for your private and custom RubyGems, Python packages, and NPM
modules. Once you upload your packages and enable Gemfury as a source, you can securely deploy
any package to any host. It's simple, reliable, and hassle-free.

## Installation

This fork no longer includes the upstream GoReleaser workflow. The package
repositories and binary downloads below distribute the **upstream CLI**, not
builds of this fork.

### Building the fork

The local build target is `make fury`, which uses Go (the module requires Go
1.27.0) and writes `./fury` for the current platform. The module path in
`go.mod` is already `github.com/FreetimeMaker/gemfury-cli`, but Go source files
still import `github.com/gemfury/cli`. Those imports need to be aligned with the
module path before the fork can build.

### RPM packaging

`fury-cli.spec` packages a prebuilt `fury` binary for Linux x86_64 and installs
it as `/usr/bin/fury` on standard RPM systems. The spec does not build the
binary itself.

### Debian and Ubuntu (apt)

1. Download the .deb files or use the APT Repository:

```bash
sudo nano /etc/apt/sources.list.d/Freetime-Repo.list
```

then add:

```bash
deb [trusted=yes arch=amd64] https://https://repo.free-time.me/apt/
```

then run:

```bash
sudo apt update
sudo apt install fury-cli
```

### Fedora and CentOS (dnf)

1. Download the .rpm file or use the YUM Repository:

```bash
sudo nano /etc/yum.repos.d/Freetime-Repo.repo
```

then add:

```bash
[Freetime-Repo]
name=Freetime Repo
baseurl=https://repo.free-time.me/yum/
enabled=1
gpgcheck=0
```

then run:

```bash
sudo dnf install fury-cli
```

## Introduction to Gemfury

- [Gemfury homepage](https://gemfury.com/)
- [Getting started with Gemfury](https://gemfury.com/help/getting-started)

## Using Gemfury CLI

- [CLI documentation](https://gemfury.com/guide/cli/)
- [Uploading private packages](https://gemfury.com/guide/cli/basic-usage/)
- [Manage collaborators](https://gemfury.com/guide/cli/collaboration/)

For staging or local development, set `FURY_API_URL` to override the API
endpoint and `FURY_PUSH_URL` to override the upload endpoint. Each accepts a
hostname or a URL. If the URL includes a path, the CLI uses it as a prefix for
requests to that endpoint.

### Submitting updates

If you would like to contribute to this project, just do the following:

1. Fork the repo on Github.
2. Add your features and make commits to your forked repo.
3. Make a pull request to this repo.
4. Review will be done and changes will be requested.
5. Once changes are done or no changes are required, pull request will be merged.
6. The next release will have your changes in it.

Please take a look at the issues page if you want to get started.

### Feature requests

If you think it would be nice to have a particular feature that is presently not implemented, we would love
to hear that and consider working on it. Just open an issue in Github.

## Questions

Please file a Github Issue if you have any questions or problems.
