Name:           fury-cli
Version:        1.0.0
Release:        1%{?dist}
Summary:        Gemfury command-line interface
License:        GPLv3
URL:            https://github.com/FreetimeMaker/gemfury-cli
BuildArch:      x86_64

Source0:        fury

%description
Native Gemfury command-line interface built with Go.

%prep

%build

%install
install -Dm755 %{SOURCE0} %{buildroot}%{_bindir}/fury

%files
%{_bindir}/fury

%changelog
* Thu Nov 19 2026 Freetime Maker <FreetimeMaker@proton.me> - 1.0.0-1
- Initial RPM package
